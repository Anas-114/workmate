// import 'package:flutter/material.dart';

// class AppTheme {
//   // Light Theme
//   static final ThemeData lightTheme = ThemeData(
//     primaryColor: Colors.blue,
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.blue,
//       elevation: 0,
//       iconTheme: IconThemeData(color: Colors.white),
//       titleTextStyle: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     ),
//     textTheme: const TextTheme(
//       titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       bodyMedium: TextStyle(fontSize: 16),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Colors.blue,
//     ),
//     buttonTheme: const ButtonThemeData(
//       buttonColor: Colors.blue,
//       textTheme: ButtonTextTheme.primary,
//     ),
//   );

//   // Dark Theme
//   static final ThemeData darkTheme = ThemeData(
//     primaryColor: Colors.blueGrey,
//     scaffoldBackgroundColor: Colors.black,
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.blueGrey,
//       elevation: 0,
//       iconTheme: IconThemeData(color: Colors.white),
//     ),
//     textTheme: const TextTheme(
//       titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//       bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Colors.blueGrey,
//     ),
//   );
// }

// // Export a single theme to be used by the app.
// final ThemeData appTheme = AppTheme.lightTheme;



import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey,
    ),
  );
}

final ThemeData appTheme = AppTheme.lightTheme;