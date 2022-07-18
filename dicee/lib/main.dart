import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}



class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber=5;
  int rightDiceNumber=5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  leftDiceNumber=3;
                  print('Left Button is Pressed');
                });
              },
              child: Image(
                image: AssetImage('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          SizedBox(
            width: 35.0,
          ),
          Expanded(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  rightDiceNumber=3;
                  print('Right Button is Pressed');
                });
              },
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
  }
}
