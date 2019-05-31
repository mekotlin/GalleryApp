import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyGallery());

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  File _image;
  bool isCamera;

  Future _commonIMage(isCamera) async {
    File _newImage;

    // Common code for Gallery and Camera

    // if (isCamera) {
    //   _newImage = await ImagePicker.pickImage(source: ImageSource.camera);
    // } else {
    //   _newImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    // }
    // setState(() {
    //   _image = _newImage;
    // });
  }

  Future _captureImage() async {
    File _caturedImage;
    _caturedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = _caturedImage;
    });
  }

  Future _loadFromGallery() async {
    File _galleryImage;
    _galleryImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = _galleryImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gallery App"),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          onPressed: () => _captureImage(),
                          color: Colors.blue[400],
                          child: Text(
                            "CAMERA",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          onPressed: () => _loadFromGallery(),
                          color: Colors.blue[400],
                          child: Text(
                            "GALLERY",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _image == null
                      ? Container()
                      : Image.file(
                          _image,
                          height: 400,
                          width: 300,
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
