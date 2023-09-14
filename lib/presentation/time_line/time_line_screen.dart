import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:princess_diaries/presentation/components/time_line_calendar_header.dart';
import 'package:princess_diaries/presentation/components/time_line_list_item.dart';
import 'package:princess_diaries/presentation/time_line/time_line_ui_event.dart';
import 'package:princess_diaries/presentation/time_line/time_line_view_model.dart';
import 'package:provider/provider.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TimeLineViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TimeLineCalendarHeader(
          focusedMonth: viewModel.focusedMonth,
          onMonthChanged: (newMonth) {
            // TODO : 월 변경 이벤트 처리 - DB 데이터 필터링
            viewModel.changeMonth(newMonth); // 월 변경 유지
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO : 공유 기능
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ...state.posts
              .map(
                (post) => InkWell(
                  // TODO : 삭제 후 복구 기능 추가
                  onTap: () async {
                    bool? isSaved =
                        await context.push('/edit_post', extra: post);

                    if (isSaved != null && isSaved) {
                      viewModel.onEvent(
                        const TimeLineUiEvent.loadPosts(),
                      );
                    }
                  },
                  child: TimeLineListItem(post: post),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
