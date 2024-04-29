// Implementació de la classe Comarca
class Comarca {
  late String comarca; // Declarem la comarca, i indiquem que l'inicialitzarem després
  String? capital; //Declarem la capital de comarca, es nul·lable
  String? poblacio; //Declarem la quantitat d'habitants, es nul·lable

  String? img; // La url a la imatge, és nul·lable
  String? desc; // La descripció de la comarca, es nul·lable
  double? latitud; //La latitud on es troba ubicada, es nul·lable
  double? longitud; //La longitud on es troba ubicada, es nul·lable */

  /*
  Constructor amb arguments amb nom: 
   - comarca és obligatori, i 
   - la resta de arguments son opcionals.
  */
  Comarca({
    required this.comarca,
    this.capital,
    this.poblacio,
    this.img,
    this.desc,
    this.latitud,
    this.longitud, 
  });
  
  Comarca.fromJSON(Map<String, dynamic> objecteJSON) {
    comarca = objecteJSON["comarca"] ?? "";
    capital = objecteJSON["capital"] ?? "";
    poblacio = objecteJSON["poblacio"] ?? "";
    img = objecteJSON["img"] ?? "";
    desc = objecteJSON["desc"] ?? "";
    latitud = objecteJSON["latitud"] ?? "";
    longitud = objecteJSON["longitud"] ?? "";
  }

  @override
  String toString(){
    if (capital != null){
      return ('''\x1B[30mComarca:\t\x1B[30m$comarca\x1B[0m
              \x1B[30mCapital:\t\x1B[30m$capital\n\x1B[0m
              \x1B[30mPoblació:\t\x1B[30m$poblacio\n\x1B[0m
              \x1B[30mImatge:\t\x1B[31m$img\n\x1B[0m
              \x1B[30mDescripció:\t\x1B[30m$desc\n\x1B[0m
              \x1B[30mCoordenades:\t\x1B[30m($latitud,$longitud)\n\x1B[0m''');
    }
    else {
      return ('''\x1B[30mNom:\t\x1B[30m$comarca\x1B[0m
              \x1B[30mImatge:\t\x1B[30m$img\n\x1B[0m''');
    }
  }
}