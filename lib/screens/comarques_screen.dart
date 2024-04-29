import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_exemple.dart';
import 'package:flutter/material.dart';

class ComarquesScreen extends StatelessWidget {
  const ComarquesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // Proporciona a _creaLlistaComarques la llista de comarques d'Alacant
          child:
              _creaLlistaComarques(RepositoryExemple.obtenirComarques())), ////
    );
  }

  _creaLlistaComarques(List<dynamic> comarques) {
    // Rebem la llista de JSON amb el nom i la imatge (img) de cada comarca

    List<dynamic> llistaComarques = [];
    
      for (var comarca in comarques) {
        llistaComarques.add(Comarca(
            comarca: comarca["nom"],
            img: comarca["img"],
        ));
      }
    
    // Ús de ListView.builder per generar la llista
    return ListView.builder(
      itemCount: comarques.length,
      itemBuilder: (BuildContext context, int index) {
        return ComarcaCard(comarca: comarques[index]['nom'], img: comarques[index]['img'] ?? "");
      }
    );
    // Caldrà fer ús d'un ListView.builder per recórrer la llista
    // i generar un giny personalitzat de tipus ComarcaCard, amb la imatge i el nom.
    //return const Placeholder();
  }
}

class ComarcaCard extends StatelessWidget {
  // Aquest giny rebrà dos arguments amb nom per construir-se:
  // la imatge (img) i el nom de la comarca (comarca)
  const ComarcaCard({
    super.key,
    required this.img,
    required this.comarca,
  });

  final String img;
  final String comarca;

  @override
  Widget build(BuildContext context) {
    // Retorna un giny de tipus Card, amb el disseny que desitgeu, però
    // que mostre la imatge (obtinguda d'Internet a partir de la url)
    // i el nom de la comarca.
    return Card(
      elevation: 1,
      child: Column(children: [
      Stack(children: [
        Image.network(img, width: 400, height: 200,fit: BoxFit.fill),
        Positioned(
          bottom: 10,
          left: 80,
          child: Text(comarca,style: Theme.of(context).textTheme.displayMedium),
        ),
      ]),],
    ),
    );
    //return const Placeholder();
  }
}
