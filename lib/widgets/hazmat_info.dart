import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/hazmat_type.dart';
import 'package:amasearch/widgets/strong_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HazmatInfo extends ConsumerWidget {
  const HazmatInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final text = _getHazmatText(item.hazmatType);
    if (text.isEmpty) {
      return Container();
    }
    return WarningContainer(
      ListTile(
        title: Center(child: Text(text)),
      ),
    );
  }

  String _getHazmatText(HazmatType type) {
    switch (type) {
      case HazmatType.nonHazmat:
        return "";
      case HazmatType.sds:
        return "納品に安全データシート(SDS) が必要な可能性があります";
      case HazmatType.battery:
        return "充電池を含むため危険物取扱可能なFCにのみ納品可能です";
      case HazmatType.warn:
        return "危険物取扱可能なFCにのみ納品可能です";
      case HazmatType.hazmat:
        return "納品できない危険物の可能性があります";
      case HazmatType.unknown:
        return "危険物の可能がありますが詳細情報が未登録です";
    }
  }
}
