import 'dart:async';

import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:food_id/model/objects/banner_model.dart';
import 'package:food_id/model/responses/banner_response.dart';
import 'package:food_id/services/endpoint.dart';
import 'package:food_id/ui/main/main_screen.dart';
import 'package:food_id/utils/spacing.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/api_services.dart';
import '../../utils/theme.dart';

class SplashController extends GetxController {

  void nextPage() {
    var duration = const Duration(seconds: 4);
    Timer(duration, () {
      Get.offAll(const MainScreen());
    });
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
