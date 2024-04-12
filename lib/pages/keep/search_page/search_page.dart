import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/models/keep_item_filter.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/custom_validator.dart';
import 'package:amasearch/widgets/form.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'values.dart';

final formValueProvider = StateProvider(
  (ref) => fb.group(<String, Object>{
    keywordField: "",
    rankLowerField: ["", positiveNumberOrEmpty],
    rankUpperField: ["", positiveNumberOrEmpty],
    priorFbaField: true,
    newPriceLowerField: ["", positiveNumberOrEmpty],
    newPriceUpperField: ["", positiveNumberOrEmpty],
    usedPriceLowerField: ["", positiveNumberOrEmpty],
    usedPriceUpperField: ["", positiveNumberOrEmpty],
    keepDateRangeField: FormControl<DateTimeRange>(),
  }),
);

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  static const String routeName = "/keep/search";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SearchPage(),
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
                form.controls[priorFbaField]!.value = true;
                ref.read(currentKeepItemFilterProvider.notifier).state =
                    const KeepItemFilter();
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
    final filter = ref.watch(currentKeepItemFilterProvider);
    final theme = Theme.of(context);
    final smallSize = smallFontSize(context);

    final isPaidUser = ref.watch(isPaidUserProvider);

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
                    hintText: "商品名、ASIN、JAN、メモ",
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  onTapOutside: onTapOutside,
                ),
              ),
              Padding(
                padding: _labelPadding,
                child: Text(
                  "ランキング",
                  style: smallSize,
                ),
              ),
              ListTile(
                title: RangeTextField(
                  form: form,
                  lowerControlName: rankLowerField,
                  upperControlName: rankUpperField,
                  suffix: "位",
                ),
              ),
              Padding(
                padding: _labelPadding,
                child: Text(
                  "新品最安値",
                  style: smallSize,
                ),
              ),
              ListTile(
                title: RangeTextField(
                  form: form,
                  lowerControlName: newPriceLowerField,
                  upperControlName: newPriceUpperField,
                ),
              ),
              Padding(
                padding: _labelPadding,
                child: Text(
                  "中古最安値",
                  style: smallSize,
                ),
              ),
              ListTile(
                title: RangeTextField(
                  form: form,
                  lowerControlName: usedPriceLowerField,
                  upperControlName: usedPriceUpperField,
                ),
              ),
              ReactiveSwitchListTile(
                formControlName: priorFbaField,
                title: const Text("FBA 出品の価格のみを対象とする"),
              ),
              Padding(
                padding: _labelPadding,
                child: Text(
                  "追加日",
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
                        formControlName: keepDateRangeField,
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        decoration: const InputDecoration(
                          labelText: '追加日',
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
              Future<void> onPressed() async {
                if (!isPaidUser) {
                  await showUnpaidDialog(context);
                  return;
                }

                var dateRange = getNullableDateRange(form, keepDateRangeField);
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
                  rankLower: getNullableInt(form, rankLowerField),
                  rankUpper: getNullableInt(form, rankUpperField),
                  priorFba: form.control(priorFbaField).value as bool,
                  newPriceLower: getNullableInt(form, newPriceLowerField),
                  newPriceUpper: getNullableInt(form, newPriceUpperField),
                  usedPriceLower: getNullableInt(form, usedPriceLowerField),
                  usedPriceUpper: getNullableInt(form, usedPriceUpperField),
                  keepDateRange: dateRange,
                );
                ref.read(currentKeepItemFilterProvider.notifier).state = f;

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
