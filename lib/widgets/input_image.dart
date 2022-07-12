import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class InputImageRow extends StatefulWidget {
  const InputImageRow({Key? key}) : super(key: key);

  @override
  State<InputImageRow> createState() => _InputImageRowState();
}

class _InputImageRowState extends State<InputImageRow> {
  File? _storedImage;

  Future _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final imageTaken = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imageTaken != null) {
      setState(() {
        _storedImage = File(imageTaken.path);
      });
    } else {
      print('no image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          // ignore: unnecessary_null_comparison
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'Take a picture',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(width: 40),
        // ignore: deprecated_member_use
        FlatButton.icon(
          icon: const Icon(Icons.camera_alt),
          onPressed: _takePicture,
          label: const Text('Camera'),
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
