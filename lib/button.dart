import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String number;
  final Color? color;
  final VoidCallback onPress;
  const Button({
    super.key,
    required this.number,
    this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 13, right: 10),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: color ?? const Color(0xFF626262),
          ),
          child: Center(
              child: Text(
            number,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
      ),
    );
  }
}
