import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/stock_item_search_conditions.dart';
import 'package:amasearch/models/stock_item_filter.dart';
import 'package:amasearch/pages/stocks/search_page/analytics.dart';
import 'package:amasearch/pages/stocks/search_page/values.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/custom_validator.dart';
import 'package:amasearch/widgets/form.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:flutter/material.dart';
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
    fulfilmentChannelField: FormControl<FulfilmentChannel>(
      value: FulfilmentChannel.all,
    ),
    purchasePriceLowerField: ["", positiveNumberOrEmpty],
    purchasePriceUpperField: ["", positiveNumberOrEmpty],
    sellPriceLowerField: ["", positiveNumberOrEmpty],
    sellPriceUpperField: ["", positiveNumberOrEmpty],
    purchaseDateRangeField: FormControl<DateTimeRange>(),
    retailerField: "",
  }),
);

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

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
  const _Body();

  static const _labelPadding = EdgeInsets.fromLTRB(16, 16, 16, 8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(formValueProvider);
    final filter = ref.watch(currentStockItemFilterProvider);
    final theme = Theme.of(context);
    final smallSize = smallFontSize(context);
    final isPaidUser = ref.watch(isPaidUserProvider);

    final retailers = ref.watch(
      generalSettingsControllerProvider.select((value) => value.retailers),
    );

    return Column(
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
                    hintText: "商品名、ASIN、JAN、SKU",
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  onTapOutside: onTapOutside,
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
                          child: Text(e.displayString),
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
                          child: Text(e.displayString),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: _labelPadding,
                child: Text("発送方法", style: smallSize),
              ),
              ListTile(
                title: ReactiveDropdownField(
                  formControlName: fulfilmentChannelField,
                  hint: const Text("発送方法"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: FulfilmentChannel.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.displayString),
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
              ListTile(
                title: RangeTextField(
                  form: form,
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
              ListTile(
                title: RangeTextField(
                  form: form,
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
              Padding(
                padding: _labelPadding,
                child: Text(
                  "仕入れ先",
                  style: smallSize,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField<String>(
                        formControlName: retailerField,
                        decoration: const InputDecoration(
                          hintText: "仕入れ先",
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        onTapOutside: onTapOutside,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: () async {
                        final form = ReactiveForm.of(context)! as FormGroup;
                        final ret = await showConfirmationDialog(
                          context: context,
                          title: "仕入先の選択",
                          initialSelectedActionKey:
                              form.control(retailerField).value,
                          actions: [
                            for (final retailer in retailers)
                              AlertDialogAction(
                                key: retailer,
                                label: retailer,
                              ),
                          ],
                        );
                        if (ret != null) {
                          form.control(retailerField).value = ret;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: ReactiveFormConsumer(
            builder: (context, formGroup, child) {
              Future<void> onPressed() async {
                if (!isPaidUser) {
                  await showUnpaidDialog(context);
                  return;
                }
                var dateRange =
                    getNullableDateRange(form, purchaseDateRangeField);
                if (dateRange != null) {
                  dateRange = DateTimeRange(
                    start: dateRange.start,
                    end: dateRange.end.add(
                      const Duration(days: 1), // end に指定した日を含めるために1日追加する
                    ),
                  );
                }
                final f = filter.copyWith(
                  keyword: getNullableString(form, keywordField),
                  listingState: getListingState(form),
                  productCondition: getProductCondition(form),
                  channel: getFulfilmentChannel(form),
                  purchasePriceLower:
                      getNullableInt(form, purchasePriceLowerField),
                  purchasePriceUpper:
                      getNullableInt(form, purchasePriceUpperField),
                  sellPriceLower: getNullableInt(form, sellPriceLowerField),
                  sellPriceUpper: getNullableInt(form, sellPriceUpperField),
                  purchaseDateRange: dateRange,
                  retailer: getNullableString(form, retailerField),
                );
                ref.read(currentStockItemFilterProvider.notifier).state = f;
                final params = createSearchParam(f);
                if (params.isNotEmpty) {
                  unawaited(
                    ref
                        .read(analyticsControllerProvider)
                        .logSearchStockItemEvent(params),
                  );
                }
                Navigator.pop(context);
              }

              return ElevatedButton(
                onPressed: form.invalid ? null : onPressed,
                child: const WithLockIconIfNotPaid(
                  mainAxisAlignment: MainAxisAlignment.center,
                  child: Text("検索"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
