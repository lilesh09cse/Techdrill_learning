import 'dart:ui';

import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Image"),
        ),
        backgroundColor: Colors.blue.shade100,
        body: Container(
          child: Column(
            children: [
              Image(
                  width: MediaQuery.of(context).size.width,
                  image: NetworkImage(
                      "https://www.azquotes.com/picture-quotes/quote-both-optimists-and-pessimists-contribute-to-society-the-optimist-invents-the-aeroplane-george-bernard-shaw-39-34-36.jpg")),
              SizedBox(
                height: 20,
              ),
              Wrap(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Colors.blue[300],
                    label: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "THANKS FOR VISITING!!",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'RobotoMono',
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              Text(
                "Thank you @Yashpathack sir and @GDGJalandhar team.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightGreen[600],
                  decorationStyle: TextDecorationStyle.wavy,
                  fontSize: 30,
                  fontFamily: 'RobotoMono',
                ),
              )
            ],
          ),
        ));
  }
}
