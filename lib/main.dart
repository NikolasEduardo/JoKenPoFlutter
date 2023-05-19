import 'package:flutter/material.dart';
import 'jogo.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: Jogo(),
    debugShowCheckedModeBanner: false,
  ));
}
