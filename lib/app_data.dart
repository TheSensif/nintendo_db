import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppData with ChangeNotifier {
  bool readyConsoles = false;
  bool readyJocs = false;
  bool readyPersonatges = false;
  late dynamic dataConsoles;
  late dynamic dataJocs;
  late dynamic dataPersonatges;

  bool dataReady(String type) {
    switch (type) {
      case 'Consoles':
        return readyConsoles;
      case 'Jocs':
        return readyJocs;
      case 'Personatges':
        return readyPersonatges;
    }

    return false;
  }

  dynamic getData(String type) {
    switch (type) {
      case 'Consoles':
        return dataConsoles;
      case 'Jocs':
        return dataJocs;
      case 'Personatges':
        return dataPersonatges;
    }
    return;
  }

  void load(String type) async {
    var arxiu = "";
    switch (type) {
      case 'Consoles':
        arxiu = "assets/data/consoles.json";
        break;
      case 'Jocs':
        arxiu = "assets/data/jocs.json";
        break;
      case 'Personatges':
        arxiu = "assets/data/personatges.json";
        break;
    }

    await Future.delayed(const Duration(seconds: 1));

    var textArxiu = await rootBundle.loadString(arxiu);
    var dadesArxiu = json.decode(textArxiu);

    switch (type) {
      case 'Consoles':
        readyConsoles = true;
        dataConsoles = dadesArxiu;
        break;
      case 'Jocs':
        readyJocs = true;
        dataJocs = dadesArxiu;
        break;
      case 'Personatges':
        readyPersonatges = true;
        dataPersonatges = dadesArxiu;
        break;
    }

    notifyListeners();
  }

  dynamic getItemData(String type, int index) {
    if (dataReady(type)) {
      return getData(type)[index];
    }
    return;
  }
}
