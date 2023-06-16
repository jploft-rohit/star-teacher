import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/sos/select_star_popup.dart';
import 'package:staff_app/view/sos/sos_scanQR.dart';

class BaseTypeSearch extends StatefulWidget {
  final TextEditingController searchController;
  final double? bottomMargin,topMargin,rightMargin,leftMargin;
  const BaseTypeSearch({Key? key, this.bottomMargin, this.topMargin, this.rightMargin, this.leftMargin, required this.searchController}) : super(key: key);

  @override
  State<BaseTypeSearch> createState() => _BaseTypeSearchState();
}

class _BaseTypeSearchState extends State<BaseTypeSearch> {

  int selectedSearchType = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomMargin??2.h,top: widget.topMargin??0,right: widget.rightMargin??0,left: widget.leftMargin??0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Custom CheckBox with Icons
          GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 2.h),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: iconsPathList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  // mainAxisSpacing: 15,
                  mainAxisExtent: 42
              ),
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSearchType = index;
                        if(index == 1){
                          Get.to(ScanQrCodeScreen());
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                      height: 40,
                      // padding: const EdgeInsets.symmetric(horizontal: 9),
                      decoration: BoxDecoration(
                          color: selectedSearchType == index
                              ? BaseColors.backgroundColor
                              : BaseColors.white,
                          boxShadow: [getBoxShadow()],
                          border: selectedSearchType == index
                              ? Border.all(
                              color: BaseColors.primaryColor, width: 1.0)
                              : null,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: BaseColors.white, width: 2),
                                shape: BoxShape.circle,
                                boxShadow: [getBoxShadow()],
                                color: selectedSearchType == index
                                    ? BaseColors.primaryColor
                                    : BaseColors.borderColor
                            ),
                            child: Icon(Icons.check, color: BaseColors.white,
                                size: 17.sp),
                          ),
                          SvgPicture.asset(iconsPathList[index],height: 30,color: selectedSearchType == index ? BaseColors.primaryColor:Colors.black)
                        ],
                      ),
                    ),
                  )),

          /// Search TextFormField
          CustomTextField(
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SvgPicture.asset("assets/images/circle2017.svg")
              ),
              hintTxtSize: 15.sp,
              borderRadius: 8,
              readOnly: selectedSearchType==2 ? true: false,
              onTap: (){
                if(selectedSearchType==2) {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SelectStarPopup(type: "Star",);
                    },
                  );
                }
              },
              controller: widget.searchController,
              hintText: translate(context).search_by_id,
              suffixIcon: selectedSearchType == 2
                  ? const SizedBox.shrink()
                  :GestureDetector(
                    onTap: (){
                      selectedSearchType == 0
                          ? showNFCDialog(context, "")
                          : Get.to(ScanQrCodeScreen());
                    },
                    child: SizedBox(
                    height: 26,
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SvgPicture.asset(
                        selectedSearchType == 0
                            ? nfcSvg:barcodeSvg,color
                          : BaseColors.primaryColor,),
                    )),
              )),
        ],
      ),
    );
  }

  var iconsPathList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];
}
