import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int sumLeftDice = 0;
  int sumRightDice = 0;
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff5ffc6),

          title: Center(child: Text('Dicee', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffecc8ae),
            fontSize: 25.0,
          ),),),
        ),
        backgroundColor: Color(0xffb4e1ff),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              child: Center(
                child: Text(
                  'Play with the dices',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(child: Image.asset('images/dice$leftDiceNumber.png'),
                    onPressed: (){
                    setState(() {
                      leftDiceNumber = Random().nextInt(6) + 1;
                      sumLeftDice += leftDiceNumber;
                    });
                    },),
                ),
                Expanded(child: TextButton(child: Image.asset('images/dice$rightDiceNumber.png'),
                  onPressed: (){
                  setState(() {
                    rightDiceNumber = Random().nextInt(6) + 1;
                    sumRightDice += rightDiceNumber;
                  });
                  },),)
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sum = $sumLeftDice',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),),
                  Text('Sum = $sumRightDice',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Steps to play the game:-'),
                  Text('1. Roll the dice till the sum of both players are not same(0 is not counted)'),
                  Text('2. When the sum is same check the number appearing on the dice'),
                  Text('3. There will be two scenerio'),
                  Text('a. If numbers on both the dice are same then keep rolling and repeating steps 1 and 2'),
                  Text('b. If numbers are different, the one having larger number on the dice wins.')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}