import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SingleArticle extends StatelessWidget{
  final String source;
  final String title;
  final String description;
  final String published;
  final String url;

  SingleArticle({
    @required this.source,
    @required this.title,
    @required this.description,
    @required this.published,
    @required this.url
  });

  _launchURL() async{
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.body1,
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text(
                    source,
                    style: Theme.of(context).textTheme.body2,
                  ),
                  Text(
                    published.length>9 ? ' | ${published.substring(0,10)}' : '',
                    style: Theme.of(context).textTheme.overline
                  ),
                  Spacer(),
                  Icon(
                    Icons.launch,
                    size: 16.0,
                    color: Colors.black54,
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}