import 'package:flutter/material.dart';

class NoteDetailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _noteDetailController = new TextEditingController();
    return TextField(
      controller: _noteDetailController,
      expands: true,
      decoration: InputDecoration(
          hintText: "Desc..",
          hintStyle: TextStyle(fontWeight: FontWeight.w600),
          border: InputBorder.none,
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          alignLabelWithHint: false),
    );
  }
}
