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
        alignment: WrapAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.pop('assets/princess');
                      print('princess theme');
                    },
                    child: Image.asset(
                      'assets/princess/1.png',
                      fit: BoxFit.cover,
                      width: 70,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      context.pop('assets/butler');
                      print('butler theme');
                    },
                    child: Image.asset(
                      'assets/butler/1.png',
                      fit: BoxFit.cover,
                      width: 70,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      context.pop('assets/maid');
                      print('maid theme');
                    },
                    child: Image.asset(
                      'assets/maid/1.png',
                      fit: BoxFit.cover,
                      width: 70,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.pop('assets/default');
                },
                child: const Text(
                  '기본테마로 설정',
                  style: TextStyle(
                    color: Color(0xFFF287B7),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFF287B7),
                    decorationThickness: 3,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
