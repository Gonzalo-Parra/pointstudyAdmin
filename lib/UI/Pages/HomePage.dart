import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueNE = 'PRIMARIO';
  List nivEscolar = ['PRIMARIO', 'SECUNDARIO', 'TERCEARIO', 'ESPECIALES'];
  String valueTS = 'PUBLICA';
  List tipEscuela = ['PUBLICA', 'PRIVADA'];
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
                  height: 80.0,
                ),
                Logotipo(),
                SizedBox(
                  height: 80.0,
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
                piePagina(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Logotipo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'POINT STUDY',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Admin',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 25.0,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget textFieldName() {
    return textFieldGeneral(
      labelText: 'Nombre de la institución',
      onChanged: (value) {},
    );
  }

  Widget textFieldDirection() {
    return textFieldGeneral(
      labelText: 'Dirección de la institución',
      onChanged: (value) {},
    );
  }

  Widget textFieldHistory() {
    return textFieldGeneral(
      labelText: 'Breve historia sobre la institución',
      onChanged: (value) {},
    );
  }

  Widget textFieldTitle() {
    return textFieldGeneral(
      labelText: 'Título otorgado',
      onChanged: (value) {},
    );
  }

  Widget textFieldVocationFollow() {
    return textFieldGeneral(
      labelText: 'Vocaciones a seguir',
      onChanged: (value) {},
    );
  }

  Widget buttonRegister() {
    return buttonGeneral(
      text: 'Registrar escuela',
      onPressed: () {},
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
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
      items: nivEscolar.map(
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

  Widget piePagina() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Copyright © Gonzalo Parra',
        style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 12.0,
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class textFieldGeneral extends StatelessWidget {
  final String labelText;
  final onChanged;
  final bool obcureText;
  final TextInputType keyboarType;
  const textFieldGeneral({
    @required this.labelText = '',
    @required this.onChanged = '',
    this.obcureText = false,
    this.keyboarType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0),
      height: 40.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff0DDF9F),
          width: 3.0,
        ),
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextField(
        cursorColor: Color(0xff0DDF9F),
        keyboardType: keyboarType,
        onChanged: onChanged,
        obscureText: obcureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color(0xff716D6D),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Color(0xffffffff),
              width: 3.0,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Color(0xffffffff),
              width: 3.0,
              style: BorderStyle.solid,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Color(0xffffffff),
              width: 5.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        style: TextStyle(
          color: Color(0xff716D6D),
          fontSize: 15.0,
        ),
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
    this.BGcolor,
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
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
