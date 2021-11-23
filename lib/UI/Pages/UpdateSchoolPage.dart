import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pointstudy_admin/Widgets/Logotipo.dart';
import 'package:pointstudy_admin/Widgets/pie_de_pagina.dart';
import 'HomePage.dart';

class UpdateSchoolPage extends StatefulWidget {
  static String id = 'UpdateSchoolPage';

  @override
  State<UpdateSchoolPage> createState() => _UpdateSchoolPageState();
}

class _UpdateSchoolPageState extends State<UpdateSchoolPage> {
  String valueNE = 'PRIMARIO';
  List nivSchool = ['PRIMARIO', 'SECUNDARIO', 'TERCEARIO', 'ESPECIALES'];
  String valueTS = 'PUBLICA';
  List tipEscuela = ['PUBLICA', 'PRIVADA'];
  TextEditingController Name = TextEditingController();
  TextEditingController Direction = TextEditingController();
  TextEditingController History = TextEditingController();
  TextEditingController Ages = TextEditingController();
  TextEditingController Title = TextEditingController();
  TextEditingController Vocations = TextEditingController();

  final _firebase = FirebaseFirestore.instance;

  updateSchool() async {
    try {
      await _firebase.collection('escuelas').doc(Name.text).update({
        'name': Name.text,
        'direction': Direction.text,
        'levelSchool': valueNE,
        'typeSchool': valueTS,
        'history': History.text,
        'ages': Ages.text,
        'title': Title.text,
        'vocationsFollow': Vocations.text,
      });
      Fluttertoast.showToast(msg: "Cambios guardados con exito");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff642DD5),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 50.0,
              ),
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Modificar Institución',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                textFieldName(),
                SizedBox(
                  height: 20.0,
                ),
                textFieldDirection(),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 40.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: nivEschoolButton(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 40.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: typeEschoolButton(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                textFieldHistory(),
                SizedBox(
                  height: 20.0,
                ),
                textFielAges(),
                SizedBox(
                  height: 20.0,
                ),
                textFieldTitle(),
                SizedBox(
                  height: 20.0,
                ),
                textFieldVocationFollow(),
                SizedBox(
                  height: 35.0,
                ),
                buttonRegister(),
                SizedBox(
                  height: 35.0,
                ),
                pie_de_pagina(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldName() {
    return textFieldGeneral(
      labelText: 'Nombre de la institución',
      controller: Name,
      keyboarType: TextInputType.name,
    );
  }

  Widget textFieldDirection() {
    return textFieldGeneral(
      labelText: 'Dirección de la institución',
      controller: Direction,
      keyboarType: TextInputType.name,
    );
  }

  Widget nivEschoolButton() {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text(
        "Nivel escolar",
        style: TextStyle(
          color: Color(0xff716D6D),
        ),
      ),
      onChanged: (newValue) {
        setState(() {
          valueNE = newValue!;
        });
      },
      value: valueNE,
      items: nivSchool.map(
        (value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      underline: Container(),
    );
  }

  Widget typeEschoolButton() {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text(
        "Tipo institución",
        style: TextStyle(
          color: Color(0xff716D6D),
        ),
      ),
      onChanged: (newValue) {
        setState(() {
          valueTS = newValue!;
        });
      },
      value: valueTS,
      items: tipEscuela.map(
        (value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      underline: Container(),
    );
  }

  Widget textFieldHistory() {
    return textFieldGeneral(
      labelText: 'Breve historia sobre la institución',
      controller: History,
      maxLenght: 250,
      keyboarType: TextInputType.name,
    );
  }

  Widget textFielAges() {
    return textFieldGeneral(
      labelText: 'Duración cursada',
      controller: Ages,
      keyboarType: TextInputType.name,
    );
  }

  Widget textFieldTitle() {
    return textFieldGeneral(
      labelText: 'Título otorgado',
      controller: Title,
      keyboarType: TextInputType.name,
    );
  }

  Widget textFieldVocationFollow() {
    return textFieldGeneral(
      labelText: 'Vocaciones a seguir',
      controller: Vocations,
      keyboarType: TextInputType.name,
    );
  }

  Widget buttonRegister() {
    return buttonGeneral(
      text: 'Modificar institución',
      onPressed: () {
        updateSchool();
        Name.clear();
        Direction.clear();
        valueNE = 'PRIMARIO';
        valueTS = 'PUBLICA';
        History.clear();
        Ages.clear();
        Title.clear();
        Vocations.clear();
      },
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }
}
