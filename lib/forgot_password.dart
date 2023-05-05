import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text_form_field.dart';

Future<Object?> forgotPasswordDialog({required BuildContext context}) {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool? _isProgress = false, _isSubmitButtonEnable = true, _isEmailExits = true;

  return showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5.sp),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
                contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('FORGOT PASSWORD'),
                    Divider(
                      thickness: 1.sp,
                    )
                  ],
                ),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: _isEmailExits! ? 200.h : 250.h,
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          customTextFormField(
                              label: "Username",
                              hint: "Enter username",
                              textEditingController: usernameController,
                              textInputType: TextInputType.emailAddress),
                          !_isEmailExits!
                              ? customTextFormField(
                                  label: "Telephone Number",
                                  hint: "Enter Telephone Number",
                                  textEditingController: telephoneController,
                                  textInputType: TextInputType.phone)
                              : Container(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                minWidth: 100.w,
                                height: 35.h,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: const Color(0xffe21010),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "CANCEL",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              MaterialButton(
                                minWidth: 100.w,
                                height: 35.h,
                                onPressed: () {},
                                color: const Color(0xff0095FF),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    barrierDismissible: false,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
  );
}
