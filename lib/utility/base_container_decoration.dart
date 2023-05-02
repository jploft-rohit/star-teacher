import 'package:flutter/material.dart';

BoxDecoration baseContainerDecoration(){
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        blurRadius: 0.3,
        spreadRadius: 0.3,
        color: Colors.grey.withOpacity(0.8),
      )
    ],
  );
}