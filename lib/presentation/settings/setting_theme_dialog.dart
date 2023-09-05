import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingThemeDialog extends StatelessWidget {
  const SettingThemeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '테마를 선택해주세요!',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Wrap(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.pop('assets/princess');
                  print('princess theme');
                },
                child: Image.asset(
                  'assets/princess/5.png',
                  // 'assets/princess/princess_2.png',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('assets/butler');
                  print('butler theme');
                },
                child: Image.asset(
                  'assets/butler/1.png',
                  // 'assets/butler/butler_3.png',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('assets/maid');
                  print('maid theme');
                },
                child: Image.asset(
                  'assets/maid/5.png',
                  fit: BoxFit.cover,
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
