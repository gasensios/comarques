import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_exemple.dart';
import 'package:comarcasgui/screens/widgets/my_weather_info.dart';
import 'package:flutter/material.dart';

class InfoComarcaDetall extends StatelessWidget {
  const InfoComarcaDetall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Comarca comarca = RepositoryExemple.obtenirInfoComarca();

    // Afegir la informació següent sobre la comarca:
    // Població (num. d'habitants), latitud i longitud.
    // Podeu combinar Column i Row per mostrar la informació tabulada

    // Abans de la informació, caldrà mostrar la informació sobre l'oratge a la comarca,
    // mitjançant el widget personalitzat MyWeatherInfo(), que se us proporciona ja implementat
    
    var poblacio = comarca.poblacio;
    var latitud = comarca.latitud; 
    var longitud = comarca.longitud;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column ( children: <Widget> [
          const MyWeatherInfo(),
            Text('\nPoblacio: $poblacio \n', style: const TextStyle(fontSize: 22, color: Colors.black)),
            Text('Latitud: $latitud \n', style: const TextStyle(fontSize: 22, color: Colors.black)),
            Text('Longitud: $longitud \n', style: const TextStyle(fontSize: 22, color: Colors.black)),
        ],  
        ),
      ),
    );

    //return const Placeholder();
  }
}