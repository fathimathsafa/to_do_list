import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controller/note_controller.dart';
import 'package:to_do_list/view/home_screen.dart';
import 'package:to_do_list/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
    
      home: SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(NoteController());
      }),
    );
  }
}
