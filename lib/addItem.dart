import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 改变颜色
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 22, 130, 218),
        //设置阴影
        elevation: 1,
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
              '添加',
              style: TextStyle(
                color: Color.fromARGB(255, 22, 130, 218),
                fontSize: 30,
                fontFamily: 'KeShiLuYanTi',
              ),
            ),
          ],
        ),
        // 在appbar上添加按钮
        actions: [
          Row(
            children: [
              // 左侧有自带的back
              // TextButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Text('back'),
              // ),

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
              // 右侧留空
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
