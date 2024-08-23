import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class TestDrag extends StatefulWidget {
  const TestDrag({super.key});

  @override
  State<TestDrag> createState() => _TestDragState();
}

class _TestDragState extends State<TestDrag> {
  String? _imagePath;
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // แสดงภาพที่ลากและวาง
          DragTarget<File>(
            onAcceptWithDetails: (details) {
              setState(() {
                _imageFile = details.data;
                _imagePath = _imageFile?.path;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 300,
                height: 300,
                color: Colors.grey[200],
                child: Center(
                  child: _imageFile != null
                      ? Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        )
                      : const Text(
                          'Drag image here or tap to select',
                          textAlign: TextAlign.center,
                        ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          // ปุ่มเพื่อเลือกไฟล์
          ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              if (result != null && result.files.single.path != null) {
                setState(() {
                  _imagePath = result.files.single.path;
                  _imageFile = File(_imagePath!);
                });
              }
            },
            child: Text('Select Image'),
          ),
        ],
      ),
    );
  }
}
