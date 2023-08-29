import 'package:flutter/material.dart';

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
                  print('알 수 없음');
                },
                child: Image.asset(
                  'assets/icon-question-mark.png',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  print('슬픔, 우울');
                },
                child: Image.asset(
                  'assets/princess/princess_1.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  print('행복, 기쁨');
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
                  print('화남, 짜증');
                },
                child: Image.asset(
                  'assets/princess/princess_3.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  print('놀람, 깨달음');
                },
                child: Image.asset(
                  'assets/princess/princess_4.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  print('그저 그럼, 차분');
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
