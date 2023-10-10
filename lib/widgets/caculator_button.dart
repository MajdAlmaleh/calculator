import 'package:calculator/providers/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool isOperation = true;
bool point = false;
bool pointAfter = false;
bool usedBrackets = false;
bool canUseBrackets = true;

class CaculatorButton extends ConsumerWidget {
  final Color color;
  final String? text;
  final IconData? icon;
  final Color textColor;
  const CaculatorButton(
      {super.key,
      required this.color,
      this.text,
      this.textColor = Colors.white,
      this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          switch (text) {
            case null:
              isOperation = false;
              ref.read(screenProvider.notifier).deleteItem();
              break;

            case 'C':
              canUseBrackets = true;
              pointAfter = false;
              usedBrackets = false;
              point = false;
              isOperation = false;
              ref.read(screenProvider.notifier).clearItems();
              break;

            case '÷' || '×' || '+' || '-' || '%':
              if (ref.read(screenProvider.notifier).getNumberOfItems() != 0) {
                if (usedBrackets) {
                  canUseBrackets = false;
                } else {
                  canUseBrackets = true;
                }

                if (point) {
                  pointAfter = false;
                  point = true;
                  ref.read(screenProvider.notifier).addOperation(text!);
                } else if (isOperation) {
                  pointAfter = false;
                  point = true;
                  ref.read(screenProvider.notifier).addOperation(text!);
                } else {
                  point = true;
                  pointAfter = false;
                  isOperation = true;
                  ref.read(screenProvider.notifier).addItem(text!);
                }
              }
              break;

            case '.':
              if (ref.read(screenProvider.notifier).getNumberOfItems() != 0) {
                if (!isOperation && !point && !pointAfter) {
                  ref.read(screenProvider.notifier).addItem(text!);
                  point = true;
                  pointAfter = true;
                  canUseBrackets = false;
                }
              }

            case '( )':
              if (canUseBrackets) {
                if (usedBrackets) {
                  ref.read(screenProvider.notifier).addItem(')');
                  usedBrackets = false;
                } else {
                  ref.read(screenProvider.notifier).addItem('(');
                  usedBrackets = true;
                }
              }
              break;

            case '=':
 ref.read(screenProvider.notifier).getResult();

            default:
              point = false;
              canUseBrackets = true;
              isOperation = false;
              ref.read(screenProvider.notifier).addItem(text!);
          }
        },
        child: CircleAvatar(
          backgroundColor: color,
          radius: 45,
          child: icon == null
              ? Text(
                  text!,
                  style: TextStyle(fontSize: 40, color: textColor),
                )
              : Icon(
                  icon,
                  size: 40,
                ),
        ),
      ),
    );
  }
}
