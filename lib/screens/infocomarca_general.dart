import 'package:comarcasgui/models/comarca.dart';
import 'package:flutter/material.dart';

// TO-DO
// Afegir la propietat comarca, de tipus Comarca i proporcionar-la
// al constructor.

class InfoComarcaGeneral extends StatelessWidget {
  const InfoComarcaGeneral({super.key, required this.nomcomarca,required this.comarca});
  final String? nomcomarca;
  final Comarca? comarca;

  @override
    Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
        child: Column (
        children: <Widget> [
          Image.network(comarca?.img ?? 'No disponible', width: 300, height: 250,fit: BoxFit.fill),
          Text(comarca?.comarca ?? 'No disponible', style: const TextStyle(fontSize: 16, color: Colors.black, height: 2)),
          Text(comarca?.capital ?? 'No disponible', style: const TextStyle(fontSize: 16, color: Colors.black, height: 2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox(width: 300, height: 300,
                child: Text(comarca?.desc ?? 'Descripcion no disponible',maxLines: 50, style: TextStyle(fontSize: 12, color: Colors.black,height: 2),),
            ),],
        ),],
        ),
        ),
    );
  }
}