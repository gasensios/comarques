import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/screens/widgets/my_weather_info.dart';
import 'package:flutter/material.dart';

class InfoComarcaDetall extends StatelessWidget {

  const InfoComarcaDetall({
    super.key,
    required this.nomcomarca,
    required this.comarca
  });
  final String? nomcomarca;
  final Comarca? comarca;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration:
            const BoxDecoration(color: Color.fromARGB(200, 255, 255, 255)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              // TO-DO?
              // Ara cal parametritzar el giny MyWeatherInfo
              MyWeatherInfo(longitud: comarca?.longitud,latitud: comarca?.latitud,),
              const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 150,child: Text("Població:",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Text(comarca?.poblacio?.toString() ?? "0",
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text("Latitud:",
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  )),
                              Text(
                                comarca?.latitud?.toString() ?? "",
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Longitud:",
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  )),
                              Text(
                                comarca?.longitud?.toString() ?? "",
                                style: Theme.of(context).textTheme.headlineSmall,
                          ),
                      ],
                    ),
                  ],
                ),
              ), //////
            ]),
      ),
    );
  }
}