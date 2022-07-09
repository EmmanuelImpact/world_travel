import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class InputImageRow extends StatefulWidget {
  const InputImageRow({Key? key}) : super(key: key);

  @override
  State<InputImageRow> createState() => _InputImageRowState();
}

class _InputImageRowState extends State<InputImageRow> {
  late File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final _imageTaken = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = _imageTaken;
    });
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
          // ignore: unnecessary_null_comparison
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'Take a picture',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
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
