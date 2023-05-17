import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/events/tabs/event_accepted_tab.dart';
import 'package:staff_app/view/events/tabs/event_concluded_tab.dart';

import 'tabs/event_upcoming_tab.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: BaseAppBar(title: translate(context).event),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                initialValue: DummyLists.initialSchool,
                hintText: "Select School",
                listData:DummyLists.schoolData,
                onChange: (value) {
                  setState(() {
                    DummyLists.initialSchool=value;
                  });
                },
                topPadding: 5,
                bottomPadding: 5,
                icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
              ),
              SizedBox(height: 1.h,),
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).upcoming, isSelected: tabController.index==0),
                BaseTabButton(title: translate(context).accepted, isSelected: tabController.index==1),
                BaseTabButton(title: translate(context).concluded, isSelected: tabController.index==2),
              ]),
              Expanded(
                  child: TabBarView(
                    controller: tabController,
                      children: [
                        EventsUpComingTab(),
                        EventsAcceptedTab(),
                        EventsConcludedTab(),
                      ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
