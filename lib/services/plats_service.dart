import 'dart:convert';

import 'package:examen_final_garcias/models/plats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlatsService extends ChangeNotifier {
  final String _baseUrl = 'cac4a8048c06439a73b2.free.beeceptor.com';
  final List<Plats> plats = [];

  bool isLoading = true;

  PlatsService() {
    loadPlats();
  }

  Future loadPlats() async {
    final url = Uri.https(_baseUrl, 'api/plats');
    final resp = await http.get(url);

    final Map<String, dynamic>? platsMap = json.decode(resp.body);
    if (platsMap == null) return;

    plats.clear();

    platsMap.forEach((key, value) {
       print('key: $key → value: $value (${value.runtimeType})');
      final plat = Plats.fromMap(value);
      plats.add(plat);
    });

    isLoading = false;
    notifyListeners();
  }
}