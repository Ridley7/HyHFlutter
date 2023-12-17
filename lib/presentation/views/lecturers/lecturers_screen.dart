
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';
import 'package:hiberus_university/widgets/instructors/instructor_widget.dart';

class LecturersScreen extends StatelessWidget {
  const LecturersScreen({super.key});

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









































