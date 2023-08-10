import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {
  const AnsButton(this.ansText, this.onTap, {super.key});
  final String ansText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 5, 4, 110),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        ansText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
