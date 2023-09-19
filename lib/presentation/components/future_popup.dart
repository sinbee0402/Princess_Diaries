import 'package:flutter/material.dart';

class FuturePopup extends StatelessWidget {
  const FuturePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.white,
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            '기능 추가 예정입니다.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
