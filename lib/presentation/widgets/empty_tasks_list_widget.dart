import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/strings.dart';

class EmptyTasksListWidget extends StatelessWidget {
  const EmptyTasksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty.png',
            width: 400.w,
            height: 300.h,
          ),
          Text(
            Strings.emptyTasksListTitle,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            Strings.emptyTasksListSubTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
