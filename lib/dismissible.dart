import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:interaction_model_widgets/ex.dart';
import 'package:interaction_model_widgets/main.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dismissible Widget'),
          centerTitle: true,
          backgroundColor: Colors.teal[900],
          elevation: 5,
          shadowColor: Colors.grey[300],
          ),
        body: const MyStatefulWidget(),
      );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({ Key? key }) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          child: ListTile(
            title: Text(
              'Block ${items[index]}',
            ),
          ),
          background: Container(
            color: Colors.green,
          ),
          key: ValueKey<int>(items[index]),
          onDismissed: (DismissDirection direction) {
            setState(() {
              items.removeAt(index);
            });
          },
        );
      },
    );
  }
}