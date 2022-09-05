import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_weather/screens/reader/controller/reader_controller.dart';

import 'package:new_weather/utils/styles.dart';
import 'package:sizer/sizer.dart';

class ReaderScreen extends StatelessWidget {
  ReaderScreen({super.key});
  final ScrollController controllerScroll = ScrollController();
  final controller = Get.put(ReaderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['title'], style: Styles.appBarTitleTS),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() => Scrollbar(
            controller: controllerScroll,
            interactive: true,
            thumbVisibility: true,
            child: controller.isLoadingFile.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : Container(
                    width: 100.w,
                    child: SingleChildScrollView(
                      controller: controllerScroll,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Text(controller.content.value,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: controller.defaultSize.value,
                                    fontWeight: controller.isBold.value
                                        ? FontWeight.bold
                                        : FontWeight.normal)),
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),
                  ),
          )),
    );
  }
}
