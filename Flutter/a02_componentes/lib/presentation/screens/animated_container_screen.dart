import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
   
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  double _borderRadius = 10.0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contenedores animados'),),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cambiarContainer,
        child: const Icon(Icons.play_arrow_outlined),
        ),
    );
  }

  void cambiarContainer() {
    
    final ramdom = Random();

    _width = ramdom.nextInt(300) + 50;
    _height = ramdom.nextInt(300) + 50;
    _borderRadius = ramdom.nextInt(50) + 10;

    _color = Color.fromRGBO(
      ramdom.nextInt(255), 
      ramdom.nextInt(255), 
      ramdom.nextInt(255), 
      1);

    setState(() {
      
    });
  }
}