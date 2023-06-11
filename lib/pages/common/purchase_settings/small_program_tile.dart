import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/size_type.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SmallProgramTile extends ConsumerWidget {
  const SmallProgramTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    if (item.sizeType != SizeType.small) {
      return const SizedBox();
    }
    return ReactiveSwitchListTile(
      formControlName: smallProgramField,
      title: const Text("小型軽量プログラム"),
    );
  }
}
