import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cImageKey = 'drawer_image';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget imageOrEmpty = const SizedBox();
  Widget imageDisplay(String path) => Image.file(
        File(path),
        fit: BoxFit.fitWidth,
      );

  @override
  Widget build(BuildContext context) {
    _getCachedPicture();

    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                    width: double.maxFinite, height: 200, child: imageOrEmpty),
                Positioned(
                  right: 8,
                  bottom: 4,
                  child: IconButton(
                    color: Colors.grey.shade500.withAlpha(200),
                    onPressed: _getPictureFromGallery,
                    icon: const Icon(Icons.image),
                    iconSize: 26,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _getCachedPicture() async {
    var prefs = await SharedPreferences.getInstance();
    String? cachedPic = prefs.getString(cImageKey);
    if (cachedPic != null) {
      setState(() {
        imageOrEmpty = imageDisplay(cachedPic);
      });
    }
  }

  void _getPictureFromGallery() async {
    XFile? pickedFile;
    try {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (e) {
      throw 'Image pickup failed';
    }

    if (pickedFile != null) {
      setState(() {
        imageOrEmpty = imageDisplay(pickedFile!.path);
      });

      _cachePicture(pickedFile.path);
    }
  }

  void _cachePicture(String path) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString(cImageKey, path);
  }
}
