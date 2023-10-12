import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:princess_diaries/presentation/components/theme_list_item.dart';
import 'package:princess_diaries/presentation/settings/theme/setting_theme_top_level.dart';

class SettingThemeScreen extends StatelessWidget {
  const SettingThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '테마를 선택해주세요',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                changeTheme('assets/princess');
                context.pop('assets/princess');
                print(theme);
              },
              child: const ThemeListItem(
                emoji: 'princess',
                name: '오늘부터 공주님',
                explain: '그냥 평범했던 내가 알고보니\n공주님?! 엄마도 모르는 내 출생의 비밀...!!',
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                changeTheme('assets/butler');
                context.pop('assets/butler');
                print(theme);
              },
              child: const ThemeListItem(
                emoji: 'butler',
                name: '갓생 사는 집사님',
                explain: '왕궁에서 제일 뛰어난 능력자...\n이지만 쿠키같은 멘탈의 소유자',
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                changeTheme('assets/maid');
                context.pop('assets/maid');
                print(theme);
              },
              child: const ThemeListItem(
                emoji: 'maid',
                name: '소울리스 시녀님',
                explain: '혐생과 현생을 오가며 왕궁으로\n출근하는 타성에 젖은 시녀장.\n영혼 없지만 친절하다',
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                changeTheme('assets/default');
                context.pop('assets/default');
                print(theme);
              },
              child: const Text(
                '기본테마로 설정',
                style: TextStyle(
                  color: Color(0xFFF287B7),
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFF287B7),
                  decorationThickness: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
