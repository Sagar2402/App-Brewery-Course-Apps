import 'package:flutter/material.dart';


void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(

              ),
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage("images/Sagar.jpg"),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Sagar Pathak',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 35,
                  color: Colors.white,
                  //backgroundColor: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,

                ),

              ),
              Text(
                'ML HEAD',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  //fontStyle: FontStyle.italic,
                  fontSize: 30,
                  color: Colors.white,
                  //backgroundColor: Colors.blue.shade400,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.5,
                ),
              ),
              Divider(
                color: Colors.white,
                indent: 50.0,
                endIndent: 50.0,
                thickness: 3.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 200,
                height: 50,
                color: Colors.white,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.phone_android_rounded
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SelectableText(
                      '9769327968',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              Container(
                padding: EdgeInsets.all(10),
                width: 400,
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.mail_outline_rounded,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SelectableText(
                      'sagar.pathak@iecsemanipal.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
