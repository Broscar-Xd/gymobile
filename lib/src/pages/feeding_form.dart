import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gymobile/src/models/feeding_model.dart';
import 'package:gymobile/src/services/feeding_service.dart';
import 'package:gymobile/src/utils/standard_widgets.dart';
import 'package:image_picker/image_picker.dart';


class FeedingForm extends StatefulWidget {
  static const String ROUTE = "feedingForm";
  FeedingForm({Key? key}) : super(key: key);

  @override
  _FeedingFormState createState() => _FeedingFormState();
}

class _FeedingFormState extends State<FeedingForm> {
  final formKey = GlobalKey<FormState>();
  FeedingService _serviceFeeding = new FeedingService();
  //Un objeto del modelo a enviar
  late Feeding _feeding;
  bool _onSaving = false;
  late File _image;
  bool _imageSelected = false;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _feeding = Feeding.create( "" , "" , "", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Nueva comida'),
        elevation: 40,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.purple, Colors.orange]
            )
          ),
        ),
      ),
        body: SingleChildScrollView(
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
                        _showImage(),
                        Container(
                          width: 325.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Tooltip(
                                message: "Tomar foto",
                                child: ElevatedButton(
                                  onPressed: _takeImage,
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
                    Standard.titleToForm(context, "Registro de comida"),
                    _form()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      width: size.width * .85,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
            child: Column(
              children: [
                _inputFood(),
                _inputIngredients(),
                _inputPreparation(),
                _inputCalories(),
                _buttons()
              ],
            ),
          )),
    ));
  }

  _inputFood() {
    return TextFormField(
        initialValue: _feeding.food,
        onSaved: (value) {
          _feeding.food = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un nombre con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Comida"),
        maxLength: 35);
  }

  _inputIngredients() {
    return TextFormField(
        initialValue: _feeding.ingredients,
        onSaved: (value) {
          _feeding.ingredients = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar por lo menos 3 ingredientes";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Ingredientes"),
        maxLength: 200);
  }

  _inputPreparation() {
    return TextFormField(
        initialValue: _feeding.preparation,
        onSaved: (value) {
          _feeding.preparation = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar por lo menos 20 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Preparación"),
        maxLength: 200);
  }

  _inputCalories() {
    return TextFormField(
        initialValue: _feeding.calories,
        onSaved: (value) {
          _feeding.calories = value.toString();
        },
        validator: (value) {
          if (value!.length < 1) {
            return "Debe ingresar por lo menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Calorias"),
        maxLength: 10);
  }

  _buttons() {
    return _onSaving
        ? Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: CircularProgressIndicator()))
        : Tooltip(
            message: "Guardar",
            child: ElevatedButton(
              onPressed: () {
                _sendForm();
                _onSaving = true;
                setState(() {});
              },
              child: Icon(Icons.save),
              style: Standard.buttonStandardStyle(context),
            ),
          );
  }

  _sendForm() async {
    if (!formKey.currentState!.validate()) return;
 _onSaving = true;
    setState(() {});

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();

    if (_imageSelected) {
      _feeding.photo = await _serviceFeeding.uploadImage(_image);
    }
    //Llamamos al servicio para guardar el reporte
    _serviceFeeding.sendFeeding(_feeding).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }

 _showImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).canvasColor),
      child: ClipOval(
          child: _imageSelected == false
              ? Image.asset("assets/images/add.png")
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
    final pickedFile = await _picker.pickImage(source: source);
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

