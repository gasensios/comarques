import 'dart:convert'; // Per realitzar conversions entre tipus de dades
// ignore: unused_import
import 'dart:io';
import 'package:comarquescli/comarca.dart';
import 'package:comarquescli/provincia.dart';
import 'package:http/http.dart' as http;

class ComarquesService {

    static Future<List<Provincia>> obtenirProvincies() async {
    // Obté la llista de províncies
    try {
      String url =
          "https://node-comarques-rest-server-production.up.railway.app/api/comarques/provincies";
      var data = await http.get(Uri.parse(url));

      // Preparem la llista de províncies a retornar
      List<Provincia> llistaProvincies = [];

      if (data.statusCode == 200) {
        // Si hi ha resposta la processem per retornar-la com
        // a llista de províncies

        String body = utf8.decode(data.bodyBytes);
        final bodyJSON = jsonDecode(body) as List;

        // Forma 1. Recorrem el JSON i creem la llista de provincies
        /*for (var provinciaJSON in bodyJSON) {
          // Amb el constructor per defecte
          llistaProvincies.add(Provincia(
            nom: provinciaJSON["provincia"],
            imatge: provinciaJSON["img"],
          ));

          // Alternativa: Amb el constructor amb nom
           //llistaProvincies.add(Provincia.fromJSON(provinciaJSON));
        }*/

        // Forma 2: Fem ús del mapat d'estructures
        llistaProvincies = bodyJSON.map((provinciaJSON) {
          // Amb el constructor per defecte
          return Provincia(
            nom: provinciaJSON["provincia"],
            imatge: provinciaJSON["img"],
          );
          // Amb el constructor amb nom
          //return Provincia.fromJSON(provinciaJSON);
        }).toList();
      }
      // I finalment retornem la llista
      return llistaProvincies;
    } catch (except) {
      print(except.toString());
      return [];
    }
  }


  static Future<List<dynamic>> obtenirComarques(String provincia) async {
    // Obté la llista de comarques
    try{
      String url =
          "https://node-comarques-rest-server-production.up.railway.app/api/comarques/comarquesAmbImatge/$provincia";
      var data = await http.get(Uri.parse(url));

      List<dynamic> llistaComarques = [];

      if (data.statusCode == 200) {
        // Si hi ha resposta la processem per retornar-la com la llista de comarques
        String body = utf8.decode(data.bodyBytes);
        llistaComarques = jsonDecode(body) as List;
        // Es retorna el llistat de comarques contingut en el JSON
      return llistaComarques;
      }
     return [];
     } catch (except) {
      print(except.toString());
      return [];
     }
   }
  
  

  static Future<Comarca?> infoComarca(String comarca) async {
    // Obté la informació de la comarca sol.licitada
    try{
      String url =
          "https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca";
      var data = await http.get(Uri.parse(url));

      if (data.statusCode == 200) {
        // Si hi ha resposta la processem per retornar-la com l'informació associada a la comarca
        String body = utf8.decode(data.bodyBytes);

        final bodyJSON = jsonDecode(body);
        final datoscomarca = Comarca.fromJSON(bodyJSON);
        
        // Es retorna la informació de la propia comarca
        return datoscomarca;
      }
      return null;
    } catch (except) {
      print(except.toString());
      return null;
    }
  }
}
