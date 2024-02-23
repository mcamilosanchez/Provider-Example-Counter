/* Este provider administrará el estado de nuestro contador */
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  /* Al momento de emplear Provider, debemos trabajar con dos funciones: Leer y 
  Modificar el estado. Entonces, debemos crear dos métodos para manejar dichas 
  funciones */

  /* Método 1: Read or Watch
  Creamos un método get llamado counter que simplemente va a regresar el valor 
  de _counter */
  int get counter => _counter;

  /* Luego, necesitamos un método para poder setearlo */
  void increment() {
    _counter++;
    /* notifyListeners son aquellos widgets que están escuchando nuestro get. Es
    decir, dichos widgets serán notificados de que el estado cambió. */
    notifyListeners();
  }
}
