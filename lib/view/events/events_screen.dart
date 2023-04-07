import 'package:flutter/material.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_detail_data.dart';
import 'package:staff_app/Utility/base_dropdown.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
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
              BaseDropDown(),
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
