import 'package:flutter/material.dart';
import 'haloAni.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key}); // 定义构造方法

  @override
  Widget build(BuildContext context) {
    // 构建MyApp组件
    return Container(
      // 创建主页面
      color: const Color.fromARGB(255, 255, 255, 255),
      child: const Column(
        // 第一层结构为cloumn，分割显示和按钮
        children: [
          SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 4,
            child: Row(
              // 显示区
              children: [
                SizedBox(
                  width: 30,
                ),
                Flexible(
                  // 显示总量数据
                  child: Center(
                    child: HaloAni(), // 引入光环素材
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Spacer(
            // 分割两大模块
            flex: 1,
          ),
          SizedBox(
            // 功能按钮区
            height: 150,
          )
        ],
      ),
    );
  }
}
