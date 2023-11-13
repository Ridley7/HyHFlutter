import 'package:flutter/material.dart';
import 'package:flutter_image_map/flutter_image_map.dart';


class EspaciosScreen extends StatefulWidget {
  const EspaciosScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImageMapExample();
  }
}

class ImageMapExample extends State<EspaciosScreen> {

  double padding = 16.0;
  double bottomPadding = 16.0;//-230.0;
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Espacios")),
        body: Stack(
          children: [

            Positioned(
              top: 0.0,
                child: Text("Espacios")),
            
            Positioned(
              top: 100.0,
              child: ImageMap(
                    image: Image.asset('assets/images/horizontal.jpg'),
                    onTap: (region) {
                      // ignore: avoid_print
                      print('Pressed: ${region.title} / ${region.link}');
                      setState(() {

                        if(_tapped){
                          bottomPadding = -230.0;
                        }else{
                          bottomPadding = 16.0;
                        }

                        _tapped = !_tapped;

                      });
                    },
                    regions: [

                      ImageMapRegion.fromRect(
                        rect: const Rect.fromLTWH(10, 10, 100, 100),
                        color: _tapped
                            ? const Color.fromRGBO(50, 200, 50, 0.5)
                            : const Color.fromRGBO(50, 50, 200, 0.5),
                        title: 'test2',
                      )
                    ],
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
                            child: Text("Check box",
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
                                  Text("DEscripcion"),
                                  Text("Plazas:"),
                                  Text("Horario:"),
                                ],
                              ),
                            ],
                          )

                          /*
                          ListView.builder(
                            padding: EdgeInsets.only(top: padding),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                              return Transform.translate(
                                offset: Offset(padding, 0.0),
                                child: Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.white
                                  ),
                                  child: Placeholder(),
                                ),
                              );
                              }
                          )
                          */

                      )
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}