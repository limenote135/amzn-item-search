// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListingItem _$$_ListingItemFromJson(Map<String, dynamic> json) =>
    _$_ListingItem(
      sku: json['sku'] as String,
      asin: json['asin'] as String,
      sellPrice: json['sell_price'] as int,
      amount: json['amount'] as int,
      condition: $enumDecode(_$ItemConditionEnumMap, json['condition']),
      subCondition:
          $enumDecode(_$ItemSubConditionEnumMap, json['sub_condition']),
      useFba: json['use_fba'] as bool,
      conditionText: json['condition_text'] as String,
    );

Map<String, dynamic> _$$_ListingItemToJson(_$_ListingItem instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'asin': instance.asin,
      'sell_price': instance.sellPrice,
      'amount': instance.amount,
      'condition': _$ItemConditionEnumMap[instance.condition]!,
      'sub_condition': _$ItemSubConditionEnumMap[instance.subCondition]!,
      'use_fba': instance.useFba,
      'condition_text': instance.conditionText,
    };

const _$ItemConditionEnumMap = {
  ItemCondition.newItem: 'newItem',
  ItemCondition.usedItem: 'usedItem',
};

const _$ItemSubConditionEnumMap = {
  ItemSubCondition.newItem: 'newItem',
  ItemSubCondition.mint: 'mint',
  ItemSubCondition.veryGood: 'veryGood',
  ItemSubCondition.good: 'good',
  ItemSubCondition.acceptable: 'acceptable',
};
