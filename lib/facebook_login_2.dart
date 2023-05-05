import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/userprofile.dart';

class FacebookLogin2 extends StatefulWidget {
  const FacebookLogin2({Key? key}) : super(key: key);

  @override
  State<FacebookLogin2> createState() => _FacebookLogin2State();
}

class _FacebookLogin2State extends State<FacebookLogin2> {
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
                    fontSize: 2.sp),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            CircleAvatar(
              radius: 25.sp,
              child: Image.asset(
                "assets/icon/facebook_auth_ic.png",
                height: 200.h,
                width: 200.w,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.sp, right: 40.sp),
              child: Column(
                children: [
                  Text(
                    'You previously logged to Pradum Kumar with Facebook',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Text(
                    'Would you like to continue?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "This doesn't let the app post to facebook",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                height: 37.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            UserProfile(loginType: "FACEBOOK")));
                  },
                )),
            SizedBox(
              height: 11.h,
            ),
            Container(
                height: 37.h,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade200)),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 17.sp, color: Colors.black87),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FacebookLogin2()));
                  },
                )),
          ],
        ),
      ),
    ));
  }
}
