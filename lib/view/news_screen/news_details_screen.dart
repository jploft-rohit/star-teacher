import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';

class NewsDetailScreen extends StatefulWidget {
  final bool isShowAcknw;
  const NewsDetailScreen({Key? key,this.isShowAcknw=true}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: appBarWithHeading(""),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              addAlignedText("Principal’s Honouring Ceremony", 20.sp, const Color(0xFF072D4B), FontWeight.w700),
              SizedBox(height: 3.h,),
              addText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam.", 17.sp, const Color(0xFF072D4B).withOpacity(0.6), FontWeight.w400),
              SizedBox(height: 3.h,),
              Row(
                children: [
                  addText("School Admin", 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
                  SizedBox(width: 3.w  ,),
                  addText("15 mins ago", 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
                ],
              ),
              SizedBox(height: 6.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  !widget.isShowAcknw?Flexible(
                    child: InkWell(
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
                    child: InkWell(
                      onTap: (){
                        
                      },
                      child: Card(
                          elevation: 4,
                          color: CustomColors.backgroundColor,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: CustomColors.primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0)),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
                            child: addText("Agreed".toUpperCase(),15.sp,CustomColors.primaryColor,FontWeight.w700),
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
