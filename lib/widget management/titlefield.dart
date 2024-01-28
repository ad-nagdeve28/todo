import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _titleController = new TextEditingController();
    return TextField(
      controller: _titleController,
      decoration: const InputDecoration(
          hintText: "ToDo Title",
          hintStyle: TextStyle(fontWeight: FontWeight.w600),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          alignLabelWithHint: false),
    );
  }
}
