import 'package:circular_image/circular_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProfile extends StatefulWidget {
  GoogleSignInAccount? userData;
  String loginType;

  UserProfile({this.userData, required this.loginType});

  UserProfile.name(this.userData, this.loginType);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? name, email, photoUrl, id;

  @override
  void initState() {
    switch (widget.loginType) {
      case "GOOGLE":
        {
          GoogleSignInAccount data = widget.userData!;

          setState(() {
            name = data.displayName;
            email = data.email;
            id = data.id;
            photoUrl = data.photoUrl;
          });

          break;
        }

      case "FACEBOOK":
        {
          setState(() {
            name = "PRADUM KUMAR";
            email = "pradumraj98@gmail.com";
            id = "";
            photoUrl =
                "https://firebasestorage.googleapis.com/v0/b/social-media-347f9.appspot.com/o/Screenshot%202023-05-05%20184750.png?alt=media&token=85dbc891-beba-49df-8d3c-76e1982e49ea";
          });

          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
                child: photoUrl == null
                    ? CircularImage(
                        radius: 50,
                        borderWidth: 2,
                        borderColor: Colors.white,
                        source: 'assets/icon/user_ic.png',
                      )
                    : CircularImage(
                        radius: 50,
                        borderWidth: 2,
                        borderColor: Colors.white,
                        source: photoUrl!,
                      )),
            SizedBox(
              height: 20.h,
            ),
            Container(
              child: null == name
                  ? Text(
                      "...",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      name!,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EMAIL",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Text(email == null ? "" : email!,
                            softWrap: true, style: TextStyle(fontSize: 17)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USER ID",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Text(id == null ? "" : id!,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 17)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN TYPE: ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold),
                      ),
                      widget.loginType == "GOOGLE"
                          ? Row(
                              children: [
                                Image.asset(
                                  "assets/icon/google_ic.png",
                                  width: 40,
                                  height: 25,
                                ),
                              ],
                            )
                          : IconButton(
                              onPressed: () {},
                              iconSize: 47.sp,
                              color: Colors.blue,
                              icon: Image.asset("assets/icon/facebook_ic.png")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
            Container(
              height: 30,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown)),
                icon: Icon(
                  Icons.logout,
                  size: 20,
                ),
                label: Text("LOGOUT"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
