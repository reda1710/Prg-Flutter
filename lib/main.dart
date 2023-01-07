import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:projet1/pages/food/popular_food_details.dart';
import 'package:projet1/pages/food/recommanded_food_detail.dart';
import 'package:projet1/pages/home/food_page_body.dart';
import 'package:projet1/pages/home/main_food_page.dart';
import 'package:projet1/routes/route_helper.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
    );
  }
}
