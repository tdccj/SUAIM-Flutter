import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text("hi",
          style: TextStyle(color: Color.fromARGB(255, 24, 121, 201))), // 设置标题颜色
      // centerTitle: true, // 设置标题居中
      backgroundColor: Colors.white, // 设置appbar背景
      elevation: 5, // 阴影
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
