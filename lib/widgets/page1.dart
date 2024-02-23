import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() {
    return _Page1();
  }
}

class _Page1 extends State<Page1> {
  /* It´s important to understand that _count is our STATE, and _Page1 is the 
  manager.
  Ya que creamos nuestro Provider, no hay necesidad de llamar la siguiente 
  variable (Recordar que ésta variable era nuestro estado en Page1): */
  //int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* Ahora, vamos a llamar nuestro Provider, con watch estaríamos 
          escuchando counter del getter de CounterProvider(). <CounterProvider> 
          especifica explícitamente el tipo del proveedor que estás observando. 
          Esto es útil cuando tienes múltiples proveedores en tu aplicación y 
          quieres asegurarte de que estás observando el proveedor correcto. 
          Esto también proporciona verificación estática de tipos por parte del 
          compilador.
          Recordar que watch nos permite estar pednientes del valor del estado */
          Text(
            context.watch<CounterProvider>().counter.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          ElevatedButton(
            onPressed: () {
              /* Como ya creamos nuestro provider, ya no es necesario llamar a 
              setState 
              setState(() {
                Recordar que el estado de este Page es _counter. Como es un 
                ESTADO, cada vez que cambia (aumenta )el widget se redibuja o se
                vuelve a construr, es decir, se ejecuta de nuevo build. Es es la
                función del estado: mantener un valor y que el widget lo 
                muestre.

                Pero el problema es, que este ESTADO se está manejando 
                localmente desde Page1, es decir, habría problema si quiero 
                visualizar este número en las diferentes pages. 

                Además, otro gran problema, es que si pasamos de Page y 
                regresamos a Page1, nuestro estado (_count) vuelve a estar en 
                CERO, esto es debido a que el widget Page1 se destruyó, Flutter 
                tomó ese widget y lo desechó de la memoria. Es decir, cuando 
                regreso de nuevo a Page1, todo se ejecuta de nuevo y _counter 
                será igual a 0
                
                Para resolver dichos problemas necesitaria un ESTADO GLOBAL, 
                para eso, usaríamos Provider (administrador de paquetes 
                globales). 
                //_counter++;
              });*/

              /* Aquí vamos a llamar el método que incrementa al counter 
              (nuestro estado) por medio de read. Recordar que read hace una 
              lectura única de un método o de una propiedad para poder MODIFICAR
              el estado. */
              context.read<CounterProvider>().increment();
            },
            child: const Text('Sumar'),
          ),
        ],
      ),
    );
  }
}
