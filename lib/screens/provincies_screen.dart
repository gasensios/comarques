import 'package:comarcasgui/models/provincia.dart';
import 'package:comarcasgui/screens/comarques_screen.dart';
import 'package:comarcasgui/repository/repository_exemple.dart';
import 'package:flutter/material.dart';

/* Pantalla ProvinciesScreen: mostra tres CircleAvatar amb les diferents províncies */

class ProvinciesScreen extends StatelessWidget {
  const ProvinciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(                  // Estructura de la pantalla Material Design
      body: Center(                   // Centrem el contingut
        child: SingleChildScrollView( // Contenidor amb scroll per si ens n'eixim de l'espai disponible
          child: Column(              // Organitzem les provincies en forma de columna
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:               // Obtindrem la llista de widgets amb les provincies amb la 
                                      // funció privada _creaLlistaProvincies.
                  _creaLlistaProvincies(RepositoryExemple.obtenirProvincies())),
        ),
      ),
    );
  }
}

List <Widget> _creaLlistaProvincies(List<Provincia> provincies) {
  // Retornarem una llista de widgets
  List<Widget> llista = [];

  // Recorrem la llista de províncies
  for (Provincia provincia in provincies) {
    llista.add( // I afegim a la llista un widget personalitzat de tipus ProvinciaRoundButton
        ProvinciaRoundButton(nom: provincia.nom, img: provincia.imatge ?? "", nombre: '',));
    llista.add(const SizedBox(height: 20)); // Afegim un espai després del widget amb la província
  }
  return llista;
}

class ProvinciaRoundButton extends StatelessWidget {
  ProvinciaRoundButton({required this.img, required this.nom, required this.nombre, super.key});

  final String img;
  final String nom;
  final String nombre;

  final TextEditingController _controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TO-DO.
    // Envoltar el CircleAvatar amb un GestureDetector, de manera que
    // quan fem clic en ell (event onTap), "naveguem" fins la pantalla
    // amb les comarques de la provincia seleccionada.

    return GestureDetector(
     onTap: () {
        /*TextField(controller: _controlador);
        String currentRoute =
          (ModalRoute.of(context)?.settings.name).toString();
        if (currentRoute != "/ComarquesScreen") {
          Navigator.of(context).pushReplacementNamed('/ComarquesScreen');
        }*/

        _controlador.text = nom;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => 
              ComarquesScreen(nombre: _controlador.text)),
        );
     },
     child: CircleAvatar(
      radius: 110,
      backgroundImage: NetworkImage(img),
      child: Text(nom,style: Theme.of(context).textTheme.displayMedium,
     ),),
    );
  }
}
