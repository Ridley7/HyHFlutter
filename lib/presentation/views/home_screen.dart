
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/presentation/views/lecturers_screen.dart';
import 'package:hiberus_university/presentation/views/program_screen.dart';
import 'package:hiberus_university/presentation/navigation/navigation_routes.dart';
import 'package:hiberus_university/presentation/views/schedule_screen.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';

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
            children:

            menu.map((item) {
              return StaggeredGridTile.extent(
                  crossAxisCellCount: item.amountCells,
                  mainAxisExtent: size.height / 3,
                  child: HHTile(
                    imageBackground: item.imageBackground,
                    labelSection: item.labelSection,
                    callback: (){
                      context.push(item.route);
                    },
                    width: item.allWidth ? size.width : size.width / 2,
                    leftLabel: item.positionLeftLabel,
                    rightLabel: item.positionRightLabel,
                    //width: size.width / 2,
                  )
              );
            }).toList()


/*
            [

              StaggeredGridTile.extent(
                  crossAxisCellCount: 1,
                  mainAxisExtent: size.height / 3,
                  child: HHTile(
                      imageBackground: "https://cdn.pixabay.com/photo/2023/10/28/18/02/songbird-8348139_1280.png",
                      labelSection: "Hiberus",
                      callback: (){
                        context.push(NavigationRoutes.HIBERUS_SCREEN_ROUTE);
                      },
                    width: size.width / 2,
                    leftLabel: 0,
                    rightLabel: null,
                  )
              ),

              StaggeredGridTile.extent(
                  crossAxisCellCount: 1,
                  mainAxisExtent: size.height / 3,
                  child: HHTile(
                      imageBackground: "https://cdn.pixabay.com/photo/2023/10/28/18/02/songbird-8348139_1280.png",
                      labelSection: "Espacios",
                      callback: (){
                        context.push(NavigationRoutes.ZONES_SCREEN_ROUTE);
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
                    leftLabel: 0,
                    rightLabel: null,
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
                    width: size.width,
                    leftLabel: 0,
                    rightLabel: null,
                  )
              )

            ],
            */

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
              fit: BoxFit.cover,
            ),
            onTap: (){
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
