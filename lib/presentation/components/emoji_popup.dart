import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmojiPopup extends StatefulWidget {
  final String emojiTheme;

  const EmojiPopup({
    Key? key,
    required this.emojiTheme,
  }) : super(key: key);

  @override
  State<EmojiPopup> createState() => _EmojiPopupState();
}

class _EmojiPopupState extends State<EmojiPopup> {
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
                  context.pop('assets/icon-question-mark.png');
                },
                child: Image.asset(
                  'assets/icon-question-mark.png',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('${widget.emojiTheme}/1.png');
                },
                child: Image.asset(
                  '${widget.emojiTheme}/1.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('${widget.emojiTheme}/2.png');
                },
                child: Image.asset(
                  '${widget.emojiTheme}/2.png',
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
                  context.pop('${widget.emojiTheme}/3.png');
                },
                child: Image.asset(
                  '${widget.emojiTheme}/3.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('${widget.emojiTheme}/4.png');
                },
                child: Image.asset(
                  '${widget.emojiTheme}/4.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop('${widget.emojiTheme}/5.png');
                },
                child: Image.asset(
                  '${widget.emojiTheme}/5.png',
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
