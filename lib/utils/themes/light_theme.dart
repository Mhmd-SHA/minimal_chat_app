import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.inter().fontFamily,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade300,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.grey.shade600,
    ),
    titleTextStyle: TextStyle(
      color: Colors.grey.shade600,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey.shade500,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
    Colors.grey.shade900,
  ))),
  switchTheme: SwitchThemeData(
      overlayColor: WidgetStateProperty.all(Colors.teal),
      trackColor: WidgetStateProperty.all(Colors.amber),
      trackOutlineColor: WidgetStateProperty.all(Colors.amber)),
  scaffoldBackgroundColor: Colors.grey.shade300,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  ),
);

// ThemeData lightTheme = ThemeData(
//   primaryColor: lightThemeColor,
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: white,
//   useMaterial3: true,
//   switchTheme: SwitchThemeData(
//     thumbColor:
//         MaterialStateProperty.resolveWith<Color>((states) => lightThemeColor),
//   ),
//   appBarTheme: AppBarTheme(
//     centerTitle: true,
//     backgroundColor: white,
//     scrolledUnderElevation: 0,
//     titleTextStyle: TextStyle(
//       fontWeight: FontWeight.w500,
//       color: black,
//       fontSize: 23, //20
//     ),
//     iconTheme: IconThemeData(color: lightThemeColor),
//     elevation: 0,
//     actionsIconTheme: IconThemeData(color: lightThemeColor),
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: white,
//       statusBarIconBrightness: Brightness.dark,
//     ),
//   ),
// );

// //dark theme
// ThemeData darkThemee = ThemeData(
//   primaryColor: darkThemeColor,
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: black,
//   useMaterial3: true,
//   switchTheme: SwitchThemeData(
//       overlayColor: WidgetStateProperty.all(Colors.teal),
//       trackColor: WidgetStateProperty.all(Colors.amber),
//       trackOutlineColor: WidgetStateProperty.all(Colors.amber)),
//   appBarTheme: AppBarTheme(
//     centerTitle: true,
//     backgroundColor: black,
//     scrolledUnderElevation: 0,
//     titleTextStyle: TextStyle(
//       fontWeight: FontWeight.w500,
//       color: white,
//       fontSize: 23, //20
//     ),
//     iconTheme: IconThemeData(color: darkThemeColor),
//     elevation: 0,
//     actionsIconTheme: IconThemeData(color: darkThemeColor),
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: black,
//       statusBarIconBrightness: Brightness.light,
//     ),
//   ),
// );

Color lightThemeColor = Colors.red,
    white = Colors.white,
    black = Colors.black,
    darkThemeColor = Colors.blue;

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.inter().fontFamily,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.grey.shade200,
    ),
    titleTextStyle: TextStyle(
      color: Colors.grey.shade200,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey.shade200,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
    Colors.grey.shade300,
  ))),
  switchTheme: SwitchThemeData(
      overlayColor: WidgetStateProperty.all(Colors.teal),
      trackColor: WidgetStateProperty.all(Colors.amber),
      trackOutlineColor: WidgetStateProperty.all(Colors.amber)),
  scaffoldBackgroundColor: Colors.grey.shade900,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,
  ),
);
