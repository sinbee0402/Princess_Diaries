import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_event.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_ui_event.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_view_model.dart';
import 'package:princess_diaries/presentation/components/emoji_popup.dart';
import 'package:princess_diaries/presentation/settings/theme/setting_theme_top_level.dart';
import 'package:provider/provider.dart';

class AddEditPostScreen extends StatefulWidget {
  final Post? post;

  const AddEditPostScreen({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  State<AddEditPostScreen> createState() => _AddEditPostScreenState();
}

class _AddEditPostScreenState extends State<AddEditPostScreen> {
  String? _selectedEmoji;
  final _contentController = TextEditingController();
  StreamSubscription? _streamSubscription;

  void _showPopup(BuildContext context) async {
    final selectedValue = await showDialog(
      context: context,
      builder: (context) {
        return EmojiPopup(emojiTheme: theme);
      },
    );

    if (selectedValue != null) {
      setState(() {
        _selectedEmoji = selectedValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.post != null) {
      _selectedEmoji = widget.post!.emojiPath;
      _contentController.text = widget.post!.content;
      // TODO : 날짜 추가 (UI도)
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditPostViewModel>();

      _streamSubscription = viewModel.eventStream.listen((event) {
        switch (event) {
          case EditPost():
            context.pop(true);
        }
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditPostViewModel>();

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onEvent(
            AddEditPostEvent.savePost(
              widget.post == null ? null : widget.post!.id,
              _selectedEmoji == null
                  ? 'assets/icon-question-mark.png'
                  : _selectedEmoji!,
              _contentController.text,
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 20, bottom: 32),
        child: Container(
          color: Colors.grey,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 32,
                child: InkWell(
                  onTap: () {
                    _showPopup(context);
                  },
                  child: Image.asset(
                    _selectedEmoji != null
                        ? _selectedEmoji!
                        : 'assets/icon-question-mark.png',
                    fit: BoxFit.fill,
                    width: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 160, left: 28, right: 28, bottom: 32),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        TextField(
                          controller: _contentController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: '오늘의 기분은 어땠나요?',
                            border: InputBorder.none,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
