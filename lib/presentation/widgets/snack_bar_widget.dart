import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext ctx, {required String msg}) {
  ScaffoldMessenger.of(ctx).removeCurrentSnackBar();
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 3),
    ),
  );
}
