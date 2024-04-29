import 'package:comarcasgui/screens/infocomarca_navigator.dart';
import 'package:comarcasgui/services/comarques_service.dart';
import 'package:flutter/material.dart';

class ComarquesScreen extends StatelessWidget {
  const ComarquesScreen({super.key, required this.provincia});
  final String? provincia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Comarques de $provincia')),
      body: Center(
          // Eliminada: Ja no tenim RepositoryExample
          // child: _creaLlistaComarques(RepositoryExemple.obtenirComarques(provincia))

          // TO-DO 4: Afig un giny FutureBuilder, que depenga del
          // Future proporcionat pel mètode d'obteció de comarques
          // del repositori corresponent. Quan es dispose
          // d'aquesta informació es crearà la llista de comarques,
          // i mentre aquesta no es tinga, mostrarem un indicador de progrés.
          // child: _creaLlistaComarques([]), // Modificar
          child: FutureBuilder(
            future: ComarquesService.obtenirComarques(provincia!),
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _creaLlistaComarques(snapshot.data!); 
                } else if (snapshot.hasError) {
                        return Center(
                        child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  // Nota: Podeu crear un giny personalitzat
                  // amb aquest contingut, per tindre un
                  // indicador de progrés personalitzat amb
                  // les dimensions correctes i centrat, 
                  // que pugueu reutilitzar en les altres pantalles.
                  return const Center(
                    child: SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator()),
                  );
                }
              }),
    ));
  }

_creaLlistaComarques(List<dynamic> comarques) {
    return ListView.builder(
      itemCount: comarques.length,
      itemBuilder: (BuildContext context, int index) {
        if (comarques.isNotEmpty) {
          String img = comarques[index]["img"];
          String comarca = comarques[index]["nom"];
          return ComarcaCard(img: img, comarca: comarca);
        } else {
          return const Center(
            child: Text("La llista és buida"),
          );
        }
      },
    );
  }
}

class ComarcaCard extends StatelessWidget {
  const ComarcaCard({
    super.key,
    required this.img,
    required this.comarca,
  });

  final String img;
  final String comarca;

  // Ara RepositoryExample ja no existeix // comarca = RepositoryExemple.obtenirInfoComarca(widget.nomComarca);
  // TO-DO 5a: Obtenir la informació de la comarca
  //           a través del repositori corresponent.
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => InfoComarcaNavigator(
              nomcomarca: comarca
            ),
          ),
        );
      },
      child: Card(
        child: Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.blue,
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(comarca,style: const TextStyle(
                fontFamily: "LeckerliOne",
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                shadows: [
                  Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 3),
                ]),
              ),
            )),
      ),
    );
  }
}