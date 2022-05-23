// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..page = json['page'] as int?
      ..size = json['size'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'size': instance.size,
      'total': instance.total,
    };
