import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextFormField(
    {required String hint,
    required String label,
    required TextEditingController textEditingController,
    required TextInputType textInputType,
    bool obscureText = false,
    bool multiLine = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextFormField(
        maxLines: multiLine ? null : 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        obscureText: obscureText,
        keyboardType: textInputType,
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
        },
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0.h,
          ),
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10.sp, 15.sp, 10.sp, 15.sp),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.sp),
            borderSide: BorderSide(color: Colors.blue, width: 1.w),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0.w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0.w,
            ),
          ),
          hintText: hint,
          label: Text(label),
        ),
      ),
      SizedBox(
        height: 20.h,
      )
    ],
  );
}
