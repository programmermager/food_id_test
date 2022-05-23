// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

import '../objects/banner_model.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  List<BannerModel>? data;
  int? page;
  int? size;
  int? total;

  BannerResponse();

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}
