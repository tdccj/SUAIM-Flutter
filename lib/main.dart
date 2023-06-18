import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'HarmonyOS_Sans_SC'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("溯物-SUAIM",
              style: TextStyle(
                  color: Color.fromARGB(255, 24, 121, 201),
                  fontWeight: FontWeight.w400)), // 设置标题颜色
          // centerTitle: true, // 设置标题居中
          backgroundColor: Colors.white, // 设置appbar背景
          elevation: 2, // 阴影
        ),
        body: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("data", textDirection: TextDirection.ltr),
    );
  }
}
