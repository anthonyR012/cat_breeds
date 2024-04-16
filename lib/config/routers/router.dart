import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;
  final int duration;
  final Color color;

  CustomPageRoute(
      {required this.builder, required this.duration, required this.color});

  @override
  Color get barrierColor => color;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: duration);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
