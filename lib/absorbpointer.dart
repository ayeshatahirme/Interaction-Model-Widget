import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AbsorbPointerWidget extends StatefulWidget {
  const AbsorbPointerWidget({ Key? key }) : super(key: key);

  @override
  _AbsorbPointerWidgetState createState() => _AbsorbPointerWidgetState();
}

class _AbsorbPointerWidgetState extends State<AbsorbPointerWidget> {
  bool _absorbing = false;
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Absorb Pointer Widget'),
          centerTitle: true,
          backgroundColor: Colors.teal[900],
          elevation: 5,
          shadowColor: Colors.grey[300],
        ),
        body: Builder(
          builder: (context) => Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AbsorbPointer(
                    absorbing: _absorbing,
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Press the button'),
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Button Pressed!");
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                        height: 30
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Enable Absorb Pointer?'),
                      Switch(
                          value: _absorbing,
                          onChanged: (bool value) {
                            setState(() {
                              _absorbing = value;
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
}