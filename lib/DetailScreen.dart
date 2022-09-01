import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedItem = '';
  late File pickedImage;
  var imageFile;
  bool isIMageLoaded = false;
  getImageFromGallery() async {
    var tempStore = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState((){
      pickedImage = File(tempStore!.path);
      isIMageLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedItem = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem),
        actions: [
          ElevatedButton(
              onPressed: getImageFromGallery,
              child: const Icon(
                  Icons.add_a_photo_rounded,color: Colors.white,)
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100),
          isIMageLoaded ? Center(
            child: Container(
              height: 250.0,
              width: 250.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(pickedImage),
                  fit: BoxFit.cover
                )
              ),
            ),
          ) : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.check),
      ),
    );
  }
}
