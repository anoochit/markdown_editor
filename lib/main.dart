import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Markdown Editor",
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(),
      getPages: AppPages.routes,
    ),
  );
}
