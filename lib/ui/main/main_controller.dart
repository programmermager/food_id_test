import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:food_id/model/objects/banner_model.dart';
import 'package:food_id/model/responses/banner_response.dart';
import 'package:food_id/services/endpoint.dart';
import 'package:food_id/utils/spacing.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/api_services.dart';
import '../../utils/theme.dart';

class MainController extends GetxController {
  var box = GetStorage();
  d.Dio dio = ApiServices().launch();

  RxBool isLoading = false.obs;
  RxInt currentSlider = 0.obs;
  RxList<BannerModel> largeBanners = <BannerModel>[].obs;
  RxList<BannerModel> smallBanners = <BannerModel>[].obs;

  initController() {
    apiGetBanners();
  }

  void apiGetBanners() async {
    isLoading.value = true;

    final resp = await dio.get(apiBannerUrl);

    isLoading.value = false;

    try {
      BannerResponse response = BannerResponse.fromJson(resp.data);
      if (response.data != null) {
        largeBanners.addAll(response.data!.where((element) => element.banner_variant_id == 1));
        smallBanners.addAll(response.data!.where((element) => element.banner_variant_id == 3));
      } else {
        errorMessage();
      }
    } catch (_) {
      errorMessage();
    }
  }

  errorMessage() {
    Get.snackbar("Oops", "Failed to get data",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(wValue(15)),
        backgroundColor: colorPrimary,
        colorText: Colors.white);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
