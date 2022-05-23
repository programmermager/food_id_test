// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..page_url = json['page_url'] as String?
  ..original_page_url = json['original_page_url'] as String?
  ..media = json['media'] as String?
  ..banner_variant_id = json['banner_variant_id'] as int?;

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'page_url': instance.page_url,
      'original_page_url': instance.original_page_url,
      'media': instance.media,
      'banner_variant_id': instance.banner_variant_id,
    };
