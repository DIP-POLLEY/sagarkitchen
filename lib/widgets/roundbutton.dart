import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  RoundButton({this.icon,this.onpres});

  final Function onpres;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onpres,
        elevation: 5,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        constraints: BoxConstraints.tightFor(width: 90,height: 45),
        shape: CircleBorder(),
        fillColor: Colors.blue
    );
  }
}

