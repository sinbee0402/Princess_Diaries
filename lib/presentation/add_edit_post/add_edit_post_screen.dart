import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_event.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_view_model.dart';
import 'package:princess_diaries/presentation/components/emoji_popup.dart';
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

  void _showPopup(BuildContext context) async {
    final selectedValue = await showDialog(
      context: context,
      builder: (context) {
        return const EmojiPopup();
      },
    );

    if (selectedValue != null) {
      setState(() {
        _selectedEmoji = selectedValue;
      });
    }
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
          context.pop();
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
