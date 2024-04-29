import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/screens/widgets/my_weather_info.dart';
import 'package:flutter/material.dart';

class InfoComarcaDetall extends StatelessWidget {
  
  // TO-DO
  // Afegir la propietat comarca, de tipus Comarca? i proporcionar-la
  // al constructor com a argument amb nom.

  final String? nomcomarca;
  final Comarca? comarca;

  const InfoComarcaDetall({
    super.key,
    required this.nomcomarca,
    required this.comarca
  });

  @override
  Widget build(BuildContext context) {
    // TO-DO
    // Ja tenim aquesta informació en la propietat Comarca, 
    //proporcionada om a argument, pel que haurem d'eliminar esta línia.
    
    // Compte que ara comarca pot ser nul, pel que haurem de fer ús
    // posteriormen de l'accés amb nuls ?. i de l'operador ?? per 
    // assignar valors en cas que siguen nuls.
    
    // TO-DO
    // Com que tenim l'Scaffold en InfoComarca i aquest és
    // un giny que serà part del seu body, haurem d'eliminar
    // aquest Scaffold

    return Scaffold(
      body: SingleChildScrollView(
        child: Column ( children: <Widget> [
          const MyWeatherInfo(),
            // TO-DO
            // Què passa si comarca és null?
            Text('\nPoblacio: ${comarca?.poblacio ?? 'No disponible'} \n', style: const TextStyle(fontSize: 22, color: Colors.black)),
            // TO-DO
            // Què passa si latitud és null?
            Text('Latitud: ${comarca!.latitud ?? 'No disponible'} \n', style: const TextStyle(fontSize: 22, color: Colors.black)),
            // TO-DO
            // Què passa si longitud és null?
            Text('Longitud: ${comarca!.longitud ?? 'No disponible'} \n', style: const TextStyle(fontSize: 22, color: Colors.black)),
        ],  
        ),
      ),
    );
    //return const Placeholder();
  }
}