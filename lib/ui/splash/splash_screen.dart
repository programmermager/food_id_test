import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_id/ui/splash/splash_controller.dart';
import 'package:food_id/utils/spacing.dart';
import 'package:food_id/utils/theme.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = SplashController();
    controller.nextPage();

    return Container(
      width: Get.width,
      color: colorPrimary,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SvgPicture.asset("assets/img/logo_food_id.svg", width: wValue(100),),
          ),
        ),
      ),
    );
  }
}
