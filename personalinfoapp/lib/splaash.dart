import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(splaashpage());
}

class splaashpage extends StatefulWidget {
  const splaashpage({super.key});

  @override
  State<splaashpage> createState() => _splaashpageState();
}

class _splaashpageState extends State<splaashpage> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.amber,
      child: Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}
