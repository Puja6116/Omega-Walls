import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../data/Model/firebase_model.dart';

class SuperheroWallsController extends GetxController {
  //TODO: Implement SuperheroWallsController
  final fshKey = GlobalKey<ScaffoldState>();
  late Future<List<FirebaseModel>> futureFiles;
  RxMap downloadProgress = RxMap<int, double>({});

  @override
  void onInit() {
    super.onInit();
    futureFiles = listAll('superheros');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<List<FirebaseModel>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await getDownloadUrl(result.items);
    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseModel(ref: ref, url: url, name: name);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  Future<List<String>> getDownloadUrl(List<Reference> ref) =>
      Future.wait(ref.map((e) => e.getDownloadURL()).toList());

  downloadPhoto(Reference ref, int index) async {
    final ref1 = await ref.getDownloadURL();
    final getDir = await getApplicationDocumentsDirectory();
    final saveFile = '${getDir.path}/${ref.name}';
    try {
      await Dio().download(ref1, saveFile, onReceiveProgress: (count, total) {
        RxDouble progress = RxDouble(0.0);
        progress.value = (count / total) * 100;

        downloadProgress[index] = progress.value;
      }).whenComplete(() => Timer(const Duration(seconds: 10), () {
            downloadProgress[index] = 0.0;
          }));
    } on Exception catch (e) {
      print(e);
    }
    if (ref.name.contains('.jpg') || ref.name.contains('.png')) {
      GallerySaver.saveImage(saveFile).whenComplete(() {
        Get.snackbar(ref.name, "Downloaded Successfully",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.black,
            isDismissible: true);

        // WelcomeController.showNotifications(
        //     id: index, title: ref.name, body: "By Omega Walls");
      });
    }
  }
}
