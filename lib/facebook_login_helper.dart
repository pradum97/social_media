import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/userprofile.dart';

import 'facebook_login_2.dart';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({Key? key, required userData, required String loginType})
      : super(key: key);

  @override
  State<FacebookLogin> createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Row(
                  children: [
                    Icon(Icons.clear),
                    SizedBox(
                      width: 30.w,
                    ),
                    Icon(
                      Icons.lock,
                      size: 17.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("m.facebook.com"),
                    SizedBox(
                      width: 80.w,
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 22.sp,
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 45.h,
                color: Color.fromRGBO(1, 101, 225, 1),
                child: Text(
                  "FACEBOOK".toLowerCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.sp),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Image.asset(
                "assets/icon/facebook_auth_ic.png",
                height: 80.h,
                width: 60.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.sp, right: 40.sp),
                child: Text(
                  'Log in to your Facebook account to connect to auth project',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Card(
                  color: Colors.white,
                  elevation: 7.sp,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Mobile number or email',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Facebook Password',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 37.h,
                  width: MediaQuery.of(context).size.width.w,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Log In'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FacebookLogin2()));
                    },
                  )),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Forgotten password?",
                      style: TextStyle(color: Colors.blue.shade700),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Create account",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Not now",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Help Center",
                      style: TextStyle(color: Colors.blue.shade700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
