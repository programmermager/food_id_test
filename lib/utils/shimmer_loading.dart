import 'package:flutter/material.dart';
import 'package:food_id/utils/spacing.dart';
import 'package:food_id/utils/theme.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget showShimmerHome(){
  return Container(
    margin: EdgeInsets.all(wValue(15)),
    child: Shimmer.fromColors(
      baseColor: greyShimmer,
      highlightColor: Colors.white60,
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            width: Get.width,
            height: hValue(110),
          ),
          hSpace(15),
          Container(
            color: Colors.grey,
            width: Get.width,
            height: hValue(110),
          ),
          hSpace(15),
          Container(
            color: Colors.grey,
            width: Get.width,
            height: hValue(110),
          ),
          hSpace(15),
          Container(
            color: Colors.grey,
            width: Get.width,
            height: hValue(110),
          ),
          hSpace(15),
        ],
      ),
    ),
  );
}