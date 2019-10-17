import 'package:flutter/material.dart';


class ListError extends StatelessWidget{
  final String error;
  final Function onTap;

  ListError({
    @required this.error,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            error,
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: Text(
              'ОБНОВИТЬ',
              style: Theme.of(context).textTheme.body2,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
        )
      ],
    );
  }
}