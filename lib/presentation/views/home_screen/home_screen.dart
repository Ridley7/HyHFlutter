
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hiberus_university/di/app_modules.dart';
import 'package:hiberus_university/models/home_screen/item_menu.dart';
import 'package:hiberus_university/presentation/constants/constants_app.dart';
import 'package:hiberus_university/presentation/model/resource_state.dart';
import 'package:hiberus_university/presentation/views/home_screen/viewmodel/home_view_model.dart';
import 'package:hiberus_university/presentation/widgets/commons/error_view.dart';
import 'package:hiberus_university/presentation/widgets/commons/loading_view.dart';
import 'package:hiberus_university/presentation/widgets/home_screen/menu_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeViewModel _homeViewModel = inject<HomeViewModel>();
  List<ItemMenu> menu = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _homeViewModel.getMainMenuState.stream.listen((state) {
      switch(state.status){

        case Status.LOADING:
        LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          setState(() {
            menu = state.data!;
          });
          break;
        case Status.ERROR:
            LoadingView.hide();
            ErrorView.show(context, state.exception!.toString(), (){
              _homeViewModel.fetchMainMenu();
            });
          break;
      }
    });

    _homeViewModel.fetchMainMenu();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _homeViewModel.dispose();
  }

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
                      context.push(item.route);
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

