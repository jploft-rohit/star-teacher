import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';

class NewsDetailScreen extends StatefulWidget {
  final bool isShowAcknw;
  final NewsBroadCastData data;
  const NewsDetailScreen({Key? key,this.isShowAcknw=true, required this.data}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            addAlignedText(widget.data.title??"", 20.sp, const Color(0xFF072D4B), FontWeight.w700),
            SizedBox(height: 3.h,),
            addText(widget.data.message??"", 17.sp, const Color(0xFF072D4B).withOpacity(0.6), FontWeight.w400),
            SizedBox(height: 3.h,),
            Row(
              children: [
                addText(widget.data.user?.name??"", 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
                SizedBox(width: 3.w  ,),
                addText(formatBackendDate(widget.data.updatedAt??""), 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
              ],
            ),
            SizedBox(height: 6.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !widget.isShowAcknw?Flexible(
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Color(0xFFBECADA), width: 1.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
                          child: addText("Acknowledge".toUpperCase(),15.sp,const Color(0xff7B8D9E),FontWeight.w400),
                        )
                    ),
                  ),
                ):Flexible(
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Card(
                        elevation: 4,
                        color: BaseColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: BaseColors.primaryColor, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
                          child: addText("Agreed".toUpperCase(),15.sp,BaseColors.primaryColor,FontWeight.w700),
                        )
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
