import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/models/enums/listing_state.dart';
import 'package:amasearch/models/enums/product_condition.dart';
import 'package:amasearch/models/stock_item_filter.dart';
import 'package:amasearch/pages/stocks/search_page/values.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/custom_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as base;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

final formValueProvider = StateProvider(
  (ref) => fb.group(<String, Object>{
    keywordField: "",
    listingStateField: FormControl<ListingState>(
      value: ListingState.all,
    ),
    productConditionField: FormControl<ProductCondition>(
      value: ProductCondition.all,
    ),
    purchasePriceLowerField: ["", positiveNumberOrEmpty],
    purchasePriceUpperField: ["", positiveNumberOrEmpty],
    sellPriceLowerField: ["", positiveNumberOrEmpty],
    sellPriceUpperField: ["", positiveNumberOrEmpty],
    purchaseDateRangeField: FormControl<DateTimeRange>(),
  }),
);

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const String routeName = "/stocks/search";
  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SearchPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(formValueProvider);

    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("商品を検索"),
          actions: [
            TextButton(
              onPressed: () async {
                final ret = await showOkCancelAlertDialog(
                  context: context,
                  message: "設定している検索条件を全てクリアしますか？",
                );
                if (ret != OkCancelResult.ok) {
                  return;
                }
                // 全てのフィールドがデフォルト値ではなく null になるため注意
                form.reset();
                ref.read(currentStockItemFilterProvider.notifier).state =
                    const StockItemFilter();
              },
              child: const Text("全てクリア"),
            ),
          ],
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  static const _labelPadding = EdgeInsets.fromLTRB(16, 16, 16, 8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(formValueProvider);
    final filter = ref.watch(currentStockItemFilterProvider);
    final theme = Theme.of(context);
    final smallSize = smallFontSize(context);

    return _Unfocus(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: _labelPadding,
                  child: Text(
                    "キーワード",
                    style: smallSize,
                  ),
                ),
                ListTile(
                  title: ReactiveTextField<String>(
                    formControlName: keywordField,
                    decoration: const InputDecoration(
                      hintText: "商品名、ASIN、JAN",
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: _labelPadding,
                  child: Text("出品状況", style: smallSize),
                ),
                ListTile(
                  title: ReactiveDropdownField(
                    formControlName: listingStateField,
                    hint: const Text("出品状況"),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    items: ListingState.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toDisplayString()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: _labelPadding,
                  child: Text("商品コンディション", style: smallSize),
                ),
                ListTile(
                  title: ReactiveDropdownField(
                    formControlName: productConditionField,
                    hint: const Text("商品コンディション"),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    items: ProductCondition.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toDisplayString()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: _labelPadding,
                  child: Text(
                    "仕入れ価格",
                    style: smallSize,
                  ),
                ),
                const ListTile(
                  title: _PriceRangeTextField(
                    lowerControlName: purchasePriceLowerField,
                    upperControlName: purchasePriceUpperField,
                  ),
                ),
                Padding(
                  padding: _labelPadding,
                  child: Text(
                    "販売価格",
                    style: smallSize,
                  ),
                ),
                const ListTile(
                  title: _PriceRangeTextField(
                    lowerControlName: sellPriceLowerField,
                    upperControlName: sellPriceUpperField,
                  ),
                ),
                Padding(
                  padding: _labelPadding,
                  child: Text(
                    "仕入れ日",
                    style: smallSize,
                  ),
                ),
                ListTile(
                  title: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: theme.brightness == Brightness.dark
                          ? theme.colorScheme
                          : theme.colorScheme.copyWith(
                              onPrimary: Colors.black,
                            ),
                    ),
                    child: Builder(
                      builder: (context) {
                        return ReactiveDateRangePicker(
                          formControlName: purchaseDateRangeField,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          decoration: const InputDecoration(
                            labelText: '仕入れ日',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                            isDense: true,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                Future<void> _onPressed() async {
                  ref.read(currentStockItemFilterProvider.notifier).state =
                      filter.copyWith(
                    keyword: getNullableString(form, keywordField),
                    listingState: getListingState(form),
                    productCondition: getProductCondition(form),
                    purchasePriceLower:
                        getNullableInt(form, purchasePriceLowerField),
                    purchasePriceUpper:
                        getNullableInt(form, purchasePriceUpperField),
                    sellPriceLower: getNullableInt(form, sellPriceLowerField),
                    sellPriceUpper: getNullableInt(form, sellPriceUpperField),
                    purchaseDateRange:
                        getNullableDateRange(form, purchaseDateRangeField),
                  );
                  Navigator.pop(context);
                }

                return ElevatedButton(
                  onPressed: form.invalid ? null : _onPressed,
                  child: const Text("検索"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRangeTextField extends HookConsumerWidget {
  const _PriceRangeTextField({
    Key? key,
    required this.lowerControlName,
    required this.upperControlName,
  }) : super(key: key);

  final String lowerControlName;
  final String upperControlName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(formValueProvider);
    final theme = Theme.of(context);

    final borderColor =
        theme.brightness == Brightness.light ? Colors.black54 : Colors.white54;

    final lowerFocusNode = useFocusNode();
    final upperFocusNode = useFocusNode();
    final lowerController = useTextEditingController();
    final upperController = useTextEditingController();

    lowerFocusNode.addListener(() {
      final text = lowerController.text;
      if (!lowerFocusNode.hasFocus || text == "") {
        return;
      }
      lowerController.value = lowerController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });

    upperFocusNode.addListener(() {
      final text = upperController.text;
      if (!upperFocusNode.hasFocus || text == "") {
        return;
      }
      upperController.value = upperController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.inputDecorationTheme.fillColor,
        border: Border.all(
          color: borderColor,
          // style: BorderStyle.none,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ReactiveTextField<String>(
              formControlName: lowerControlName,
              controller: lowerController,
              focusNode: lowerFocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "下限",
                suffix: Text("円"),
                isDense: true,
              ),
              validationMessages: {
                validationMessagePositiveNumberOrEmpty: (_) => "不正な値です",
              },
              onSubmitted: (control) => form.focus(upperControlName),
            ),
          ),
          const Center(
            child: Text(" ～ "),
          ),
          Expanded(
            child: ReactiveTextField<dynamic>(
              formControlName: upperControlName,
              controller: upperController,
              focusNode: upperFocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "上限",
                suffix: Text("円"),
                isDense: true,
              ),
              validationMessages: {
                validationMessagePositiveNumberOrEmpty: (_) => "不正な値です",
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({Key? key, this.child}) : super(key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return base.Listener(
      onPointerDown: (event) {
        ReactiveForm.of(context)?.unfocus();
      },
      child: child,
    );
  }
}
