import 'package:calculator/constants/calculator_items.dart';
import 'package:calculator/widgets/screeen.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Screen(),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 2,
            child: Container(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return calculatorItems[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
