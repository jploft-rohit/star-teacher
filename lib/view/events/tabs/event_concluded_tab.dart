import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/view/events/events_detail_screen.dart';

class EventsConcludedTab extends StatefulWidget {
  const EventsConcludedTab({Key? key}) : super(key: key);

  @override
  State<EventsConcludedTab> createState() => _EventsConcludedTabState();
}

class _EventsConcludedTabState extends State<EventsConcludedTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BaseDropDown(title: "Najma Suheil",topMargin: 10,belowMargin: 20),
          SizedBox(height: 2.h),
          Text(translate(context).concluded,style: TextStyle(fontWeight: FontWeight.w700,fontSize: primaryHeadingTs)),
          ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.only(top: 8,right: 2,left: 2),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.to(EventsDetailScreen());
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.2,
                          spreadRadius: 1.2,
                          color: Colors.grey.withOpacity(0.8),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Peal Jam",style: TextStyle(fontWeight: FontWeight.w700,fontSize: primaryHeadingTs)),
                                BaseDetailData(detailsLabel: "Total Cost",detailsValue: "2500 AED",topMargin: 4),
                                BaseDetailData(detailsLabel: "Event Date",detailsValue: "15/04/2023",topMargin: 4),
                                BaseDetailData(detailsLabel: "Location",detailsValue: "Liwa Tower; P.O. Box 901; Abu Dhabi",topMargin: 4),
                              ]),
                        ),
                        Text(translate(context).rejected,style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
