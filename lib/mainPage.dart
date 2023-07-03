import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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
          const SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 4,
            child: Row(
              // 显示数据
              children: [
                const SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: Center(
                    child: Image.asset('assets/halo.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const Spacer(
            // 分割两大模块
            flex: 1,
          ),
          const SizedBox(
            // 功能按钮区
            height: 150,
          )
        ],
      ),
    );
  }
}
