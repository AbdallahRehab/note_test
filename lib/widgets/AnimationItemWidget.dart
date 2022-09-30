import 'package:flutter/material.dart';

class AnimationItemWidget extends StatelessWidget{
  Widget child;
  Animation<double> animation;

  AnimationItemWidget({required this.child,required this.animation});

  @override
  Widget build(BuildContext context) {
    return  FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: child,
        ),
      );
  }

}