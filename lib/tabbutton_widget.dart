import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key key,
    @required this.btnColor,
    @required this.btnText,
    @required this.btnFunction,
    @required this.btnTxtColor,

  }) : super(key: key);

  final Color btnColor;
  final String btnText;
  final Function btnFunction;
  final Color btnTxtColor;



  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: btnColor,

      borderRadius: BorderRadius.circular(40.0),
      child: MaterialButton(
        onPressed: btnFunction,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          btnText,
          style: TextStyle(fontSize: 17.0,color: btnTxtColor),
        ),
      ),
    );
  }
}

