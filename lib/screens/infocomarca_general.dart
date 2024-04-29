import 'package:comarcasgui/models/comarca.dart';
import 'package:flutter/material.dart';

class InfoComarcaGeneral extends StatelessWidget {
  // TO-DO
  // Afegir la propietat comarca, de tipus Comarca? i proporcionar-la
  // al constructor com a argument amb nom.

  final String? nomcomarca;
  final Comarca? comarca;

  const InfoComarcaGeneral({super.key, required this.nomcomarca,required this.comarca});

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
    var nombre = comarca?.capital;

    return Scaffold(
        body: SingleChildScrollView(
        child: Column (
        children: <Widget> [
          // TO-DO
          // Què passa si comarca és null?
          Image.network(comarca?.img ?? 'No disponible', width: 600, height: 250,fit: BoxFit.fill),
          // TO-DO
          // Què passa si comarca és null?
          Text(comarca?.comarca ?? 'No disponible', style: const TextStyle(fontSize: 16, color: Colors.black, height: 2)),
          // TO-DO
          // Què passa si comarca és null?
          Text('Capital: ${nombre ?? 'No disponible'} \n', style: const TextStyle(fontSize: 16, color: Colors.black, height: 2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox(width: 350, height: 350,
                // TO-DO
                // Què passa si comarca és null?
                child: Text(comarca!.desc ?? 'Descripcion no disponible',maxLines: 50, style: const TextStyle(fontSize: 12, color: Colors.black,height: 2),),
            ),],
        ),],
        ),
        ),
      //],
    );
  }
}