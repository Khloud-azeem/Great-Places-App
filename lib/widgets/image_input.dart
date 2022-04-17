import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  Function selectImage;
  ImageInput({Key? key, required this.selectImage}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    final File imageFile = File(image!.path);
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/${fileName}');
    widget.selectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: height * 0.3,
          width: width * 0.5,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage as File,
                  fit: BoxFit.cover,
                )
              : Text(
                  "No image taken yet...",
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('Take a Picture'),
          ),
        ),
      ],
    );
  }
}
