import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/models/provincia.dart';
import 'package:comarcasgui/repository/repository_data.dart';

/* 
    Aquest aclasse accedeix a la classe RepositoryData per tal
    d'obtindre la informació sobre provincies i comarques.
*/
class RepositoryExemple {
  static List<Provincia> obtenirProvincies() {
    // Retorna una llista de provincies, obtingudes a partir de la propietat
    // provincies de RepositoryData.

    List<Provincia> provincies = [];
    for (var p in RepositoryData.provincies) {
      provincies.add(Provincia(nom: p["provincia"], imatge: p["img"]));
    }
    return provincies;
  }

  static List<dynamic> obtenirComarques(String provincia) {
    // Retorna la llista de comarques d'una determinada província.
    // Compte, que NO es tracta d'objectes de tipus Comarca,
    // ja que només tenim el nom i la imatge.
    // Es tracta d'un JSON, i per tant és una List<dynamic>
    List<dynamic> comarques = [];

    // Recorrem la llista de provincies en RepositorData per trobar la que es busca
    for (var p in RepositoryData.provincies) {
      if (p["provincia"] == provincia) {
        // Quan trobem la provincia, recorrem les comarques
        // i afegim a la llista comarques un JSON amb el nom
        // i la imatge de cada comarca

        for (var com in p["comarques"]) {
          comarques.add({"nom": com["comarca"], "img": com["img"]});
        }
      }
    }
    return comarques;
  }

  static Comarca? obtenirInfoComarca(String comarca) {
    // Rep el nom d'una comarca (String comarca), i 
    // retorna un objecte de tipus Comarca, amb la 
    // informació sobre aquesta.

    // TO-DO
    // Recorrem la llista de províncies del RepositoryData.provinies
    //     Dins de cada província, recorrem la llista de comarques d'aquesta
    //         Si el nom de la comarca que busquem, coincideix
    //         amb el nom de la comarca, retornem la comarca.
    //         Recordeu que es trata d'un JSON i que haurem de 
    //         retornar un objecte de tipus Comarca (recordeu 
    //         que tenim el constructor fromJSON)
    Comarca? infocomarca = Comarca(comarca: "");

    // Recorrem la llista de provincies en RepositorData per trobar la que es busca
    for (var p in RepositoryData.provincies) {
        // Quan trobem la provincia, recorrem les comarques
        // i afegim a la llista comarques un JSON amb el nom
        // i la imatge de cada comarca

      bool isValid = p["provincia"] == "Alacant" || p["provincia"] == "Castelló" || p["provincia"] == "València"; 
      if (isValid) {
        for (var com in p["comarques"]) {
          if (com["comarca"] == comarca) {
            int? poblacion = int.parse(com["poblacio"].replaceAll(".",""));
            double? latitud = com["latitud"];
            double? longitud = com["longitud"];

            infocomarca.comarca = com["comarca"];
            infocomarca.capital = com["capital"];
            infocomarca.poblacio = poblacion;
            infocomarca.img = com["img"];
            infocomarca.desc = com["desc"];
            infocomarca.latitud = latitud;
            infocomarca.longitud = longitud;
          }
        }
      }
    }
    return infocomarca;
  }
}