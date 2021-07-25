import 'package:flutter/material.dart';
import 'absorbpointer.dart';
import 'dismissible.dart';
import 'dragwidgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
Widget build(BuildContext context) {

	return Scaffold(
    appBar: AppBar(
          title: Text('Interaction Model Widgets'),
          centerTitle: true,
          backgroundColor: Colors.teal[900],
          elevation: 5,
          shadowColor: Colors.grey[300],
        ),
        body: Center(            
          child: Card(
            elevation: 50,
            shadowColor: Colors.grey[400],
            color: Colors.teal[800],
            child: SizedBox(
              width: 300,
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children:[
                    SizedBox(
                        height: 30,
                      ),
                      Text('CMS Providers',
                      style: TextStyle(
                        height: 3,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Add and view first name, last name, gender, email and phone number.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        wordSpacing: 1,
                        color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        ),
                      ],
                  ),
                ),
              )
            ),
          ),      
          drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/48019432?s=400&u=82e17c6c8b1016b1449b06df63864b00ebee21fe&v=4'),
                    ),
                    Padding(padding: EdgeInsets.all(1.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Ayesha Tahir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('2018-CS-22',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      )
                    ),
                  ],
                ),
                
                decoration: BoxDecoration(
                  color: Colors.teal[900],
                ),
                
                ),
                ListTile(
                  leading: new Icon(Icons.mouse),
                  title: Text('Absorb Pointer'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AbsorbPointerWidget()));
                   // Navigator.pop(context);
                  }
                  
                ),
                ListTile(
                  leading: new Icon(Icons.inbox),
                  title: Text('Dismissible'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DismissibleWidget()));
                   // Navigator.pop(context);
                  }
                  
                ),
                ListTile(
                  leading: new Icon(Icons.drag_handle),
                  title: Text('Drag Target & Draggable'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DragWidgets()));
                   // Navigator.pop(context);
                  }
                ),
                
            ]
          ),
        ),  
	  );
  }
}
