import 'package:calculator/widgets/number_pad.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final List<String> numbers = [
    '7',
    '8',
    '9',
    '/',
    "4",
    "5",
    "6",
    "*",
    "1",
    '2',
    '3',
    '-',
    '.',
    '0',
    '+',
    "AC"
  ];

  String equation = '';
  double expr = 0;

  //String delete() {}

  double evaluate() {
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval;
  }

  void caluculate(String expression) {
    if (expression == "AC") {
      setState(() {
        equation = '';
        expr = 0;
      });
    } else if (expression.contains("+") ||
        expression.contains("-") ||
        expression.contains("*") ||
        expression.contains("/")) {
      setState(() {
        equation += expression;
      });
    } else {
      setState(() {
        equation += expression;
      });

      expr = evaluate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(12.0),
            child: Text(equation, style: const TextStyle(fontSize: 26)),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(16.0),
            child: Text(expr.toString(), style: const TextStyle(fontSize: 36)),
          ),
          Expanded(
            child: NumberPad(numbers, caluculate),
          ),
        ],
      ),
    );
  }
}
