import 'package:flutter/material.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import 'package:hiberus_university/models/Espacio.dart';

class EspaciosScreen extends StatefulWidget {
  const EspaciosScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImageMapExample();
  }
}

class ImageMapExample extends State<EspaciosScreen> {
  double padding = 16.0;
  double bottomPadding = -230.0; //16.0;//-230.0;

  Map<int, Espacio> hashEspacios = {
    0: Espacio(
        id: 0,
        name: "Sala 1",
        description: "Espacio 1",
        spots: 2,
        schedule: "9 AM - 5 PM",
        cornerTopLeft: Offset(41, 33),
        cornerBottomRight: Offset(183, 202),
        tapped: false,
        selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
        unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
    1: Espacio(
        id: 1,
        name: "Sala 2",
        description: "Espacio 2",
        spots: 5,
        schedule: "10 AM - 5 PM",
        cornerTopLeft: Offset(183, 33),
        cornerBottomRight: Offset(272, 202),
        tapped: false,
        selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
        unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
    2: Espacio(
        id: 2,
        name: "Sala 3",
        description: "Espacio 3",
        spots: 5,
        schedule: "11 AM - 6 PM",
        cornerTopLeft: Offset(272, 33),
        cornerBottomRight: Offset(356, 202),
        tapped: false,
        selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
        unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
    3: Espacio(
        id: 3,
        name: "Sala 4",
        description: "Espacio 4",
        spots: 5,
        schedule: "11 AM - 6 PM",
        cornerTopLeft: Offset(355, 33),
        cornerBottomRight: Offset(445, 202),
        tapped: false,
        selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
        unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
    4: Espacio(
        id: 4,
        name: "Sala 5",
        description: "Espacio 5",
        spots: 5,
        schedule: "11 AM - 6 PM",
        cornerTopLeft: Offset(41, 290),
        cornerBottomRight: Offset(183, 438),
        tapped: false,
        selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
        unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
    5: Espacio(
        id: 5,
        name: "Sala 6",
        description: "Espacio 6",
        spots: 5,
        schedule: "11 AM - 6 PM",
        cornerTopLeft: Offset(183, 290),
        cornerBottomRight: Offset(270, 438),
        tapped: false,
        selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
        unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
    6: Espacio(
        id: 6,
        name: "Sala 7",
        description: "Espacio 7",
        spots: 5,
        schedule: "11 AM - 6 PM",
        cornerTopLeft: Offset(269, 290),
        cornerBottomRight: Offset(347, 438),
        tapped: false,
        selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
        unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  };

  Espacio? selectedEspace;

  List<ImageMapRegion> _createRegions() {
    List<ImageMapRegion> list_regions = [];
    ImageMapRegion temp_region;

    hashEspacios.forEach((key, espacio) {
      temp_region = ImageMapRegion.fromRect(
          rect:
              Rect.fromPoints(espacio.cornerTopLeft, espacio.cornerBottomRight),
          color:
              espacio.tapped ? espacio.selectedColor : espacio.unselectedColor,
          title: espacio.id.toString());

      list_regions.add(temp_region);
    });

    return list_regions;
  }

  Padding _createRowDescription(
      String image, String nameDescription, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset("assets/images/${image}"),
          const SizedBox(
            width: 10,
          ),
          Text(
            nameDescription,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          Text(text, style: const TextStyle(fontSize: 18, color: Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                /*
                  Positioned(
                    top: 50,
                      child: Text("Hola", style: TextStyle(fontSize: 50),)
                  ),
                  */

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Espacios",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),

                Positioned(
                  top: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ImageMap(
                      image: Image.asset('assets/images/map_hiberus.jpg'),
                      onTap: (region) {
                        // ignore: avoid_print
                        print('Pressed: ${region.title} / ${region.link}');
                        setState(() {
                          int index = int.parse(region.title!);

                          //Comprobamos que no haya otra zona pulsada
                          hashEspacios.forEach((key, espacio) {
                            if (espacio.tapped && espacio.id != index) {
                              espacio.tapped = false;
                            }
                          });

                          if (hashEspacios.containsKey(index)) {
                            if (hashEspacios[index]!.tapped) {
                              bottomPadding = -230.0;
                            } else {
                              bottomPadding = 16.0;
                            }

                            hashEspacios[index]!.tapped =
                                !hashEspacios[index]!.tapped;

                            //Tenemos que pasar la informacion
                            selectedEspace = hashEspacios[index];
                          }
                        });
                      },
                      regions: _createRegions()

                      /*
                          [
                            ImageMapRegion.fromRect(
                              rect: Rect.fromPoints(hashEspacios[0]!.cornerTopLeft, hashEspacios[0]!.cornerBottomRight),
                              color: hashEspacios[0]!.tapped
                                  ? hashEspacios[0]!.selectedColor
                                  : hashEspacios[0]!.unselectedColor,
                              title: hashEspacios[0]!.id.toString(),
                            ),

                            ImageMapRegion.fromRect(
                              rect: Rect.fromPoints(hashEspacios[1]!.cornerTopLeft, hashEspacios[1]!.cornerBottomRight),
                              color: hashEspacios[1]!.tapped
                                  ? hashEspacios[1]!.selectedColor
                                  : hashEspacios[1]!.unselectedColor,
                              title: hashEspacios[1]!.id.toString(),
                            ),

                            ImageMapRegion.fromRect(
                              rect: Rect.fromPoints(hashEspacios[2]!.cornerTopLeft, hashEspacios[2]!.cornerBottomRight),
                              color: hashEspacios[2]!.tapped
                                  ? hashEspacios[2]!.selectedColor
                                  : hashEspacios[2]!.unselectedColor,
                              title: hashEspacios[2]!.id.toString(),
                            ),
                          ],

                      */
                      ),
                ),


                Positioned(
                  bottom: 200,
                  left: 16,
                  child: Container(
                    width: 200,
                      height: 100,
                      child: Text("dfdf", overflow: TextOverflow.ellipsis,),
                  ),
                ),

                //Bottom
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    left: 0,
                    right: 0,
                    bottom: bottomPadding,
                    child: SizedBox(
                      height: 230.0,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: padding),
                            height: 48.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color.fromRGBO(86, 238, 173, 1)),
                            child: Center(
                              child: Text(
                                selectedEspace?.name == null
                                    ? "Nombre"
                                    : selectedEspace!.name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),

                          //ListView
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _createRowDescription(
                                        "descripcion.png",
                                        "Descripción: ",
                                        selectedEspace?.description == null
                                            ? ""
                                            : selectedEspace!.description),
                                    _createRowDescription(
                                        "silla.png",
                                        "Plazas: ",
                                        selectedEspace?.spots == null
                                            ? ""
                                            : selectedEspace!.spots.toString()),
                                    _createRowDescription(
                                        "schedule.png",
                                        "Horario: ",
                                        selectedEspace?.schedule == null
                                            ? ""
                                            : selectedEspace!.schedule),
                                    /*
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Image.asset("assets/images/descripcion.png"),
                                            SizedBox(width: 10,),
                                            Text("Descripción: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),

                                            selectedEspace?.description == null ? Text("") :
                                            Text(selectedEspace!.description, style: TextStyle(fontSize: 18, color: Colors.black)),

                                          ],
                                        ),
                                      ),

                                      */
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
