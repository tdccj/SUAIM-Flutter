import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //移除debug标志

      theme: ThemeData(
          fontFamily: 'HarmonyOS_Sans_SC'), // 设置全局主题样式，字体为‘HarmonyOS_Sans_SC’
      home: const Home(), // 引入程序
    ),
  );

  // bitsdojo_window显示窗口，并设定窗口最小值
  doWhenWindowReady(
    () {
      const initialSize = Size(400, 600);
      appWindow.minSize = initialSize;
      appWindow.show();
    },
  );
}
