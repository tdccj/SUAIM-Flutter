import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suaim/addItem.dart';
import 'haloAni.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key}); // 定义构造方法

  @override
  Widget build(BuildContext context) {
    // 构建MyApp组件
    return Container(
      // 创建主页面
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        // 第一层结构为cloumn，分割显示和按钮
        children: [
          const Spacer(
            flex: 1,
          ),
          const Flexible(
            flex: 5,
            child: Row(
              // 显示区
              children: [
                SizedBox(
                  width: 30,
                ),
                Flexible(
                  // 显示总量数据
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      HaloAni(), // 引入光环动画
                      Text('data')
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const Spacer(
            // 分割两大模块
            flex: 1,
          ),
          Flexible(
            // 功能按钮区
            flex: 2,
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  // 添加物品界面
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const AddItem())); // 导航到添加页面
                      },
                      child: const Text(
                        '添加',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'KeShiLuYanTi',
                          color: Color.fromARGB(255, 22, 130, 218),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const AddItem())); // 导航到添加页面
                      },
                      child: const Text(
                        '打印',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'KeShiLuYanTi',
                            color: Color.fromARGB(255, 22, 130, 218)),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const AddItem())); // 导航到添加页面
                      },
                      child: const Text(
                        '管理',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'KeShiLuYanTi',
                            color: Color.fromARGB(255, 22, 130, 218)),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
