import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_exemple.dart';
import 'package:comarcasgui/screens/infocomarca_navigator.dart';
import 'package:flutter/material.dart';

class ComarquesScreen extends StatelessWidget {
  // ComarquesScreen necessita un nom de provincia
  // TO-DO:
  // Afegir un argument amb nom al constructor amb el nom de la provincia
  // Afegir també una propietat a la classe de tipus "final String" a la classe pe a la provincia
  // const ComarquesScreen();

  final String? nombre;

  const ComarquesScreen({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TO-DO:
      // Incorporar un AppBar per a que mostre el text
      // "Comarques de..." i el nom de la província seleccionada.
      appBar: AppBar(
          title: Text('Comarques de $nombre')),
      body: Center(
        // TO-DO:
        // Crear la llista de comarques amb les comarques 
        // corresponents a la província actual (passar en lloc d'alacant
        // la propietat amb el nom de la província que heu declarat
          child:  
            _creaLlistaComarques(RepositoryExemple.obtenirComarques(nombre!))), ////
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
  ComarcaCard({
    super.key,
    required this.img,
    required this.comarca,
  });

  final String img;
  final String comarca;

  final TextEditingController _controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TO-DO:
    // Envoltar aquest Card amb un GestureDetector, de manera
    // que quan fem clic en ell, (event onTap), "naveguem" fins la pantalla
    // amb la informació sobre la comarca seleccionada.
    // Aquesta nova pantalla serà InfoComarca (fitxer infocomarca.dart),
    // que haureu d'implementar.
    
    Comarca? comarques = RepositoryExemple.obtenirInfoComarca(comarca);

    return GestureDetector(
      onTap: () {
        _controlador.text = comarca;  
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => 
            InfoComarcaNavigator(nomcomarca: _controlador.text, comarca: comarques)),
        );
      }, 
      child: Card(
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
      ),);
    //return const Placeholder();
  }
}
