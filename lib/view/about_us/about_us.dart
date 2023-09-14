import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/view/about_us/controller/about_us_controller.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  AboutUsController controller = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "About App"),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Obx(()=> HtmlWidget(controller.aboutUsData?.value?.value??"")),
          ],
        ),
      ),
    );
  }
}
