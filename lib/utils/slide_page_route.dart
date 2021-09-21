import 'package:flutter/material.dart';

class SlidePageRoutes extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  SlidePageRoutes({
      required this.child,
      this.direction = AxisDirection.left,
  }) : super(
      // transitionDuration: Duration(milliseconds: 400),
      // reverseTransitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      child: child,
      position: Tween<Offset>(
        begin: _getBeginOffset(), 
        end: Offset.zero).animate(animation),
    );
  }

  Offset _getBeginOffset() {
    switch (direction) {
      case AxisDirection.up: return Offset(0, 1);
      case AxisDirection.down: return Offset(0, -1);
      case AxisDirection.right: return Offset(-1, 0);
      case AxisDirection.left: return Offset(1, 0);
    }
  }
}
