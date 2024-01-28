import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class NotePad extends StatefulWidget {
  @override
  _NotePadState createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  bool _switchValue = false;

  String? filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.transparent,
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 8,
        ),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10,
            bottom: 26,
            right: 16.0,
            left: 16.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                  labelText: 'ToDo Title',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                  border: InputBorder.none),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: MediaQuery.of(context).size.height / 3.0,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(2.0),
              // decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(8.0),
              //     border: Border.all(color: Colors.grey, width: 0.8)),
              child: TextField(
                maxLines: null,
                cursorColor: Colors.grey.shade300,
                decoration: const InputDecoration(
                    labelText: 'What you want to do!',
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 5.0),
            const Divider(
              color: Colors.grey,
              indent: 16.0,
              endIndent: 16.0,
            ),
            IconButton(
                onPressed: _pickFile,
                icon: const Icon(
                  Icons.attachment,
                  color: Colors.grey,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notify ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hi Voice..",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * .20,
                        padding: const EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(16.0),
                          // image: const DecorationImage(
                          //     image: AssetImage('./icons/save.png'),
                          //     scale: 2.5)
                        ),
                        child: const Text(
                          "save",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              shadows: [BoxShadow(color: Colors.black45)]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
