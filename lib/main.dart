import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.brown,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: const DodecahedronDice(title: 'Dodecahedron Dice'),
    );
  }
}

class DodecahedronDice extends StatefulWidget {
  const DodecahedronDice({super.key, required this.title});

  final String title;
  @override
  State<DodecahedronDice> createState() => _MyHomePageState();
}

int getRandom(int min, int max){
  return min + Random().nextInt(max-min+1);
}

class _MyHomePageState extends State<DodecahedronDice> {
  int _diceNumber = 1;

  void _getNewDice() {
    setState(() {
      _diceNumber = getRandom(1,12);
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: _height/4, horizontal: _width/50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                onPressed: (){
                  _getNewDice();
                  print('Dice pressed: $_diceNumber');
                },
                child: Container(
                  child: Image.asset('images/dodecahedron$_diceNumber.png',
                      height: _height/3,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
