import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_exemple.dart';
import 'package:comarcasgui/screens/infocomarca_detall.dart';
import 'package:comarcasgui/screens/infocomarca_general.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InfoComarcaNavigator extends StatefulWidget  {
  // TO-DO
  // Afegir la propietat comarca, de tipus Comarca? i proporcionar-la
  // al constructor com a argument amb nom.

  final String? nomcomarca;
  final Comarca? comarca;

  const InfoComarcaNavigator({super.key, required this.nomcomarca, required this.comarca});

  @override
  State<InfoComarcaNavigator> createState() => _InfoComarcaNavigatorState();
}

class _InfoComarcaNavigatorState extends State<InfoComarcaNavigator> {
  int indexActual = 0;

  @override
  Widget build(BuildContext context) {
    Comarca? comarca = RepositoryExemple.obtenirInfoComarca(widget.nomcomarca!);
    
        if (kDebugMode) {
          print ("Desde infocomarca_navigator");
          print (widget.nomcomarca!);
          print (comarca?.capital);   
        }

    return Scaffold(
      appBar: AppBar(
        title: [
          const Text('Informació General'),
          const Text('Població i Oratge')
        ][indexActual],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            indexActual = index;
          });
        },
        selectedIndex: indexActual,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Informació General',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Informació Detallada',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: InfoComarcaGeneral(nomcomarca: widget.nomcomarca!, comarca: comarca),
        ),
        Container(
          alignment: Alignment.center,
          child: InfoComarcaDetall(nomcomarca: widget.nomcomarca!, comarca: comarca),
        ),
      ][indexActual],
    );
  }
}
