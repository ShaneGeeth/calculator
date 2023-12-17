import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  final String number;
  final Function calfun;

  const Number(this.number, this.calfun, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        calfun(number);
      },
      child: CircleAvatar(
        child: Text(number),
      ),
    );
  }
}
