import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //移除debug标志
      theme: ThemeData(
          fontFamily: 'HarmonyOS_Sans_SC'), // 设置全局主题样式，字体为‘HarmonyOS_Sans_SC’
      home: Scaffold(
        // 构建主界面
        body: const MyApp(), // 设置主界面内容为MyApp组件
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('data'),
          titleTextStyle:
              const TextStyle(color: Color.fromARGB(255, 22, 130, 218)),
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 22, 130, 218),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 定义构造方法

  @override
  Widget build(BuildContext context) {
    // 构建MyApp组件
    return Container(
      width: 50,
      color: const Color.fromARGB(255, 220, 219, 219),
      child: const Column(children: [Text('data'), Text('data')]),
    );
  }
}
