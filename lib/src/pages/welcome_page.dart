import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gymobile/src/utils/standard_widgets.dart';

import 'package:gymobile/src/widgets/Content/welcome_widget.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class WelcomePage extends StatefulWidget {

  static const String ROUTE = "welcome";
  
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _imageSelected = false;

  late File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        elevation: 40,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.purple, Colors.orange]
            )
          ),
        ),
        title: Text("Perfil"),
      ),
      body: 
      SingleChildScrollView(
        
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Standard.getBackground(context),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        //_showImage(),
                        Container(
                          width: 325.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Tooltip(
                                message: "Tomar foto",
                                child: ElevatedButton(
                                  onPressed:_takeImage,
                                  child: Icon(Icons.camera_alt),
                                  style: Standard.buttonStandardStyle(context),
                                ),
                              ),
                              Tooltip(
                                message: "Buscar foto",
                                child: ElevatedButton(
                                  onPressed: _pickImage,
                                  child: Icon(Icons.image),
                                  style: Standard.buttonStandardStyle(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 14.0), child: WelcomeWidget())
                  ],
                ),
              )
            ],
          ),
        ));
  }

  // ignore: unused_element
  _showImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).canvasColor),
      child: ClipOval(
          child: _imageSelected == false
              ? Image.asset("assets/images/user.png")
              : Image.file(_image)),
    );
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  _pickImage() {
    _selectImage(ImageSource.gallery);
  }

  Future _selectImage(ImageSource source) async {
    var _picker;
    final pickedFile = await _picker.getImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
    } else {
      print('No image selected.');
      _imageSelected = false;
    }
    setState(() {});
  }
}