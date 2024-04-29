import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_exemple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoComarcaGeneral extends StatelessWidget {
  const InfoComarcaGeneral({super.key});

  @override
  Widget build(BuildContext context) {

    // Agafem la comarca del repositori
    Comarca comarca = RepositoryExemple.obtenirInfoComarca();

        // Afegir la informació següent sobre la comarca:
    // Imatge, nom, capital i descripció, de forma semblanta com es mostra a l'enunciat

    // Podeu fer ús dels ginys i contenidors que considereu oportuns (Containers, SingleChildScrollView, Columns, etc)
    // Heu de tindre en compte de no sobrepassar els límits i dibuixar fora de l'espai disponible
    // Per comprovar que no se n'eixiu, podeu provar a girar el dispositiu (si esteu fent-ho sobre Android)
    var nombre = comarca.capital;

    return Scaffold(
        body: SingleChildScrollView(
        child: Column (
        children: <Widget> [
          Image.network(comarca.img!, width: 600, height: 250,fit: BoxFit.fill),
          Text(comarca.comarca, style: const TextStyle(fontSize: 16, color: Colors.black, height: 2)),
          Text('Capital: $nombre', style: const TextStyle(fontSize: 16, color: Colors.black, height: 2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox(width: 350, height: 350,
              //const SizedBox(height: 10),
                child: Text(comarca.desc!,maxLines: 50, style: const TextStyle(fontSize: 12, color: Colors.black,height: 2),),
            ),],
        ),],
        ),
        ),
      //],
    );
  }
}
