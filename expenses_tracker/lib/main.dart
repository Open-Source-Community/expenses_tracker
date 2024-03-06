import 'package:device_preview/device_preview.dart';
import 'package:expenses_tracker/view/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(/*DevicePreview(builder: (context) =>*/ MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
