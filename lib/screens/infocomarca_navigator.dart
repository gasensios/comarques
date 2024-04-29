import 'package:comarcasgui/repository/repository_comarques.dart';
import 'package:comarcasgui/screens/infocomarca_detall.dart';
import 'package:comarcasgui/screens/infocomarca_general.dart';
import 'package:flutter/material.dart';

class InfoComarcaNavigator extends StatefulWidget  {
  const InfoComarcaNavigator({super.key, required this.nomcomarca});
  final String? nomcomarca;

  @override
  State<InfoComarcaNavigator> createState() => _InfoComarcaNavigatorState();
}

class _InfoComarcaNavigatorState extends State<InfoComarcaNavigator> {
  // Definim la comarca
  // TO-DO 5b: Modifica la declaració de comarca, per a que
  //           agafe un Future, i per a que es puga assignar 
  //           el seu valor més tard.

  int indexActual = 0;
  late Future<dynamic> info_comarca;

  @override
  void initState() {
    super.initState();
    // Ara RepositoryExample ja no existeix // comarca = RepositoryExemple.obtenirInfoComarca(widget.nomComarca);
    // TO-DO 5a: Obtenir la informació de la comarca
    //           a través del repositori corresponent.
    info_comarca = RepositoryComarques.obtenirInfoComarca(widget.nomcomarca!);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: [
          const Text('Informació General'),
          const Text('Població i Oratge')
        ][indexActual]),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            indexActual = index;
          });
        },
        selectedIndex: indexActual,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),selectedIcon: Icon(Icons.home),
            label: 'Informació General',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),selectedIcon: Icon(Icons.people),
            label: 'Informació Detallada',
          ),
        ],
      ),
      body: <Widget>[
        // Proporcoinem a estos widgets la comarca en qüestió
        // TO-DO 6: Modifica la creació d'estos widgets,
        // de manera que es construisquen mitjançant un  FutureBuilder.
        // Mentre no es resolga la informació es mostrarà un indicador
        // de progrés.
        Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: info_comarca,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InfoComarcaGeneral(nomcomarca: widget.nomcomarca!, comarca: snapshot.data);
                } else {
                  return const Center(
                    child: SizedBox(
                        width: 200,height: 200,
                        child: CircularProgressIndicator()),
                  );
                }
              },),
        ), 
        Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: info_comarca,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InfoComarcaDetall(nomcomarca: widget.nomcomarca!, comarca: snapshot.data);
                } else {
                  return const Center(
                    child: SizedBox(
                        width: 200,height: 200,
                        child: CircularProgressIndicator()),
                  );
                }
              },),
        ),
      ][indexActual],
    );
  }
}
