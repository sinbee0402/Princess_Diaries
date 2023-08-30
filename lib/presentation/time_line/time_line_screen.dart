import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:princess_diaries/presentation/components/time_line_calendar_header.dart';
import 'package:princess_diaries/presentation/components/time_line_list_item.dart';
import 'package:princess_diaries/presentation/time_line/time_line_view_model.dart';
import 'package:provider/provider.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  final DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TimeLineViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TimeLineCalendarHeader(
          focusedMonth: _focusedDay,
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
      body: ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          return TimeLineListItem(post: state.posts[index]);
        },
      ),
    );
  }
}
