import 'package:flutter/material.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/models/zone_screen/zone.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';

class ZonesScreen extends StatefulWidget {
  const ZonesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImageMapExample();
  }
}

class ImageMapExample extends State<ZonesScreen> {
  double padding = 16.0;
  double bottomPadding = -230.0;

  Zone? selectedEspace;

  List<ImageMapRegion> _createRegions() {
    List<ImageMapRegion> listRegions = [];
    ImageMapRegion tempRegion;

    zones.forEach((key, zone) {
      tempRegion = ImageMapRegion.fromRect(
          rect:
              Rect.fromPoints(zone.cornerTopLeft, zone.cornerBottomRight),
          color:
              zone.tapped ? zone.selectedColor : zone.unselectedColor,
          title: zone.id.toString());

      listRegions.add(tempRegion);
    });

    return listRegions;
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

    final size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringsApp.ESPACIOS,
                      style: ConstantsApp.TittleApp,
                    ),
                  ],
                ),

                Positioned(
                  top: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ImageMap(
                    image: Image.network("https://i.pinimg.com/564x/e6/81/48/e6814836ce7c227028936499061bc3bf.jpg"),
                      onTap: (region) {

                        setState(() {
                          int index = int.parse(region.title!);

                          //Comprobamos que no haya otra zona pulsada
                          zones.forEach((key, zone) {
                            if (zone.tapped && zone.id != index) {
                              zone.tapped = false;
                            }
                          });

                          if (zones.containsKey(index)) {
                            if (zones[index]!.tapped) {
                              bottomPadding = -230.0;
                            } else {
                              bottomPadding = 16.0;
                            }

                            zones[index]!.tapped =
                                !zones[index]!.tapped;

                            //asignamos info
                            selectedEspace = zones[index];
                          }
                        });
                      },
                      regions: _createRegions()
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
