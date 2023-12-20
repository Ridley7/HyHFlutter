
import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/di/app_modules.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';
import 'package:hiberus_university/presentation/model/resource_state.dart';
import 'package:hiberus_university/presentation/views/lecturers_screen/viewmodel/LecturersViewModel.dart';
import 'package:hiberus_university/widgets/commons/error_view.dart';
import 'package:hiberus_university/widgets/commons/loading_view.dart';
import 'package:hiberus_university/widgets/instructors/instructor_widget.dart';

class LecturersScreen extends StatefulWidget {
  const LecturersScreen({super.key});

  @override
  State<LecturersScreen> createState() => _LecturersScreenState();
}

class _LecturersScreenState extends State<LecturersScreen> {

  final LecturersViewModel _lecturersViewModel = inject<LecturersViewModel>();
  List<Instructor> listaInstructores = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _lecturersViewModel.getLecturersState.stream.listen((state) {
      switch(state.status){

        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          setState(() {
            listaInstructores = state.data!;
          });
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), (){
            _lecturersViewModel.fetchLecturers();
          });
          break;
      }
    });

    _lecturersViewModel.fetchLecturers();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _lecturersViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Text(
              StringsApp.INSTRUCTORES,
              style: ConstantsApp.TittleApp
            ),

            Flexible(
              child: GridView.count(
                childAspectRatio: 0.7,
                  crossAxisCount: 2,

                children: listaInstructores.map((instructor)  {
                  return InstructorWidget(instructor: instructor);
                }).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}









































