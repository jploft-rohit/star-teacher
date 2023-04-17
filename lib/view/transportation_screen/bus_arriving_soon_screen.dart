import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class BusArrivingSoonScreen extends StatefulWidget {
  const BusArrivingSoonScreen({Key? key}) : super(key: key);

  @override
  State<BusArrivingSoonScreen> createState() => _BusArrivingSoonScreenState();
}

class _BusArrivingSoonScreenState extends State<BusArrivingSoonScreen> {
  List<Map<String, dynamic>> list = [
    {
      "title":translate(Get.context!).wait_5_mins,
      "isSelected":true,
    },
    {
      "title":translate(Get.context!).absent_today,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).ready,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).going_by_own_vehicle,
      "isSelected":false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).bus_arriving_soon),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(translate(context).please_make_sure_you_are_ready_at_the_pickup_point, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp, height: 1.5),textAlign: TextAlign.center,),
            SizedBox(
              height: 5.h,
            ),
            Text("${translate(context).notify}:", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp,),),
            SizedBox(
              height: 1.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    for(var i in list){
                      i['isSelected'] = false;
                    }
                    list[index]['isSelected'] = !list[index]['isSelected'];
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    padding: EdgeInsets.all(14.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: BaseColors.primaryColor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(list[index]['title'], style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 17.sp),),
                        Checkbox(
                          visualDensity: VisualDensity(vertical: -4),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          side: BorderSide(color: Colors.transparent),
                          activeColor: BaseColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          value: list[index]['isSelected'],
                          onChanged: (value){
                            for(var i in list){
                              i['isSelected'] = false;
                            }
                            list[index]['isSelected'] = !list[index]['isSelected'];
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(child: BaseButton(title: translate(context).notify.toUpperCase(), onPressed: (){}))
          ],
        ),
      ),
    );
  }
}
