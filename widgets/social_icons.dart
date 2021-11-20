import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final List<Color>? colors;
  final Icon? icon;
  final Function? onPressed;

  SocialIcon({
    this.colors,
    this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: colors!,
              )
          ),
          child: RawMaterialButton(
              shape: CircleBorder(),
              onPressed: onPressed as void Function()?,
              child: icon,
          )
      ),
    );
  }
}