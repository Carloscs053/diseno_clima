import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:segundo_diseno/providers/tiempo_provider.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView nos permitirá navegar entre páginas
      body: PageView(
        scrollDirection: Axis.vertical, // Navegación vertical
        children: [_pagina1(context), _pagina2()],
      ),
    );
  }

  Widget _pagina1(BuildContext context) {
    return Stack(children: [_colorFondo(), _imagenFondo(), _texto(context)]);
  }

  Widget _pagina2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 0.5),
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Text(
              'Bienvenidos',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 0.5),
    );
  }

  Widget _imagenFondo() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: NetworkImage(
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEju_KuMolf-oKBu7R5A6Mc-j2yi8PfzOC5-LPLW0JUi69ueJhB0ghdWrcEaRsMrSzYmGM57o7cS_blRMBbGFxz5mdcHrjo5yTyYlgLnZMjPhikwUI0MNh0gm_reKFowS2Lf77qUyChgdohm/s1901/taj-mahal-wallpaper.png',
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _texto(BuildContext context) {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50);
    final tiempoProvider = Provider.of<TiempoProvider>(context);
    String tiempoActual =
        tiempoProvider.temp.hourly!.temperature2M!.first.toString() ?? "--";
    String diaActual = obtenerDiaSemana();

    return SafeArea(
      child: Column(
        children: [
          Text('$tiempoActualº', style: estiloTexto),
          Text(diaActual, style: estiloTexto),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white),
        ],
      ),
    );
  }

  String obtenerDiaSemana() {
    DateTime fecha = DateTime.now();

    List<String> dias = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo',
    ];

    return dias[fecha.weekday - 1];
  }
}
