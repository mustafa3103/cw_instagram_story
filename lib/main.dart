import 'package:codeway_case_study/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:codeway_case_study/helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
