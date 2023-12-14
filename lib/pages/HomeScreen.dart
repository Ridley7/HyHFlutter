
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hiberus_university/pages/EspaciosScreen.dart';
import 'package:hiberus_university/pages/HiberusScreen.dart';
import 'package:hiberus_university/pages/LecturersScreen.dart';
import 'package:hiberus_university/pages/program_screen.dart';
import 'package:hiberus_university/pages/schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: StaggeredGrid.count(
              crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 3,
            children: [

              StaggeredGridTile.extent(
                  crossAxisCellCount: 1,
                  mainAxisExtent: size.height / 3,
                  child: HHTile(
                      imageBackground: "https://cdn.pixabay.com/photo/2023/10/28/18/02/songbird-8348139_1280.png",
                      labelSection: "Hiberus",
                      callback: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const HiberusScreen()
                            )
                        );
                      },
                    width: size.width / 2,
                  )
              ),


              StaggeredGridTile.extent(
                  crossAxisCellCount: 1,
                  mainAxisExtent: size.height / 3,
                  child: HHTile(
                      imageBackground: "https://cdn.pixabay.com/photo/2023/10/28/18/02/songbird-8348139_1280.png",
                      labelSection: "Espacios",
                      callback: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const EspaciosScreen()
                            )
                        );
                      },
                    width: size.width / 2,
                    leftLabel: null,
                    rightLabel: 0,
                  )
              ),

              StaggeredGridTile.extent(
                  crossAxisCellCount: 1,
                  mainAxisExtent: size.height / 3,
                  child: HHTile(
                      imageBackground: "https://cdn.pixabay.com/photo/2023/09/22/07/02/red-8268266_1280.jpg",
                      labelSection: "Profesores",
                      callback: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LecturersScreen()
                            )
                        );
                      },
                    width: size.width / 2,
                  )
              ),

              StaggeredGridTile.extent(
                  crossAxisCellCount: 1,
                  mainAxisExtent: size.height / 3,
                  child:
                  HHTile(
                      imageBackground: "https://cdn.pixabay.com/photo/2023/09/14/15/48/woman-8253239_1280.jpg",
                      labelSection: "Horarios",
                      callback: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ScheduleScreen()
                            )
                        );
                      },
                    width: size.width / 2,
                    leftLabel: null,
                    rightLabel: 0,
                  )

              ),

              StaggeredGridTile.extent(
                  crossAxisCellCount: 2,
                  mainAxisExtent: size.height / 3,
                  child: HHTile(
                      imageBackground: "https://cdn.pixabay.com/photo/2023/10/27/10/49/australian-king-parrot-8345064_1280.jpg",
                      labelSection: "Programa",
                    callback: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ProgramScreen()
                          )
                      );
                    },
                  )
              )


            ],
          )
      ),
    );
  }
}

class HHTile extends StatelessWidget {
  const HHTile({
    Key? key,
    required this.imageBackground,
    required this.labelSection,
    required this.callback,
    this.width,
    this.leftLabel,
    this.rightLabel
  }) : super(key: key);

  final String imageBackground;
  final String labelSection;
  final VoidCallback callback;
  final double? width;
  final double? leftLabel;
  final double? rightLabel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          InkWell(
            child: Image.network(
                imageBackground,
              width: width,
              fit: BoxFit.fill,
            ),
            onTap: (){
              //print("Pulsando");
              callback();
            },
          ),

        Positioned(
          top: 50.0,
          left: leftLabel,
          right: rightLabel,
          child: Container(
            decoration: const BoxDecoration(color: Colors.red),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              labelSection,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ],
    );
  }
}
