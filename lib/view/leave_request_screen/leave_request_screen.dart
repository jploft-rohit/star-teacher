import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/leave_request_screen/add_leave_request_view.dart';
import 'package:staff_app/view/leave_request_screen/early_leave_screen.dart';
import 'package:staff_app/view/leave_request_screen/leave_balance_popup.dart';
import 'package:staff_app/view/leave_request_screen/upload_evidence_popup.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({Key? key}) : super(key: key);

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  TextEditingController startDateCtrl = TextEditingController();
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', 'July 3,\n10:30AM', 'July 3,\n10:30AM'];
  String? initialLeaveType;
  var leaveTypeDropdownData = [
    // 'Leave Type'
    'Annual leave',
    'Compassionate leave',
    'Sick leave',
    'Local escort leave',
    'Abroad escort leave',
    'National service leave',
    'Event leave',
    'Hajj leave',
    'Paternity Leave',
    'Maternity Leave',
    'Leave without pay',
  ];
  final List<String> heading = [
    'Request\nRaised',
    'Request\nAccepted',
    'Evidence\nSubmit',
    'Evidence\nApproved'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).leave_request, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){
              Get.to(AddLeaveRequestView());
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: CustomColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: CustomColors.primaryColor,
            ),
          ),
          Text(translate(context).leave_request, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  // Container(
                  //   width: 40.w,
                  //   padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  //   decoration: BoxDecoration(
                  //     color: CustomColors.backgroundColor,
                  //     borderRadius: BorderRadius.circular(5.0),
                  //     border: Border.all(
                  //         color: CustomColors.borderColor
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Leave Type", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                  //       const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        color: CustomColors.backgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: CustomColors.borderColor
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<dynamic>(
                            isExpanded: true,
                            isDense: true,
                            value: initialLeaveType,
                            alignment: Alignment.centerLeft,
                            hint: Text("Leave Type",style: TextStyle(color: Colors.black),),
                            icon: Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),),
                            items: leaveTypeDropdownData.map((String leave) {
                              return DropdownMenuItem(
                                value: leave,
                                child: addText(leave, 14, Colors.black, FontWeight.w400),);
                            }).toList(),
                            onChanged: (dynamic newValue){
                              setState(() {
                                initialLeaveType = newValue;
                              });
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return LeaveBalancePopup();
                          },
                        );
                      },
                      child: Container(
                        width: 50.w,
                        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0, bottom: 9.0),
                        decoration: BoxDecoration(
                          color: CustomColors.backgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: CustomColors.primaryColor
                          ),
                        ),
                        child: Center(child: Text(translate(context).check_leave_balance, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp),)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                itemCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 1 ? 40 : 10.0),
                    child: Container(
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("${translate(context).leave_type} : ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                                  Text("CL", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),maxLines: 1, overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.delete,
                                    color: CustomColors.primaryColor,
                                    size: 18.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.to(EarlyLeaveScreen());
                                    },
                                    child: Image.asset(editPng, color: CustomColors.primaryColor,height: 18.sp,),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      showGeneralDialog(
                                        context: context,
                                        pageBuilder:  (context, animation, secondaryAnimation) {
                                          return UploadEvidencePopup();
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(uploadDocSvg),
                                        SizedBox(
                                          height: 2.0,
                                        ),
                                        Text(translate(context).upload_evidence1, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 13.sp),textAlign: TextAlign.center,)
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            color: CustomColors.borderColor,
                            thickness: 1.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/Vector (1).svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("01/03/2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(translate(context).to, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset("assets/images/Vector (1).svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("05/03/2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                            ],
                          ),
                          Divider(
                            color: CustomColors.borderColor,
                            thickness: 1.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/report.svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("${translate(context).reason} : ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                              Text("Lorem Ipsum is simply dummy text...", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),maxLines: 1, overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                          Divider(
                            color: CustomColors.borderColor,
                            thickness: 1.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(commentSvg),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("${translate(context).comment} : ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                              Text("Ok I will talk to her...", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),maxLines: 1, overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                          Divider(
                            color: CustomColors.borderColor,
                            thickness: 1.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(documentSvg),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("${translate(context).evidence} : ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                              Text("Medical_sania.jpeg", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),maxLines: 1, overflow: TextOverflow.ellipsis,),
                              SizedBox(width: 4.w,),
                              InkWell(onTap: (){
                                showGeneralDialog(
                                  context: context,
                                  pageBuilder:  (context, animation, secondaryAnimation) {
                                    return OpenPdfPopup(title: "");
                                  },
                                );
                              },child: Icon(Icons.remove_red_eye_outlined,color: CustomColors.primaryColor,size: 20.sp,)),
                              SizedBox(width: 3.w,),
                              Icon(Icons.download_for_offline,color: CustomColors.primaryColor,size: 20.sp,)
                            ],
                          ),
                          Divider(
                            color: CustomColors.borderColor,
                            thickness: 1.0,
                          ),
                          StepProgressView(
                            width: MediaQuery.of(context).size.width,
                            curStep: 4,
                            color: CustomColors.primaryColor,
                            titles: pendingMeetingdates,
                            statuses: heading,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
