import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //移除debug标志

      theme: ThemeData(
          fontFamily: 'HarmonyOS_Sans_SC'), // 设置全局主题样式，字体为‘HarmonyOS_Sans_SC’
      home: Scaffold(
        // 构建主界面
        body: const MyApp(), // 设置主界面内容为MyApp组件
        drawer: const Drawer(
          child: Scaffold(
            body: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      '目录',
                      style: TextStyle(
                          color: Color.fromARGB(255, 22, 130, 218),
                          fontSize: 30,
                          fontFamily: 'LingDongQiCheChunTang'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          // 改变颜色
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 22, 130, 218),
          // 在整个appbar上添加拖动控件
          flexibleSpace: SizedBox(
            height: kToolbarHeight, // 设置flexibleSpace的高度为AppBar的高度
            child: WindowTitleBarBox(
              child: MoveWindow(
                child: Container(color: Colors.white),
              ),
            ),
          ),
          // 在appbar上添加标题
          title: const Row(
            children: [
              Text(
                '溯物',
                style: TextStyle(
                  color: Color.fromARGB(255, 22, 130, 218),
                  fontSize: 30,
                  fontFamily: 'KeShiLuYanTi',
                ),
              ),
              Text(
                '-SUAIM',
                style: TextStyle(
                    color: Color.fromARGB(255, 22, 130, 218),
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'KeShiLuYanTi'),
              )
            ],
          ),
          // 在appbar上添加按钮
          actions: [
            Row(
              children: [
                // 添加窗口控制按钮：最小化、最大化、关闭
                MinimizeWindowButton(
                  colors: WindowButtonColors(
                    normal: Colors.white,
                    iconNormal: const Color.fromARGB(255, 22, 130, 218),
                    mouseDown: const Color.fromARGB(255, 19, 81, 132),
                    mouseOver: const Color.fromARGB(255, 107, 186, 249),
                    iconMouseDown: Colors.white54,
                    iconMouseOver: Colors.white,
                  ),
                  animate: true,
                ),
                MaximizeWindowButton(
                  colors: WindowButtonColors(
                    normal: Colors.white,
                    iconNormal: const Color.fromARGB(255, 22, 130, 218),
                    mouseDown: const Color.fromARGB(255, 19, 81, 132),
                    mouseOver: const Color.fromARGB(255, 107, 186, 249),
                    iconMouseDown: Colors.white54,
                    iconMouseOver: Colors.white,
                  ),
                  animate: true,
                ),
                CloseWindowButton(
                  colors: WindowButtonColors(
                    normal: Colors.white,
                    iconNormal: const Color.fromARGB(255, 22, 130, 218),
                    mouseDown: const Color.fromARGB(255, 19, 81, 132),
                    mouseOver: const Color.fromARGB(255, 107, 186, 249),
                    iconMouseDown: Colors.white54,
                    iconMouseOver: Colors.white,
                  ),
                  animate: true,
                ),
                // 右侧留白
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      ),
    ),
  );

  // bitsdojo_window显示窗口
  doWhenWindowReady(
    () {
      const initialSize = Size(400, 600);
      appWindow.minSize = initialSize;
      appWindow.show();
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 定义构造方法
  void _onButtonpressed() {
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    // 构建MyApp组件
    return WindowBorder(
      color: Colors.blue,
      child: Container(
        // width: 60,
        color: const Color.fromARGB(255, 255, 255, 255),
        // child: Column(
        //   children: <Widget>[
        //     TextButton(onPressed: _onButtonpressed, child: const Text('Button'))
        //   ],
        // ),
      ),
    );
  }
}
