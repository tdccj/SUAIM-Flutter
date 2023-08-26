import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'home.dart';
import 'addItem.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //移除debug标志

      theme: ThemeData(
          fontFamily: 'HarmonyOS_Sans_SC'), // 设置全局主题样式，字体为‘HarmonyOS_Sans_SC’
      home: const Home(), // 引入程序
      routes: {
        'roter/additem': (_) => const AddItem(),
        // "roter/home": (_) => const MainPage()
        // 主页面用命名路由可能发生bug，应改为使用 Navigator.pop(context);
        // *也许是因为导航向了,MainPage()而不是home
      }, // 定义路由
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
