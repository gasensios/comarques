// Importació de llibreries

import 'dart:io';
// ignore: unused_import
import 'package:comarquescli/comarca.dart';
import 'package:comarquescli/comarques_service.dart';
import 'package:comarquescli/provincia.dart';

void main(List<String> arguments) {

  // Comprovem el nombre d'arguments
  if (arguments.isEmpty) {
    print("\x1B[31m Nombre d'arguments incorrectes\x1B[0m");
    exit(-1);
  }

  // Parsegem la llista d'arguments
  List<String> llistaArgs = List.from(arguments);
  String? ordre;
  String? args;

  // Separem l'ordre (provincies, comarques, infocomarca) de la llista d'arguments
  ordre = llistaArgs[0];
  llistaArgs.removeAt(0);
  args = llistaArgs.join(" ");

  switch (ordre) {
    case "provincies":
      mostraProvincies();        // Implementació amb Future
      // mostraProvinciesSync(); // Implementació amb async/await
      break;

    case "comarques":
      if (arguments.length != 2) {
        print(
            "\x1B[31m Nombre d'arguments incorrectes. Cal especificat la província.\x1B[0m");
        exit(-1);
      }
      mostraComarques(args);
      break;

    case "infocomarca":
      if (arguments.length < 2) {
        print(
            "\x1B[31m Nombre d'arguments incorrectes. Cal especificat la Comarca.\x1B[0m");
        exit(-1);
      }
      mostraInfoComarca(args);
      break;
    default:
      print("\x1B[31mOrdre desconeguda\x1B[0m");
  }
}

// Implementació de mostraProvincies fent ús del Future

mostraProvincies() {
  // La llista de províncies vindrà en un Future
  Future<List<Provincia>> respostaFuture = ComarquesService.obtenirProvincies();

  // Preparem el callback
  respostaFuture.then((resposta) {
    if (resposta.isNotEmpty) {
      // Recorrem la llista per mostrar els resultats
      for (var provincia in resposta) {
        print(provincia.toString());
      }
    } else {
      print("\x1B[31mNo s'ha obtingut cap resposta\x1B[0m");
    }
  });
}

// Implementació de mostraProvincies amb async/await

mostraProvinciesSync() async {
  // La llista de províncies s'obté directament
  List<Provincia> provincies = await ComarquesService.obtenirProvincies();

  if (provincies.isNotEmpty) {
    for (var provincia in provincies) {
      print(provincia.toString());
    }
  } else {
    print("\x1B[31mNo s'ha obtingut cap resposta\x1B[0m");
  }
}

mostraComarques(String provincia) {
  // Obtenir la llista de províncies i mostrar-la per pantalla
  Future<List<dynamic>> respostaFuture = ComarquesService.obtenirComarques(provincia);

  List<dynamic> llistaComarques = [];

  // Preparem el callback
  respostaFuture.then((resposta) {
    // Mostrem la llista dinamica de les comarques
    if (resposta.isNotEmpty) {
      for (var comarca in resposta) {
        llistaComarques.add(Comarca(
            comarca: comarca["nom"],
            img: comarca["img"],
        ));
      }
      print(llistaComarques.toString());
    } else {
      print("\x1B[31mLa provincia sol.licitada no existeix\x1B[0m");
    }
  });
}

mostraInfoComarca(String comarca) {
  // La llista de províncies vindrà en un Future
  Future<Comarca?> respostaFuture = ComarquesService.infoComarca(comarca);

  // Preparem el callback
  respostaFuture.then((resposta) {
    if (resposta.toString() != 'null') {
      // Mostrem l'informació associada a la comarca
      print(resposta.toString());
    } else {
      print("\x1B[31mLa comarca sol.licitada no existeix\x1B[0m");
    }
  });
}



