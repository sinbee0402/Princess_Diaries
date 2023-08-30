import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmojiPopup extends StatelessWidget {
  const EmojiPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.7),
      title: const Text(
        '감정을 선택해주세요!',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.pop('assets/icon-question-mark.png');
                },
                child: Image.asset(
                  'assets/icon-question-mark.png',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('assets/princess/princess_1.png');
                },
                child: Image.asset(
                  'assets/princess/princess_1.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('assets/princess/princess_2.png');
                },
                child: Image.asset(
                  'assets/princess/princess_2.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.pop('assets/princess/princess_3.png');
                },
                child: Image.asset(
                  'assets/princess/princess_3.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('assets/princess/princess_4.png');
                },
                child: Image.asset(
                  'assets/princess/princess_4.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('assets/princess/princess_5.png');
                },
                child: Image.asset(
                  'assets/princess/princess_5.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
