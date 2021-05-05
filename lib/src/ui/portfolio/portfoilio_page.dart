import 'package:drill_app/src/ui/portfolio/MyImage.dart';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//const _url = 'https://flutter.dev';
void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MyImage()), //here the MyImage is the dart class where on pressed it will route
          );
        },
        child: Icon(Icons.image),
      ),
      appBar: AppBar(
        title: Text("Portfolio"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: //Image(
                  //width: MediaQuery.of(context).size.width * 1 / 7,
                  //image: NetworkImage(
                  //"https://st2.depositphotos.com/1006318/5909/v/950/depositphotos_59094701-stock-illustration-businessman-profile-icon.jpg"))),
                  Image.asset('assets/icons/App_image.jpg',
                      width: MediaQuery.of(context).size.width * 1 / 3),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lilesh Gawande",
              style: TextStyle(fontSize: 30, fontFamily: 'RobotoMono'),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              shadowColor: Colors.black,
              color: Colors.amber.shade100,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Mobile App Developer",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Hey I am learning Flutter. I have started with this with no prior knowledge of development.",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.red[400],
                  ),
                  Text(
                    "lileshgawande09@email.com",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                const url = 'https://twitter.com/LileshGawande';
                _launchURL(url);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
                    ),
                    Text(
                      "@LileshGawande",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                const url = 'https://github.com/lilesh09cse';
                _launchURL(url);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.github,
                      color: Colors.black45,
                    ),
                    Text(
                      "lilesh09cse",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                const url = 'https://flutter.dev';
                _launchURL(url);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigo,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.web),
                    Text(
                      "Click here to visit Flutter website",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Colors.blue[300],
                    label: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Flutter",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Colors.amber[300],
                    label: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "C Language",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Colors.deepPurple[300],
                    label: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "SQL",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Colors.green[300],
                    label: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Python",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
