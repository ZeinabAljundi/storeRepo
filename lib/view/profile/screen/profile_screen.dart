import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constances/all_colors.dart';
import '../../../core/constances/text_styles.dart';
import '../../../core/constances/all_icons.dart';
import '../../../core/service/media_query_service.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myWhite,
      appBar: AppBar(
        backgroundColor: MyColor.myWhite,
        centerTitle: true,
        title: myText(size: 0.05, textColor: MyColor.myBlack, text: 'Profile'),
        leading: IconButton(
          icon: myIcon.stepBack,
          onPressed: () {
            Get.toNamed("/HomeScreen");
          },
        ),
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profileController) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MySize.screenHeight(context) * 0.045),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: MySize.screenWidth(context) * 0.15,
                      child: Image(
                        image: AssetImage("assets/images/profile.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.screenHeight(context) * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: myText(
                      text: "Your Name",
                      textColor: MyColor.textGray,
                      size: 0.049,
                    ),
                  ),
                  SizedBox(height: MySize.screenHeight(context) * 0.01),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      color: MyColor.textFormGray,
                      width: MySize.screenWidth(context) * 0.85,
                      height: MySize.screenHeight(context) * 0.06,
                      child: TextFormField(
                        controller: profileController.nameController,
                        style: TextStyle(
                          fontFamily: GoogleFonts.raleway().fontFamily,
                          fontSize: MySize.screenHeight(context) * 0.020,
                          color: MyColor.myBlack,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none, // Removes the underline
                          contentPadding: EdgeInsets
                              .zero, // Optional: Adjusts padding if needed
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.screenHeight(context) * 0.04),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: myText(
                      text: "Email Adress",
                      textColor: MyColor.textGray,
                      size: 0.049,
                    ),
                  ),
                  SizedBox(height: MySize.screenHeight(context) * 0.01),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      color: MyColor.textFormGray,
                      width: MySize.screenWidth(context) * 0.85,
                      height: MySize.screenHeight(context) * 0.06,
                      child: TextFormField(
                        controller: profileController.emaildController,
                        style: TextStyle(
                          fontFamily: GoogleFonts.raleway().fontFamily,
                          fontSize: MySize.screenHeight(context) * 0.020,
                          color: MyColor.myBlack,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none, // Removes the underline
                          contentPadding: EdgeInsets
                              .zero, // Optional: Adjusts padding if needed
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.screenHeight(context) * 0.04),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: myText(
                      text: "Password",
                      textColor: MyColor.textGray,
                      size: 0.049
                    ),
                  ),
                  SizedBox(height: MySize.screenHeight(context) * 0.01),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      color: MyColor.textFormGray,
                      width: MySize.screenWidth(context) * 0.85,
                      height: MySize.screenHeight(context) * 0.06,
                      child: TextFormField(
                        controller: profileController.passwordController,
                        style: TextStyle(
                          fontFamily: GoogleFonts.raleway().fontFamily,
                          fontSize: MySize.screenHeight(context) * 0.020,
                          color: MyColor.myBlack,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none, // Removes the underline
                          contentPadding: EdgeInsets
                              .zero, // Optional: Adjusts padding if needed
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MySize.screenHeight(context) * 0.06,
                  ),
              SizedBox(
                  width: MySize.screenWidth(context)*0.85, // Makes the button full width
                  child: ElevatedButton(
                      onPressed: () {
                        profileController.registerUser();
                        print("Save Now Pressed");
                      },
                      child: Text("Save Now"),
                      style: ElevatedButton.styleFrom(
                        primary: MyColor.basicGreen, // Background color
                        onPrimary: MyColor.myWhite, // Text color
                        textStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),)

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
