import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          fontFamily: 'HarmonyOS_Sans_SC'), // 设置全局主题样式，字体为‘HarmonyOS_Sans_SC’
      home: Scaffold(
        // 构建主界面
        appBar: AppBar(
          // 设置顶部导航栏
          title: const Text("溯物-SUAIM", // 设置标题文本内容
              style: TextStyle(
                  color: Color.fromARGB(255, 24, 121, 201), // 设置标题颜色
                  fontWeight: FontWeight.w400)), // 设置标题文本的字体粗细
          backgroundColor: Colors.white, // 设置导航栏背景颜色
          elevation: 2, // 设置导航栏底部阴影的高度
        ),
        body: const MyApp(), // 设置主界面内容为MyApp组件
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 定义构造方法

  @override
  Widget build(BuildContext context) {
    // 构建MyApp组件
    return Center(
        // 子组件居中对齐
        child: Container(
      // 创建容器
      alignment: Alignment.center,
      // 子组件居中对齐
      width: 100, // 设置容器宽度
      height: 100, // 设置容器高度
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 109, 109, 109)), // 设置容器背景颜色
      child: const Text(
        // 创建文本组件
        "hi", // 设置文本内容
        style: TextStyle(
            fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)), // 设置文本颜色
      ),
    ));
  }
}
