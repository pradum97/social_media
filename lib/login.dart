import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/facebook_login_helper.dart';
import 'package:social_media/userprofile.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? _passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 45,
                maxWidth: MediaQuery.of(context).size.width),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.blueAccent,
            ], begin: Alignment.topLeft, end: Alignment.centerRight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.h, horizontal: 24.0.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45.0.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.sp),
                            topRight: Radius.circular(20.sp))),
                    child: Padding(
                      padding: EdgeInsets.all(24.sp),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                              },
                              controller: _usernameController,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  height: 0.h,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0.sp),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.w),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.0.w),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                filled: true,
                                fillColor: const Color(0XFFe7edeb),
                                hintText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.grey[600]!,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    10.sp, 15.sp, 10.sp, 15.sp),
                              ),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                              },
                              controller: _passwordController,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  height: 0.h,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0.sp),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.w),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.0.w),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ),
                                ),
                                filled: true,
                                fillColor: const Color(0XFFe7edeb),
                                hintText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey[600]!,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    10.sp, 15.sp, 10.sp, 15.sp),
                              ),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    forgotPasswordDialog(context: context);
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40.0.h,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 40.sp, right: 40.sp),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blue.shade800)),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {}
                                },
                                child: const Text("LOGIN"),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _googleSignIn.signIn().then((userData) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserProfile(
                                                        userData: userData,
                                                        loginType: "GOOGLE")));
                                      }).catchError((e) {
                                        print(e);
                                      });
                                    },
                                    iconSize: 31.sp,
                                    color: Colors.blue,
                                    icon: Image.asset(
                                        "assets/icon/google_ic.png")),
                                SizedBox(
                                  width: 20.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FacebookLogin(
                                                      userData: null,
                                                      loginType: "FACEBOOK")));
                                    },
                                    iconSize: 47.sp,
                                    color: Colors.blue,
                                    icon: Image.asset(
                                        "assets/icon/facebook_ic.png")),
                                SizedBox(
                                  width: 20.w,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 35.sp,
                                    color: Colors.blue,
                                    icon: Image.asset(
                                        "assets/icon/github_ic.png"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
