import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gas3/homePage/music.dart';

class ChangeMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.file_upload),
          title: Text("Change Music"),
          onTap: () async {
            FilePickerResult result =
                await FilePicker.platform.pickFiles(type: FileType.audio);

            Music.instance.getMusic(result);
          },
        ),
      ),
    );
  }
}
