import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static void showToast(String msg) {
    if (msg == null) {
      return;
    }
    Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }
}

const String IMPACT = "impact";
const String MONTSERRAT = 'Montserrat-Medium';

Widget customProgressIndicator() {
  return SpinKitRing(
    color: Colors.red,
    size: 36,
    lineWidth: 3,
    duration: Duration(
      seconds: 1,
    ),
  );
}

Widget movieRating(double tvr) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3), color: Colors.red),
    child: Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "TVR",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 0.6,
                  fontFamily: "impact",
                  color: Colors.white),
              children: <TextSpan>[
                TextSpan(text: "  "),
                TextSpan(
                  text: tvr.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: MONTSERRAT,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    ),
  );
}

Widget divider(context) {
  return Container(
    width: Constants.screenSize(context).width * 0.4,
    child: Divider(
      thickness: 0.5,
      color: Colors.red,
    ),
  );
}

String formatDuration(int seconds) {
  if (seconds == null) return '';
  if (seconds <= 60) {
    return '$seconds sec';
  }
  if (seconds <= 60 * 60) {
    return '${(seconds / 60).floor()} min';
  }
  return '${(seconds / 60 / 60).round()} h ${(seconds / 60 % 60).floor()} min';
}
