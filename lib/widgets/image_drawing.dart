import 'dart:io';

import 'package:cartesian/widgets/back_press.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ImageDrawing extends StatefulWidget {
  const ImageDrawing({super.key});

  @override
  State<ImageDrawing> createState() => _ImageDrawingState();
}

class _ImageDrawingState extends State<ImageDrawing> {
  String? outputFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 500,
            height: 300,
            child: outputFile != null
                ? Image.file(File(outputFile!))
                : Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 220,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                  ),
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(allowMultiple: false);

                    setState(() {
                      outputFile = result!.paths[0]!;
                    });

                    print(outputFile);

                    // saveFile(
                    // dialogTitle: 'Please select file',
                    // );

                    if (outputFile == null) {
                      // User canceled the picker
                      print("outfile is null");
                    } else {
                      http.Response response = await http.post(
                        Uri.parse('http://127.0.0.1:5000/generateGcode'),
                        body: {
                          "imagePath": outputFile,
                        },
                      );
                      print(response.body);
                    }
                  },
                  child: const Text('Generate GCode'),
                ),
              ),
              SizedBox(
                width: 220,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                  ),
                  onPressed: () async {
                    print('Button pressed');

                    http.Response homing = await http.post(
                      Uri.parse('http://127.0.0.1:5000/homing'),
                    );

                    print(homing.body);

                    http.Response response = await http.post(
                      Uri.parse('http://127.0.0.1:5000/drawImage'),
                    );
                    print(response.body);
                  },
                  child: const Text('Draw Image'),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
