import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpace extends StatelessWidget {
  final double ? height;
  final double ? width;

  const AppSpace({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height??0.h,
      width: width??0.h,
    );
  }
}
