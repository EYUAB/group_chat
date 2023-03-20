import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login_screen.dart';

class Buttons extends StatelessWidget {
  String buttonType;
  String route;
  Color color;
   Buttons({
  required this.buttonType,
  required this.route,
  required this.color,
  }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: color,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, route);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    buttonType,
                  ),
                ),
              ),
            );
  }
}