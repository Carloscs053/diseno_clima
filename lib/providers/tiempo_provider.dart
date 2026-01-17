import 'package:flutter/material.dart';
import 'package:segundo_diseno/models/tiempo_response.dart';
import 'package:segundo_diseno/services/tiempo_service.dart';

class TiempoProvider with ChangeNotifier {
  TemperaturaResponse temp = TemperaturaResponse();
  TiempoService tiempoService = TiempoService();

  TiempoProvider() {
    getTiempo();
  }

  Future getTiempo() async {
    temp = await tiempoService.getTiempo();
    await Future.delayed(const Duration(seconds: 2));

    print('Ya hay temperatura');

    notifyListeners();
  }
}
