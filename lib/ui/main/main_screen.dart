import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_id/ui/main/main_controller.dart';
import 'package:food_id/utils/shimmer_loading.dart';
import 'package:food_id/utils/spacing.dart';
import 'package:food_id/utils/theme.dart';
import 'package:get/get.dart';

import '../../utils/sliver_grid_delegate_fixed.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var controller = MainController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => afterInit());
    super.initState();
  }

  afterInit() {
    controller.initController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: SafeArea(
        child: Obx(() => Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    viewHeader(),
                    hSpace(25),
                    controller.isLoading.value
                        ? showShimmerHome()
                        : viewContent()
                  ],
                ),
              ),
            )),
      ),
    );
  }

  viewContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        viewSlider(),
        hSpace(35),
        Container(
          margin: EdgeInsets.only(left: wValue(15)),
          child: Text(
            "Special di FOOD.ID",
            style: boldTextFont.copyWith(fontSize: fontSize(20)),
          ),
        ),
        viewSpecialFood(),
        hSpace(35),
        Container(
          margin: EdgeInsets.only(left: wValue(15)),
          child: Text(
            "Cari Inspirasi Belanja",
            style: boldTextFont.copyWith(fontSize: fontSize(20)),
          ),
        ),
        viewInspirasiBelanja(),
      ],
    );
  }

  viewHeader() {
    return Container(
      color: colorPrimary,
      padding: EdgeInsets.all(wValue(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/img/logo_banner.png"),
              const Icon(
                Icons.chat_outlined,
                color: Colors.white,
              ),
            ],
          ),
          hSpace(15),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              wSpace(5),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Dikirim Ke ',
                    style: regularTextFont.copyWith(
                        color: Colors.white, fontSize: fontSize(12)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Jakarta Selatan',
                          style: boldTextFont.copyWith(
                            color: Colors.white,
                            fontSize: fontSize(12),
                          )),
                    ]),
              ),
              wSpace(5),
              const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.white,
              )
            ],
          ),
          hSpace(15),
          TextField(
            style: regularTextFont.copyWith(
                fontSize: fontSize(14), color: Colors.black),
            decoration: InputDecoration(
                prefixIcon: Container(
                  child: const Icon(Icons.search, color: Colors.grey,),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                hintStyle: regularTextFont.copyWith(
                    fontSize: fontSize(14), color: Colors.grey),
                hintText: "Mau Belanja makanan apa?",
                fillColor: Colors.white),
          ),
        ],
      ),
    );
  }

  viewSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: hValue(150),
        onPageChanged: (i, _) {
          controller.currentSlider.value = i;
        },
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: controller.largeBanners.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.only(left: wValue(5), right: wValue(5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "${i.media}",
                    width: wValue(320),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () {},
            );
          },
        );
      }).toList(),
    );
  }

  viewSpecialFood() {
    return Container(
      padding:
          EdgeInsets.only(left: wValue(15), right: wValue(15), top: hValue(10)),
      child: GridView.builder(
        itemCount: controller.smallBanners.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              controller.smallBanners[index].media!,
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {},
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            mainAxisSpacing: hValue(5),
            crossAxisSpacing: hValue(5),
            height: hValue(80)),
      ),
    );
  }

  viewInspirasiBelanja() {
    return Container(
      padding:
          EdgeInsets.only(left: wValue(15), right: wValue(15), top: hValue(10)),
      child: Row(
        children: [
          Column(
            children: [
              itemInspirasi(
                  title: "Makanan Kucing", width: hValue(122), textSize: 10),
              hSpace(5),
              itemInspirasi(
                  title: "Aneka Saos", width: hValue(122), textSize: 10),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: wValue(5), right: wValue(5)),
              child: itemInspirasi(
                  title: "Lagi Trending", width: Get.width, textSize: 14),
            ),
          )
        ],
      ),
    );
  }

  itemInspirasi(
      {required String title,
      required double width,
      required double textSize}) {
    return Container(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.network("https://picsum.photos/400?random=$title"),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                title,
                style: boldTextFont.copyWith(
                    fontSize: fontSize(textSize), color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
