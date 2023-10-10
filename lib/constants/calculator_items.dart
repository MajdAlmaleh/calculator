import 'package:calculator/widgets/caculator_button.dart';
import 'package:flutter/material.dart';

List<CaculatorButton> calculatorItems = [
  const CaculatorButton(text: 'C', color: Colors.grey,textColor: Colors.red),
  const CaculatorButton(text: '( )', color: Colors.grey,textColor: Colors.black),
  const CaculatorButton(text: '%', color: Colors.grey,textColor: Colors.black),
  const CaculatorButton(text: '÷', color: Colors.orange),
  const CaculatorButton(text: '7', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '8', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '9', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '×', color: Colors.orange),
  const CaculatorButton(text: '4', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '5', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '6', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '-', color: Colors.orange),
  const CaculatorButton(text: '1', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '2', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '3', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '+', color: Colors.orange),
  const CaculatorButton(text: '0', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '.', color: Color.fromARGB(255, 31, 31, 30)),
  const CaculatorButton(text: '=', color: Colors.orange),
    const CaculatorButton( color: Colors.black,icon: Icons.backspace_outlined,),
];
