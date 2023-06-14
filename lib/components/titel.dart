import 'package:flutter/material.dart';

Padding title({String text = ''}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
