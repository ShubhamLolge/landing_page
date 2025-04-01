// ignore_for_file: unused_import

// import 'package:landing_page_preview/SmokeTest/induction.dart';
// import 'package:landing_page_preview/lib.dart';
// import 'package:landing_page_preview/SmokeTest/landing_page_st.dart';

import 'package:flutter/material.dart';
// import 'package:landing_page_preview/SmokeTest/induction.dart';
import 'package:landing_page_preview/SmokeTest/landing_page_st.dart';
import 'package:landing_page_preview/services/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primaryColor: primary,
        fontFamily: manrope,
        useMaterial3: true,
      ),
      home: const LandingPageST(),
    );
  }
}

/*  
  IMMEDIATE CANGES TO DO
  line no. 46 file: lp_header.dart 
*/

/*
Todo

  OnboardingScreens widget with name "Induction" which would have 

refer this: https://wtflex.in

Find a way to manipulate the parameters without creating a object of a class.
  (ex: provide data to the Airoll which is not directly accessible but takes data from Header, 
  but want to customise the airoll without providing extra data to the Header 
  and also not adding all extra parameters to Header to take that data)


LandingPage
1.  Add "fix footer" logic here as well as in the code block where it will show fix footer.
2.  allow both leading and trailing in the small screen appbar, 
    so that any one place can be used to open drawer and other canbe used for trailing or something else.
3.  

Header
1.  different styles of tabitem UI (Ex: link text, grouping tabs , ... ) 
2.  we can take unique secret in tabitem to perform groupism.
    OR we can take seperate group of children and apply properties in group to those children.
    to do so we'll make one model to take children and their appearance like color, style, ... 
3.  color of header background.
4.  

New Sections to Introduce
1.  Reactive Top ADDs banner.
2. 


Show replicate: https://flokk.app/#/
 */
