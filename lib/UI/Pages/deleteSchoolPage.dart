import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pointstudy_admin/Widgets/Logotipo.dart';
import 'package:pointstudy_admin/Widgets/pie_de_pagina.dart';
import 'HomePage.dart';

class DeleteSchoolPage extends StatefulWidget {
  static String id = 'DeleteSchoolPage';

  @override
  State<DeleteSchoolPage> createState() => _DeleteSchoolPageState();
}

class _DeleteSchoolPageState extends State<DeleteSchoolPage> {
  TextEditingController Name = TextEditingController();

  final _firebase = FirebaseFirestore.instance;

  deleteSchool() async {
    try {
      await _firebase.collection('escuelas').doc(Name.text).delete();
      Fluttertoast.showToast(msg: "Se ha elimina la institución con exito");
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
                  'Eliminar   Institución',
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
                buttonDelete(),
                SizedBox(
                  height: 385.0,
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

  Widget buttonDelete() {
    return buttonGeneral(
      text: 'Eliminar institución',
      onPressed: () {
        deleteSchool();
        Name.clear();
      },
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }
}
