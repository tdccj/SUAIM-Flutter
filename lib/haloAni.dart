import 'package:flutter/material.dart';

class HaloAni extends StatefulWidget {
  const HaloAni({super.key});

  @override
  State<HaloAni> createState() => _HaloAniState();
}

// 定义类，继承State，混入SingleTickerProviderStateMixin
class _HaloAniState extends State<HaloAni> with TickerProviderStateMixin {
  late AnimationController _contorller;
  @override
  void initState() {
    super.initState();
    _contorller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat() // 循环动画
        ;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _contorller,
        child: Image.asset('assets/halo.png'),
      ),
    );
  }
}
