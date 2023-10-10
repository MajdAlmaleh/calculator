import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';



class ScreenNotifier extends StateNotifier<String> {
  ScreenNotifier() : super('');

  void addItem(String item) {
    if (state.length >= 48) {
      return;
    }
    state = '$state$item';
  }

  void addOperation(String item) {
    deleteItem();
    addItem(item);
  }

  void deleteItem() {
    state = state.substring(0, state.length - 1);
  }

  void clearItems() {
    state = '';
  }

  String getItems() {
    return state;
  }

  int getNumberOfItems() {
    return state.length;
  }

  String getResult() {
    String tmp = state;
    tmp = tmp.replaceAll('×', '*');
    tmp = tmp.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(tmp);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      tmp = result.toString();
      state = tmp;
      return state;
    } catch (e) {
      return state;
    }
  }
}

final screenProvider =
    StateNotifierProvider<ScreenNotifier, String>((ref) => ScreenNotifier());
