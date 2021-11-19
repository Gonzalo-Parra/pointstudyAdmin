import 'package:flutter/material.dart';
import 'package:pointstudy_admin/UI/Pages/RegisterSchoolPage.dart';
import 'package:pointstudy_admin/UI/Pages/UpdateSchoolPage.dart';
import 'package:pointstudy_admin/UI/Pages/deleteSchoolPage.dart';
import 'package:pointstudy_admin/Widgets/Logotipo.dart';
import 'package:pointstudy_admin/Widgets/pie_de_pagina.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff642DD5),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          children: [
            SizedBox(
              height: 80.0,
            ),
            Logotipo(),
            SizedBox(
              height: 80.0,
            ),
            addSchoolButton(context),
            SizedBox(
              height: 25.0,
            ),
            updateSchoolButton(context),
            SizedBox(
              height: 25.0,
            ),
            deleteSchoolButton(context),
            SizedBox(
              height: 200.0,
            ),
            pie_de_pagina(),
          ],
        ),
      ),
    );
  }

  Widget addSchoolButton(context) {
    return buttonGeneral(
      text: 'Agregar institución',
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => RegisterSchoolPage());
        Navigator.push(context, route);
      },
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }

  Widget updateSchoolButton(context) {
    return buttonGeneral(
      text: 'Modificar institución',
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => UpdateSchoolPage());
        Navigator.push(context, route);
      },
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }

  Widget deleteSchoolButton(context) {
    return buttonGeneral(
      text: 'Eliminar institución',
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => DeleteSchoolPage());
        Navigator.push(context, route);
      },
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }
}

class textFieldGeneral extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final validator;
  final onSaved;
  final bool obcureText;
  final TextInputType keyboarType;
  final maxLines;

  const textFieldGeneral({
    @required this.labelText = '',
    required this.controller,
    @required this.validator,
    @required this.onSaved,
    this.obcureText = false,
    this.keyboarType = TextInputType.text,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboarType,
      obscureText: obcureText,
      cursorColor: Color(0xff0DDF9F),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xffffffff),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffffffff),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Color(0xff0DDF9F),
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Color(0xff0DDF9F),
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      style: TextStyle(
        color: Color(0xffffffff),
        fontSize: 15.0,
      ),
    );
  }
}

class buttonGeneral extends StatelessWidget {
  final String text;
  final onPressed;
  final BGcolor;
  final borderColor;
  final fontColor;
  final FontWeight fontGrosor;
  const buttonGeneral({
    @required this.text = '',
    @required this.onPressed = '',
    required this.BGcolor,
    this.borderColor,
    this.fontColor = (0xffffffff),
    this.fontGrosor = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Color(fontColor),
          fontWeight: fontGrosor,
        ),
      ),
      style: TextButton.styleFrom(
        fixedSize: Size(200.0, 40.0),
        backgroundColor: Color(BGcolor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(
            color: Color(borderColor),
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
