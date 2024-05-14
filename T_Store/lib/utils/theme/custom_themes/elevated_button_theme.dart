import 'package:flutter/material.dart';

/// -- light and dark elevated button themes

class TElevatedButtonTheme {
  TElevatedButtonTheme._();  // to avoid creating instances

   /// -- light theme
   static final lightElevatedButtonTheme = ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
       elevation: 0,
       foregroundColor: Colors.white,
       backgroundColor: Colors.blue,
       disabledForegroundColor: Colors.grey,
       disabledBackgroundColor: Colors.grey,
       side: const BorderSide(color: Colors.blue),
       padding: const EdgeInsets.symmetric(vertical: 18),
       textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
     ),
   );

   /// -- dark theme
   static final darkElevatedButtonTheme = ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
       elevation: 0,
       foregroundColor: Colors.white,
       backgroundColor: Colors.blue,
       disabledForegroundColor: Colors.grey,
       disabledBackgroundColor: Colors.grey,
       side: const BorderSide(color: Colors.blue),
       padding: const EdgeInsets.symmetric(vertical: 18),
       textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
     ),
   );
}