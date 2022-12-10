import 'dart:async';

import 'package:flutter/material.dart';

class SlideRightLeft extends StatefulWidget {
  final Widget child;
  final int? delay;

  SlideRightLeft({required this.child, this.delay});

  @override
  _SlideRightLeftState createState() => _SlideRightLeftState();
}

class _SlideRightLeftState extends State<SlideRightLeft> with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    final curve =
    CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin: const Offset(2.0, 0.0), end: Offset.zero)
        .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(seconds: widget.delay!), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}