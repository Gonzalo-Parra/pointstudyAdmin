import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('escuelas');

class Database {
  static String? userUid;

  static Future<void> addEscuela({
    required String Name,
    required String Direction,
    required String Level,
    required String TypeSchool,
    required String History,
    required String Ages,
    required String TitleSchool,
    required String Vocations,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('escuelas').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "Nombre": Name,
      "Direccion": Direction,
      "Level": Level,
      "Type": TypeSchool,
      "Historia": History,
      "Años": Ages,
      "Titulo": TitleSchool,
      "Vocations": Vocations,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("¡La institución fue registrada con exito!"))
        .catchError((e) => print(e));
  }
}
