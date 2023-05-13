import 'package:flutter/material.dart';

class BaseNoData extends StatelessWidget {
  const BaseNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No record available",style: TextStyle(color: Colors.grey)));
  }
}
