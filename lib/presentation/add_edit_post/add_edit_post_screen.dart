import 'package:flutter/material.dart';
import 'package:princess_diaries/domain/model/post.dart';

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
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('${widget.post!.date}'),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            children: [
              // Positioned(
              //   child: Image.network(
              //     widget.post!.emoji,
              //     fit: BoxFit.cover,
              //   ),
              // ),
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
