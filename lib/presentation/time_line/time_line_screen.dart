import 'package:flutter/material.dart';
import 'package:princess_diaries/presentation/components/time_line_list_item.dart';
import 'package:princess_diaries/presentation/time_line/time_line_view_model.dart';
import 'package:provider/provider.dart';

class TimeLineScreen extends StatelessWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TimeLineViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
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
