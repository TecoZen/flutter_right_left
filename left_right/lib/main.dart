import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drag Left/Right"),
        ),
        body: DragScreen(),
      ),
    );
  }
}

class DragScreen extends StatefulWidget {
  @override
  _DragScreenState createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  String direction = "Drag your finger";
  Color textColor = Colors.black;
  Gradient backgroundGradient = LinearGradient(
    colors: [Colors.white, Colors.white],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          if (details.delta.dx > 0) {
            direction = "Right";
            textColor = Colors.white;
            backgroundGradient = LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            );
          } else if (details.delta.dx < 0) {
            direction = "Left";
            textColor = Colors.white;
            backgroundGradient = LinearGradient(
              colors: [Colors.redAccent, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            );
          }
        });
      },
      onPanEnd: (details) {
        setState(() {
          direction = "Drag";
          textColor = Colors.black;
          backgroundGradient = LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );
        });
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Center(
          child: Text(
            direction,
            style: TextStyle(fontSize: 24, color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
