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
      backgroundColor: Colors.white,
      title: const Column(
        children: [
          Text(
            '오늘 하루는 어땠나요?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFED0F69),
            ),
          ),
          SizedBox(height: 16)
        ],
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
                      context.pop('${widget.emojiTheme}/1.png');
                    },
                    child: Image.asset(
                      '${widget.emojiTheme}/1.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      context.pop('${widget.emojiTheme}/2.png');
                    },
                    child: Image.asset(
                      '${widget.emojiTheme}/2.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      context.pop('${widget.emojiTheme}/3.png');
                    },
                    child: Image.asset(
                      '${widget.emojiTheme}/3.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.pop('${widget.emojiTheme}/4.png');
                    },
                    child: Image.asset(
                      '${widget.emojiTheme}/4.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      context.pop('${widget.emojiTheme}/5.png');
                    },
                    child: Image.asset(
                      '${widget.emojiTheme}/5.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      context.pop('${widget.emojiTheme}/6.png');
                    },
                    child: Image.asset(
                      '${widget.emojiTheme}/6.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.pop('assets/icon-question-mark.png');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7B7D3),
                ),
                child: const Text(
                  '선택하지 않을래요',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
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
