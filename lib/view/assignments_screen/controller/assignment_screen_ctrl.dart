import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assigned_by_me_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assignment_staff_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assignment_star_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/assignment_to_me_view.dart';

class AssignmentScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;
  final selectedIndex1 = 0.obs;
  final tabIndex = 0.obs;


  List<Map<String, dynamic>> mcqList = [
      {
        "question" : "It was Sunday on Jan 1, 2006. What was the day of the week Jan 1, 2010?",
        "type": "ans",
        "ans" : [
            "A. Sunday",
            "B. Saturday",
            "C. Friday",
            "D. Monday"
        ],
      },
      {
        "question" : "What shape is this?",
        "type": "ans",
        "ans" : [
            "A. Circle",
            "B. Rectangle"
        ],
      },
      {
        "question" : "What do you learn from this video?",
        "type": "write",
        "ans" : [],
      },
      {
        "question" : "Complete this drawing",
        "type": "download",
        "ans" : [],
      },
      {
        "question" : "Say something about our planet?",
        "type": "audio",
        "ans" : [],
      },
  ];

  List<Map<String, dynamic>> pendingAssignmentList = [
    {
      "question" : "How often do you get a health checkup?",
      "type": "ans",
      "ans" : [
        "A. Once in 3 months",
        "B. Once in 6 months",
        "C. Once a year",
        "D. Only when needed",
        "E. Never get it done",
        "F. Other (If Other ask to describe)",
      ],
    },
    {
      "question" : "What do you say about your overall health?",
      "type": "ans",
      "ans" : [
        "A. Having Good Physical Health",
        "B. Moderately physically impaired",
        "C. Severely physically impaired",
        "D. Totally physically impaired",
      ],
    },
    {
      "question" : "Do you have any chronic diseases?",
      "type": "ans",
      "ans" : [
        "A. Yes",
        "B. No",
      ],
    },
    {
      "question" : "How healthy do you consider yourself on a scale of 1 to 10?",
      "type": "write",
      "ans" : [],
    },
    {
      "question" : "Are you habitual to drugs and alcohol?",
      "type": "ans",
      "ans" : [
        "A. Yes to both",
        "B. Only to drugs",
        "C. Only to alcohol",
        "D. I am not habituated to either",
      ],
    },
  ];
  List<Widget> screenList = [
    AssignedByMeView(),
    AssignedToMeView()
  ];
  List<Widget> screenList1 = [
    AssignmentStaffView(),
    AssignmentStarView(),
    AssignmentStaffView()
  ];
}