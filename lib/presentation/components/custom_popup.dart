import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final DateTime selectedDate;

  const CustomPopup({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Selected image'),
      content: Container(),
    );
  }
}
