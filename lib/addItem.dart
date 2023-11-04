import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dio/dio.dart';
import 'addItem_page.dart';
import 'common/global.dart';

void _printer() async {
  print('object');
}

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 改变颜色
          backgroundColor: Colors.white,
          foregroundColor: defaultColor,
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
          title: Row(
            children: [
              Text(
                '添加',
                style: TextStyle(
                  color: defaultColor,
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
                    iconNormal: defaultColor,
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
                    iconNormal: defaultColor,
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
                    iconNormal: defaultColor,
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
        body: additempage());
  }
}
