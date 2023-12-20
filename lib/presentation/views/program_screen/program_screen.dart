import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/di/app_modules.dart';
import 'package:hiberus_university/models/program_screen/modulo.dart';
import 'package:hiberus_university/presentation/model/resource_state.dart';
import 'package:hiberus_university/presentation/views/program_screen/viewmodel/program_view_model.dart';
import 'package:hiberus_university/presentation/widgets/commons/error_view.dart';
import 'package:hiberus_university/presentation/widgets/commons/loading_view.dart';
import 'package:hiberus_university/presentation/widgets/program_screen/expandible_card/expandible_card.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {

  final ProgramViewModel _programViewModel = inject<ProgramViewModel>();
  List<Modulo> temario = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _programViewModel.getTopicsState.stream.listen((state) {
      switch(state.status){

        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          setState(() {
            temario = state.data!;
          });
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), (){
            _programViewModel.fetchTopics();
          });
          break;
      }
    });

    _programViewModel.fetchTopics();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _programViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(StringsApp.TEMARIO, style: ConstantsApp.TittleApp),
              Column(
                children: temario.map((e) {
                  return ExpandibleCard(
                    titleModule: e.tituloModulo,
                    listChapters: e.listaCapitulo,
                    nameTechnology: e.nameTechnology,
                    imageTechnology: e.imageTechnology,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
