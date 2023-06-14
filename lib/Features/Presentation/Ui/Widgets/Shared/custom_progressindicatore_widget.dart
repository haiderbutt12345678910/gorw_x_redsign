import 'package:flutter/material.dart';

class CustomeCircularProgressIndicator extends StatelessWidget {
  const CustomeCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white.withOpacity(.4),
      width: double.infinity,
      height: double.infinity,
      child: const CircularProgressIndicator(
        color: Colors.teal,
      ),
    );
  }
}
