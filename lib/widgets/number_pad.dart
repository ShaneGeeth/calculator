import 'package:calculator/widgets/number.dart';
import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  final List<String>? numberList;
  final Function calFun;

  const NumberPad(this.numberList, this.calFun, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: numberList!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 80,
          crossAxisCount: 4,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30),
      itemBuilder: (ctx, item) => Number(numberList![item], calFun),
    );
  }
}
