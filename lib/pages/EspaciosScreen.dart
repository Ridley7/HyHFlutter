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
  double bottomPadding = -230.0;//16.0;//-230.0;
  bool _tapped = false;

  Map<int, Espacio> hashEspacios = {
    0: Espacio(id: 0, name: "Sala 1", description: "Espacio 1", spots: 2, schedule: "9 AM - 5 PM", cornerTopLeft: Offset(41, 33), cornerBottomRight: Offset(183, 202), tapped: false, selectedColor: Color.fromRGBO(50, 200, 50, 0.5), unselectedColor: Color.fromRGBO(50, 50, 200, 0.5) ),
    1: Espacio(id: 1, name: "Sala 2", description: "Espacio 2", spots: 5, schedule: "10 AM - 5 PM", cornerTopLeft: Offset(183, 33), cornerBottomRight: Offset(272, 202), tapped: false, selectedColor: Color.fromRGBO(50, 200, 50, 0.5), unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
    2: Espacio(id: 2, name: "Sala 3", description: "Espacio 3", spots: 5, schedule: "11 AM - 6 PM", cornerTopLeft: Offset(272, 33), cornerBottomRight: Offset(356, 202), tapped: false, selectedColor: Color.fromRGBO(50, 200, 50, 0.5), unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  };

  Espacio? selectedEspace;

  List<ImageMapRegion> _createRegions(){

    List<ImageMapRegion> list_regions = [];
    ImageMapRegion temp_region;

    hashEspacios.forEach((key, espacio) {

      temp_region = ImageMapRegion.fromRect(
          rect: Rect.fromPoints(espacio.cornerTopLeft, espacio.cornerBottomRight),
        color: espacio.tapped ? espacio.selectedColor : espacio.unselectedColor,
        title: espacio.id.toString()
      );

      list_regions.add(temp_region);
    });

    return list_regions;

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Espacios")),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [

                Positioned(
                    child: Text("Hola")
                ),
                


                
                Positioned(
                  top: 50,
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
                              if(espacio.tapped && espacio.id != index){
                                espacio.tapped = false;
                              }
                            });
                            
                            if(hashEspacios.containsKey(index)){

                              if(hashEspacios[index]!.tapped){
                                bottomPadding = -230.0;
                              }else{
                                bottomPadding = 16.0;
                              }

                              hashEspacios[index]!.tapped = !hashEspacios[index]!.tapped;

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

                //Bottom
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                left: 0,
                right: 0,
                bottom: bottomPadding,
                child: Container(
                  height: 230.0,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          print("hola");
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: padding),
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Color.fromRGBO(86, 238, 173, 1)
                          ),
                          child: Center(
                            child: Text(selectedEspace?.name == null ? "Nombre" : selectedEspace!.name,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),)

                            ,
                          ),
                        ),
                      ),



                      //ListView
                      Flexible(
                        fit: FlexFit.tight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(selectedEspace?.description == null ? "Descripcion: " : "Descripción: " + selectedEspace!.description),
                                  Text(selectedEspace?.spots == null ? "Plazas: " : "Plazas: " + selectedEspace!.spots.toString()),
                                  Text(selectedEspace?.schedule == null ? "Horario: " : "Horario: " + selectedEspace!.schedule),
                                ],
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                )
            )


              ],
            ),
          ),
      ),
    );
  }
}

