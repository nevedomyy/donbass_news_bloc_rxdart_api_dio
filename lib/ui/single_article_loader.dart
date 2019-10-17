import 'package:flutter/material.dart';


class SingleArticleLoader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(22.0),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}