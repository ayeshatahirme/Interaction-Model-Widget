import 'dart:convert';
import 'package:flutter/material.dart';

class DeaggableDragTargetWidget extends StatelessWidget {
  const DeaggableDragTargetWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Draggale and Drag Target Widget'),
          centerTitle: true,
          backgroundColor: Colors.teal[900],
          elevation: 5,
          shadowColor: Colors.grey[300],
          ),
        body: const DragWidgets(),
      );
  }
}

class DragWidgets extends StatefulWidget {
  const DragWidgets({ Key? key }) : super(key: key);

  @override
  _DragWidgetsState createState() => _DragWidgetsState();
}

class _DragWidgetsState extends State<DragWidgets> {
  Color caughtColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DragBox(
          Offset(100.0, 0.0),
          'Box A',
          Colors.blue,
        ),
        DragBox(
          Offset(200.0, 0.0),
          'Box B',
          Colors.orange,
        ),
        DragBox(
          Offset(300.0, 0.0),
          'Box C',
          Colors.lightGreen,
        ),
        Positioned(
          left: 150.0,
          bottom: 0.0,
          child: DragTarget(
            onAccept: (Color color) {
              caughtColor = color;
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                ),
                child: Center(
                  child: Text(
                    "Color Me!",
                    style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 22.0,
                  ),
                    ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(
    this.initPos,
    this.label,
    this.itemColor,
  );

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        data: widget.itemColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.itemColor,
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Container(
          width: 120.0,
          height: 120.0,
          color: widget.itemColor.withOpacity(0.5),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}