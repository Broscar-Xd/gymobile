import 'package:flutter/material.dart';
import 'package:gymobile/src/models/measures_model.dart';
import 'package:gymobile/src/providers/measure_provider.dart';
import 'package:gymobile/src/utils/standard_widgets.dart';
import 'package:provider/provider.dart';


class MeasuresForm extends StatefulWidget {
  MeasuresForm({Key? key}) : super(key: key);

  @override
  _MeasuresFormState createState() => _MeasuresFormState();
}

class _MeasuresFormState extends State<MeasuresForm> {
//Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  //Un objeto del modelo a enviar
  late Measures _element;
  bool _onSaving = false;
  List<String> _typesElement = ['Activo', 'Inactivo'];
  String _typeValue = "";

  @override
  void initState() {
    super.initState();
    _typeValue = _typesElement.elementAt(0);
    _element = Measures.create("","","","","","");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Theme.of(context).dividerColor)),
            child: Form(
                key: formKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 32.0, horizontal: 14.0),
                  child: Column(
                    children: [_inputWeight(), _inputChest(), _inputArm(), _inputShoulders(), _inputLeg(), _inputCalf(), _buttons()],
                  ),
                )),
          )
        ],
      ),
    );
  }

  _inputWeight() {
    return TextFormField(
        initialValue: _element.weight,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.weight = value.toString();
        },
        validator: (value) {
          if (value!.length < 2) {
            return "Debe ingresar al menos 2";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Peso"),
        maxLength: 255,
        maxLines: 2);
  }

  _inputChest() {
    return TextFormField(
        initialValue: _element.chest,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.chest = value.toString();
        },
        validator: (value) {
          if (value!.length < 2) {
            return "Debe ingresar al menos 2";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Pecho"),
        maxLength: 255,
        maxLines: 2);
  }

  _inputArm() {
    return TextFormField(
        initialValue: _element.arm,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.arm = value.toString();
        },
        validator: (value) {
          if (value!.length < 2) {
            return "Debe ingresar al menos 2";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Brazo"),
        maxLength: 255,
        maxLines: 2);
  }

  _inputShoulders() {
    return TextFormField(
        initialValue: _element.shoulders,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.shoulders = value.toString();
        },
        validator: (value) {
          if (value!.length < 2) {
            return "Debe ingresar al menos 2";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Hombros"),
        maxLength: 255,
        maxLines: 2);
  }

  _inputLeg() {
    return TextFormField(
        initialValue: _element.leg,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.leg = value.toString();
        },
        validator: (value) {
          if (value!.length < 2) {
            return "Debe ingresar al menos 2";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Pierna"),
        maxLength: 255,
        maxLines: 2);
  }

  _inputCalf() {
    return TextFormField(
        initialValue: _element.calf,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.calf = value.toString();
        },
        validator: (value) {
          if (value!.length < 2) {
            return "Debe ingresar al menos 2";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Pantorrilla"),
        maxLength: 255,
        maxLines: 2);
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
              },
              child: Icon(Icons.save),
              style: Standard.buttonStandardStyle(context),
            ),
          );
  }

  _sendForm() {
    if (!formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});

    formKey.currentState!.save();

    final fisioProvider =
        Provider.of<MeasureProvider>(context, listen: false);
    fisioProvider.addElement(_element.weight, _element.chest, _element.arm, _element.shoulders, _element.leg, _element.calf).then((value) {
      _element = value;
      formKey.currentState!.reset();
      _onSaving = false;
      setState(() {});
    });
  }
}