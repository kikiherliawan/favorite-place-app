import 'package:flutter/material.dart';

class InputCamera extends StatefulWidget {
  const InputCamera({super.key});

  @override
  State<InputCamera> createState() => _InputCameraState();
}

class _InputCameraState extends State<InputCamera> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: () {},
        label: Text('Take Picture'),
        icon: Icon(Icons.camera),
      ),
    );
  }
}
