import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key}); // 定义构造方法
  void _onButtonpressed() {
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    // 构建MyApp组件
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 4,
            child: Row(
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
            flex: 1,
          ),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
