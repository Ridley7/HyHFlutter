
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                        print("Hiberus");
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
                        print("Hola desde espacio");
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
                        print("Click profesores");
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
                        print("Horarios");
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
                        print("Hola desde programa");
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
          GestureDetector(
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
/*
class InteractiveTile extends StatefulWidget {
  const InteractiveTile({
    Key? key,
    required this.index,
    this.extent,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;

  @override
  _InteractiveTileState createState() => _InteractiveTileState();
}

class _InteractiveTileState extends State<InteractiveTile> {
  Color color = _defaultColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (color == _defaultColor) {
            color = Colors.red;
          } else {
            color = _defaultColor;
          }
        });
      },
      child: Tile(
        index: widget.index,
        extent: widget.extent,
        backgroundColor: color,
        bottomSpace: widget.bottomSpace,
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  final int index;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      //'https://picsum.photos/$width/$height?random=$index',
      //"https://cdn.pixabay.com/photo/2022/05/12/12/55/sunset-7191546_960_720.jpg",
      "https://cdn.pixabay.com/photo/2022/02/17/04/54/animal-7017939_960_720.jpg",
      width: width.toDouble(),
      height: height.toDouble(),
      fit: BoxFit.cover,
    );
  }
}

const _defaultColor = Color(0xFF34568B);

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? _defaultColor,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
*/