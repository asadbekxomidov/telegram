import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telegram/services/images_add_servisec.dart';

class ImagesController with ChangeNotifier {
  final _carsFirebaseService = ImagesFirestoreServisec();

  Stream<QuerySnapshot> get list async* {
    yield* _carsFirebaseService.getCars();
  }

  Future<void> addCar(String name, File imageFile) async {
    await _carsFirebaseService.addCar(name, imageFile);
  }
}
