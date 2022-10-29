import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class Controller extends ChangeNotifier {
  var json;
  var loading = true;

  fetchData() async {
    var url = Uri.parse(
        "https://resultados.tse.jus.br/oficial/ele2022/545/dados-simplificados/br/br-c0001-e000545-r.json");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      loading = false;
      notifyListeners();
    }
  }
}
