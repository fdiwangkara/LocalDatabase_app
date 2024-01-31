import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'db/db_helper.dart';
import 'pages/create/bindings.dart';
import 'pages/create/create.dart';
import 'pages/home/bindings.dart';
import 'pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: "/",
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(
            name: "/",
            page: () => const HomePage(),
            binding: HomeBindings()),
        GetPage(
            name: "/create",
            page: () => const CreatePage(),
            binding: CreateBindings()),
      ],
    );
  }
}