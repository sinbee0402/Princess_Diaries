import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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

  late Post _post;

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
        _post = _post.copyWith(
          emojiPath: selectedValue,
        );
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
      _post = widget.post!;
    } else {
      _post = Post(
        emojiPath: 'assets/icon-question-mark.png',
        content: '',
        postingTime: DateTime.now(),
        updateTime: DateTime.now(),
      );
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
      backgroundColor: const Color(0xFFF7B7D3),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 28),
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 21,
                child: Text(
                  DateFormat('yyyy. MM. dd').format(_post!.postingTime),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 16,
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(48, 28),
                    side: const BorderSide(
                      color: Color(0xFFF7B7D3),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    '취소',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 16,
                child: TextButton(
                  onPressed: () {
                    viewModel.onEvent(
                      AddEditPostEvent.savePost(_post),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(48, 28),
                    side: const BorderSide(
                      color: Color(0xFFF7B7D3),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: 72,
                child: InkWell(
                  onTap: () {
                    _showPopup(context);
                  },
                  child: Image.asset(
                    _selectedEmoji != null
                        ? _selectedEmoji!
                        : 'assets/icon-question-mark.png',
                    fit: BoxFit.fill,
                    width: 90,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 200, left: 16, right: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFF7B7D3),
                      width: 2.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        TextField(
                          onChanged: (text) {
                            _post = _post.copyWith(
                              content: text,
                            );
                          },
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
