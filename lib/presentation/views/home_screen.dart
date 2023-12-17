
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';
import 'package:hiberus_university/widgets/home_screen/menu_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ConstantsApp.BlueHiberusDark,
      body: SafeArea(
          child: StaggeredGrid.count(
              crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 3,
            children: menu.map((item) {
              return StaggeredGridTile.extent(
                  crossAxisCellCount: item.amountCells,
                  mainAxisExtent: size.height / 3,
                  child: MenuTile(
                    imageBackground: item.imageBackground,
                    labelSection: item.labelSection,
                    callback: (){
                      context.go(item.route);
                    },
                    width: item.allWidth ? size.width : size.width / 2,
                    leftLabel: item.positionLeftLabel,
                    rightLabel: item.positionRightLabel,
                  )
              );
            }).toList()
          )
      ),
    );
  }
}

