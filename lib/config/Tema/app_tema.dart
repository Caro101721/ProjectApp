import 'package:flutter/material.dart';

const List<Color> _colorThere = [Colors.black, Colors.pink, Colors.cyanAccent];

class AppTema {
  final int selectcolor;
  AppTema({this.selectcolor = 2})
    : assert(
        selectcolor >= 0 && selectcolor <= _colorThere.length - 1,
        'El valor designado no esta en el rango de los colores de la lista debe estar entre 0 y ${_colorThere.length}',
      );
  ThemeData tema() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThere[selectcolor],
    );
  }
}
