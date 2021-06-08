import 'package:flutter/material.dart';

class MyConstant {
  // General
  static String appName = 'Ung Schoole';

  // Route
  static String routeAuthen = '/authen';
  static String routeMyService = '/myService';

  // image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';

  // Color
  static Color primary = Color(0xffba68c8);
  static Color dart = Color(0xff883997);
  static Color light = Color(0xffee98fb);

  // api
  static String apiCheckAuthen = 'http://thecampus.tech:3000/login/';
  static String apiClassRoom = 'http://thecampus.tech:3000/course_student/';

  // key
  static String keyId = 'id';
  static String keyUserId = 'user_id';
  static String keyUserLogin = 'user_login';
  static String keyApiPass = 'api_pass';
  static String keyUserActivation = 'user_activation';
  static String keyUserStatus = 'user_status';

  // Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dart,
        fontWeight: FontWeight.bold,
      );

  TextStyle h1WhiteStyle() => TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dart,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dart,
        fontWeight: FontWeight.normal,
      );

  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
