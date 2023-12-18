import 'dart:ui';

import 'package:hiberus_university/models/instructors_screen/Instructor.dart';
import 'package:hiberus_university/models/instructors_screen/tech.dart';
import 'package:hiberus_university/models/schedule_screen/event.dart';
import 'package:hiberus_university/models/schedule_screen/info_day.dart';
import 'package:hiberus_university/models/schedule_screen/workday_status.dart';
import 'package:hiberus_university/models/zone_screen/zone.dart';
import 'package:hiberus_university/models/program_screen/capitulo.dart';
import 'package:hiberus_university/models/program_screen/episodio.dart';
import 'package:hiberus_university/models/program_screen/modulo.dart';
import 'package:hiberus_university/models/program_screen/subcapitulo.dart';
import 'package:hiberus_university/presentation/navigation/navigation_routes.dart';
Map<DateTime, InfoDay> events = {
  DateTime(2023, 9, 4): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 5): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 6): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 7): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 11): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 12): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 13): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 14): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 18): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 19): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 20): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 21): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 25): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 26): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 9, 27): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de RECIBI MATERIAL")]),
  DateTime(2023, 9, 28): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 2): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de propuesta para el Proyecto Final")]),
  DateTime(2023, 10, 3): InfoDay(WorkdayStatus.workday, [Event("Prueba Intermedia")]),
  DateTime(2023, 10, 4): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 5): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 9): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 10): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 11): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 12): InfoDay(WorkdayStatus.holiday, []),
  DateTime(2023, 10, 16): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 17): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 18): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 19): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 23): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 24): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 25): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 26): InfoDay(WorkdayStatus.workday, [Event("Examen Final")]),
  DateTime(2023, 10, 30): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 10, 31): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 1): InfoDay(WorkdayStatus.holiday, []),
  DateTime(2023, 11, 2): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 6): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 7): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 8): InfoDay(WorkdayStatus.workday, [Event("Examen Intermedio")]),
  DateTime(2023, 11, 9): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 13): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 14): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 15): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 16): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 17): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 20): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 21): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 22): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 23): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 27): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 28): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 29): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 11, 30): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de RECIBI MATERIAL")]),
  DateTime(2023, 12, 4): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 12, 5): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de propuesta de Proyecto Final"), Event("Se abre Examen Final"),]),
  DateTime(2023, 12, 6): InfoDay(WorkdayStatus.holiday, []),
  DateTime(2023, 12, 7): InfoDay(WorkdayStatus.holiday, []),
  DateTime(2023, 12, 8): InfoDay(WorkdayStatus.holiday, []),

  DateTime(2023, 12, 11): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 12, 12): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 12, 13): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 12, 14): InfoDay(WorkdayStatus.workday, []),

  DateTime(2023, 12, 18): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 12, 19): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 12, 20): InfoDay(WorkdayStatus.workday, []),
  DateTime(2023, 12, 21): InfoDay(WorkdayStatus.workday, []),

  DateTime(2023, 12, 25): InfoDay(WorkdayStatus.holiday, []),
};


//Datos para la pantalla de instructores
List<Instructor> listaInstructores = [
  Instructor(
      id: 0,
      name: "Marcos Calvo García",
      urlImage: "https://media.istockphoto.com/id/1388253782/es/foto/positivo-exitoso-hombre-de-negocios-profesional-de-negocios-del-milenio-retrato-de-la-cabeza.jpg?s=612x612&w=0&k=20&c=gDMgYu50FUOTQhCZwYM6deYTzHvKkKAK9e945a21hZ8=",
      bio: "Biografia del instructor",
      firstTechnology: Tech.android,
      secondTechnology: Tech.ios,
      thirdTechnology: Tech.flutter,
      jobTitle: "Tech Lead Hiberus",
      urlGithub: "",
      urlLinkedin: "",
      urlTwitter: ""
  ),

  Instructor(
      id: 1,
      name: "Alberto Navas Alba",
      urlImage: "https://media.istockphoto.com/id/1476170969/es/foto/retrato-de-un-joven-listo-para-el-trabajo-concepto-de-negocio.jpg?s=612x612&w=0&k=20&c=AAuUZOmmNYo6hzDYNR7d88Ihnxo4jrypqVJa-B8vjys=",
      bio: "Biografia del instructor",
      firstTechnology: Tech.android,
      secondTechnology: null,
      thirdTechnology: null,
      jobTitle: "Tech Lead Hiberus",
      urlGithub: "Desarrollador de Software Senior",
      urlLinkedin: "",
      urlTwitter: ""
  ),

  Instructor(
      id: 2,
      name: "Javier Torne Hernández",
      urlImage: "https://media.istockphoto.com/id/1307791650/es/foto/retrato-a-la-cabeza-del-sonriente-empresario-cauc%C3%A1sico-posa-en-el-lugar-de-trabajo.jpg?s=612x612&w=0&k=20&c=h7JT5UHiPf_S7JBLq6tG5os21j6tn_pxYSjzzuRXpjg=",
      bio: "Biografia del instructor",
      firstTechnology: Tech.ios,
      secondTechnology: null,
      thirdTechnology: null,
      jobTitle: "iOS Tech Lead",
      urlGithub: "",
      urlLinkedin: "",
      urlTwitter: ""
  ),

  Instructor(
      id: 3,
      name: "Javier Cobos Escalante",
      urlImage: "https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_1280.jpg",
      bio: "Biografia del instructor",
      firstTechnology: Tech.ios,
      secondTechnology: null,
      thirdTechnology: null,
      jobTitle: "iOS Tech Lead",
      urlGithub: "",
      urlLinkedin: "",
      urlTwitter: ""
  ),

  Instructor(
      id: 4,
      name: "Alejandro Giménez Garulo",
      urlImage: "https://media.istockphoto.com/id/1398338985/es/foto/cabeza-de-un-hombre-con-el-cabello-te%C3%B1ido-de-azul-sonriendo-en-el-interior.jpg?s=612x612&w=0&k=20&c=QUl332WLxJIubp9oOVMoQk6CO3QjL-RMohFTgmHfJeI=",
      bio: "Biografia del instructor",
      firstTechnology: Tech.scrum,
      secondTechnology: null,
      thirdTechnology: null,
      jobTitle: "Lecturer / Trainer Gráfico",
      urlGithub: "",
      urlLinkedin: "",
      urlTwitter: ""
  ),

  Instructor(
      id: 5,
      name: "Daniel Chueca",
      urlImage: "https://media.istockphoto.com/id/517614873/es/foto/modelo-masculino-en-el-estudio.jpg?s=612x612&w=0&k=20&c=mDVaZjvVSpUGsVSLCQTbu7NtObVkgTsHjntlnddH1wY=",
      bio: "Biografia del instructor",
      firstTechnology: Tech.flutter,
      secondTechnology: null,
      thirdTechnology: null,
      jobTitle: "Flutter Developer",
      urlGithub: "",
      urlLinkedin: "",
      urlTwitter: ""
  ),
];

//Datos para la pantalla de zonas
Map<int, Zone> zones = {
  0: Zone(
      id: 0,
      name: "Sala 1",
      description: "Espacio 1",
      spots: 2,
      schedule: "9 AM - 5 PM",
      cornerTopLeft: Offset(46, 33),
      cornerBottomRight: Offset(167, 184),
      tapped: false,
      selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
      unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  1: Zone(
      id: 1,
      name: "Sala 2",
      description: "Espacio 2",
      spots: 5,
      schedule: "10 AM - 5 PM",
      cornerTopLeft: Offset(167, 33),
      cornerBottomRight: Offset(238, 184),
      tapped: false,
      selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
      unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  2: Zone(
      id: 2,
      name: "Sala 3",
      description: "Espacio 3",
      spots: 5,
      schedule: "11 AM - 6 PM",
      cornerTopLeft: Offset(238, 33),
      cornerBottomRight: Offset(309, 184),
      tapped: false,
      selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
      unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  3: Zone(
      id: 3,
      name: "Sala 4",
      description: "Espacio 4",
      spots: 5,
      schedule: "11 AM - 6 PM",
      cornerTopLeft: Offset(309, 33),
      tapped: false,
      cornerBottomRight: Offset(380, 184),
      selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
      unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  4: Zone(
      id: 4,
      name: "Sala 5",
      description: "Espacio 5",
      spots: 5,
      schedule: "11 AM - 6 PM",
      cornerTopLeft: Offset(46, 244),
      cornerBottomRight: Offset(167, 368),
      tapped: false,
      selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
      unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  5: Zone(
      id: 5,
      name: "Sala 6",
      description: "Espacio 6",
      spots: 5,
      schedule: "11 AM - 6 PM",
      cornerTopLeft: Offset(167, 244),
      cornerBottomRight: Offset(238, 368),
      tapped: false,
      selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
      unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
  6: Zone(
      id: 6,
      name: "Sala 7",
      description: "Espacio 7",
      spots: 5,
      schedule: "11 AM - 6 PM",
      cornerTopLeft: Offset(238, 244),
      cornerBottomRight: Offset(304, 368),
      tapped: false,
      selectedColor: Color.fromRGBO(50, 200, 50, 0.5),
      unselectedColor: Color.fromRGBO(50, 50, 200, 0.5)),
};

List<InfoGraphic> infografia = [
  InfoGraphic(
      routeAsset: "assets/images/alumnos.png",
      description: "Más de 1285 alumnos y alumnas en 2022"
  ),

  InfoGraphic(
      routeAsset: "assets/images/contratacion.png",
      description: "80% de contratación de alumnos"
  ),

  InfoGraphic(
      routeAsset: "assets/images/formacion.png",
      description: "Formación intensiva y especifica"
  ),

  InfoGraphic(
      routeAsset: "assets/images/tecnologias.png",
      description: "Tecnologías punteras en el mercado"
  ),

];

class InfoGraphic {
  String routeAsset;
  String description;

  InfoGraphic({
    required this.routeAsset,
    required this.description,
  });

}


List<ItemMenu> menu = [
  ItemMenu(
      imageBackground: "https://www.hiberus.com/themes/custom/hiwc_static/styling/base/assets/imagen-responsive-web.jpg",
      labelSection: "Hiberus",
      route: NavigationRoutes.HIBERUS_SCREEN_ROUTE,
      amountCells: 1,
    positionRightLabel: null,
    positionLeftLabel: 0,
    allWidth: false,
  ),

  ItemMenu(
      imageBackground: "https://cdn.pixabay.com/photo/2017/08/06/01/49/table-2587598_1280.jpg",
      labelSection: "Espacios",
      route: NavigationRoutes.ZONES_SCREEN_ROUTE,
      amountCells: 1,
    positionRightLabel: 0,
    positionLeftLabel: null,
    allWidth: false,
  ),

  ItemMenu(
      imageBackground: "https://cdn.pixabay.com/photo/2020/03/25/11/44/beginning-4967000_1280.jpg",
      labelSection: "Profesores",
      route: NavigationRoutes.LECTURES_SCREEN_ROUTE,
      amountCells: 1,
    positionRightLabel: null,
    positionLeftLabel: 0,
    allWidth: false,
  ),

  ItemMenu(
      imageBackground: "https://cdn.pixabay.com/photo/2015/05/31/11/27/woman-791185_1280.jpg",
      labelSection: "Horarios",
      route: NavigationRoutes.SCHEDULE_SCREEN_ROUTE,
      amountCells: 1,
    positionRightLabel: 0,
    positionLeftLabel: null,
    allWidth: false,
  ),

  ItemMenu(
      imageBackground: "https://cdn.pixabay.com/photo/2016/08/17/04/41/template-1599665_1280.png",
      labelSection: "Programa",
      route: NavigationRoutes.PROGRAM_SCREEN_ROUTE,
      amountCells: 2,
    positionRightLabel: null,
    positionLeftLabel: 0,
    allWidth: true,
  ),
];

class ItemMenu {
  String imageBackground;
  String labelSection;
  String route;
  int amountCells;
  double? positionRightLabel;
  double? positionLeftLabel;
  bool allWidth;

  ItemMenu({
    required this.imageBackground,
    required this.labelSection,
    required this.route,
    required this.amountCells,
    required this.positionRightLabel,
    required this.positionLeftLabel,
    required this.allWidth
  });

}

List<Modulo> temario = [
  Modulo(
      tituloModulo: "Modulo 1 - Desarrollo para la plataforma Android",
      listaCapitulo: [
        Capitulo(
            texto:
            "1. Capitulo 1.1: Introducción al lenguaje de programación Kotlin",
            listaSubcapitulos: [
              Subcapitulo(
                  text:
                  "a. Principales aspectos del lenguaje de programación Kotlin",
                  listaEpisodios: [])
            ]),
        Capitulo(
            texto:
            "2. Capitulo 1.2: Entorno de desarrollo y anatomía de una aplicación Android",
            listaSubcapitulos: [
              Subcapitulo(text: "a. Android Studio", listaEpisodios: []),
              Subcapitulo(text: "b. Recursos", listaEpisodios: []),
              Subcapitulo(
                  text: "c. Actividades y Fragmentos", listaEpisodios: []),
              Subcapitulo(text: "d. Layouts", listaEpisodios: []),
              Subcapitulo(text: "e. Manifest", listaEpisodios: []),
              Subcapitulo(text: "f. Ciclo de vida", listaEpisodios: []),
            ]),
        Capitulo(
            texto:
            "3. Capitulo 1.3: Diseño de interfaces mediante XML y navegación",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Componentes básicos de interfaz",
                  listaEpisodios: []),
              Subcapitulo(
                  text: "b. Conexión entre vistas y código",
                  listaEpisodios: [
                    Episodio(text: "i. findViewById"),
                    Episodio(text: "ii. View Binding"),
                  ]),
              Subcapitulo(text: "c. Navegación", listaEpisodios: []),
              Subcapitulo(
                  text: "d. Mi primera aplicación Android", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "4. Capitulo 1.4: Conexión con API Rest",
            listaSubcapitulos: [
              Subcapitulo(text: "a. ¿Qué es una API Rest?", listaEpisodios: []),
              Subcapitulo(text: "b. Retrofit", listaEpisodios: []),
              Subcapitulo(text: "c. Autenticación", listaEpisodios: []),
              Subcapitulo(text: "d. Proyecto de ejemplo.", listaEpisodios: []),
            ]),
        Capitulo(
            texto:
            "5. Capitulo 1.5: Concurrencia, reactividad y gestión de estados",
            listaSubcapitulos: [
              Subcapitulo(text: "a. Contextos", listaEpisodios: []),
              Subcapitulo(text: "b. Flow", listaEpisodios: []),
              Subcapitulo(text: "c. StateFlow", listaEpisodios: []),
              Subcapitulo(text: "d. LiveData", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "6. Capitulo 1.6: Peristencia de datos",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. ¿Qué es la persistencia de datos?",
                  listaEpisodios: []),
              Subcapitulo(text: "b. Shared Preferences", listaEpisodios: []),
              Subcapitulo(text: "c. Room", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "7. Capitulo 1.7: Arquitectura de una aplicación Android",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Importancia de una bunea arquitectura",
                  listaEpisodios: []),
              Subcapitulo(text: "b. Clean Architecture", listaEpisodios: []),
              Subcapitulo(
                  text: "c. PAtrones de arquitectura: MVVM",
                  listaEpisodios: []),
              Subcapitulo(text: "d. Navigation Graphs", listaEpisodios: []),
            ]),
        Capitulo(
            texto:
            "8. Capitulo 1.8: Diseño de interfaces mediante Jetpack Compose",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Aspectos básicos de Jetpack Compose",
                  listaEpisodios: []),
              Subcapitulo(
                  text: "b. Interacción con el usuario", listaEpisodios: []),
              Subcapitulo(text: "c. Gestión de estados", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "9. Capitulo 1.9: Introducción a testing",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Importancia del testing en el desarrollo",
                  listaEpisodios: []),
              Subcapitulo(
                  text: "b. Testing unitario mediante Junit",
                  listaEpisodios: []),
            ]),
        Capitulo(
            texto: "10. Capitulo 1.10: Proyecto final Android",
            listaSubcapitulos: [
              Subcapitulo(
                  text:
                  "a. Desarrollo de proyecto final por el alumno en el que ponga en práctica todos los conocimientos aprendidos",
                  listaEpisodios: []),
            ]),
      ],
      nameTechnology: "Android",
      imageTechnology:
      "https://cdn.pixabay.com/photo/2016/12/13/18/53/android-1904852_1280.jpg"),
  Modulo(
      tituloModulo: "Modulo 2 - Desarrollo para la plataforma iOS",
      listaCapitulo: [
        Capitulo(
            texto:
            "1. Capitulo 1.1: Introducción al lenguaje de programación Swift",
            listaSubcapitulos: [
              Subcapitulo(
                  text:
                  "a. Principales aspectos del lenguaje de programación Swift",
                  listaEpisodios: [])
            ]),
        Capitulo(
            texto:
            "2. Capitulo 1.2: Entorno de desarrollo y anatomía de una apliacion iOS en UIKit",
            listaSubcapitulos: [
              Subcapitulo(text: "a. XCode", listaEpisodios: []),
              Subcapitulo(
                  text: "b. Estructura de proyecto", listaEpisodios: []),
              Subcapitulo(
                  text: "c. ViewController y ciclo de vida",
                  listaEpisodios: []),
              Subcapitulo(text: "d. Vistas y AutoLayout", listaEpisodios: [
                Episodio(text: "i. StackView"),
                Episodio(text: "ii. Button"),
                Episodio(text: "iii. TextField"),
                Episodio(text: "iv. ScrollView"),
                Episodio(text: "v. TableView y CollectionView"),
              ]),
              Subcapitulo(text: "e. Navegación", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "3. Capitulo 1.3: Anatomía de una aplicación iOS en SwiftUI",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Estructura de proyecto", listaEpisodios: []),
              Subcapitulo(text: "b. Vistas y estilos", listaEpisodios: []),
              Subcapitulo(text: "c. Ciclo de vida", listaEpisodios: []),
              Subcapitulo(text: "d. List y VStack", listaEpisodios: []),
              Subcapitulo(text: "e. Preview", listaEpisodios: []),
              Subcapitulo(text: "f. Navegación", listaEpisodios: [])
            ]),
        Capitulo(
            texto:
            "4. Capitulo 1.4: Consumo de datos, concurrenciay gestión de estados",
            listaSubcapitulos: [
              Subcapitulo(text: "a. Consumo de API Rest", listaEpisodios: [
                Episodio(text: "i. URLSession"),
                Episodio(text: "ii. Codable"),
                Episodio(text: "iii. Throw"),
                Episodio(text: "iv. Async y Await"),
                Episodio(text: "v. TableView y Combine"),
                Episodio(text: "vi. Closure y Result"),
              ]),
              Subcapitulo(
                  text: "b. Concurrencia y reactividad", listaEpisodios: []),
              Subcapitulo(text: "c. Gestión de estados", listaEpisodios: []),
              Subcapitulo(
                  text: "d. Consumo de datos en local",
                  listaEpisodios: [
                    Episodio(text: "i. UserDefaults"),
                    Episodio(text: "ii. KeyChain"),
                    Episodio(text: "iii. Core Data"),
                  ]),
            ]),
        Capitulo(
            texto: "5. Capitulo 1.5: Arquitectura de una aplicación iOS",
            listaSubcapitulos: []),
        Capitulo(
            texto: "6. Capitulo 1.6: Introducción a testing",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Testing unitario en iOS", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "7. Capitulo 1.7: Proyecto final iOS",
            listaSubcapitulos: [
              Subcapitulo(
                  text:
                  "a. Desarrollo de proyecto final por el alumno en el que ponga en práctica todos los conocimientos aprendidos",
                  listaEpisodios: []),
            ]),
      ],
      nameTechnology: "iOS",
      imageTechnology:
      "https://cdn.pixabay.com/photo/2022/09/18/18/40/apple-logo-7463795_1280.png"),
  Modulo(
      tituloModulo: "Modulo 3 - Desarrollo multiplataforma en Flutter",
      listaCapitulo: [
        Capitulo(
            texto:
            "1. Capitulo 1.1: Introducción al lenguaje de programación Dart.",
            listaSubcapitulos: [
              Subcapitulo(
                  text:
                  "a. Principales aspectos del lenguaje de programación Dart",
                  listaEpisodios: [])
            ]),
        Capitulo(
            texto:
            "2. Capitulo 1.2: Entorno de desarrollo y anatomia de una aplicación Flutter",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Android Studio y Visual Studio Code",
                  listaEpisodios: []),
              Subcapitulo(
                  text: "b. Estructura de proyecto", listaEpisodios: []),
              Subcapitulo(text: "c. Recursos", listaEpisodios: []),
              Subcapitulo(text: "d. Localización", listaEpisodios: []),
              Subcapitulo(text: "e. Librerías", listaEpisodios: []),
            ]),
        Capitulo(
            texto:
            "3. Capitulo 1.3: Diseño de interfaces: Widgets y componentes",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Componentes básicos de interfaz",
                  listaEpisodios: []),
              Subcapitulo(text: "b. Tipos de Widget", listaEpisodios: [
                Episodio(text: "i. Stateful"),
                Episodio(text: "ii. Stateless"),
              ]),
              Subcapitulo(
                  text: "c. Desarrollo basado en componentes",
                  listaEpisodios: []),
              Subcapitulo(
                  text: "d. Mi primera aplicación Android", listaEpisodios: []),
            ]),
        Capitulo(texto: "4. Capitulo 1.4: Navegación", listaSubcapitulos: [
          Subcapitulo(text: "a. Navigator", listaEpisodios: []),
          Subcapitulo(text: "b. Tipos de GO Router", listaEpisodios: []),
        ]),
        Capitulo(
            texto: "5. Capitulo 1.5: Conexión con API Rest",
            listaSubcapitulos: [
              Subcapitulo(text: "a. Dio", listaEpisodios: []),
              Subcapitulo(text: "b. Autenticación", listaEpisodios: []),
              Subcapitulo(text: "c. Interceptores", listaEpisodios: []),
              Subcapitulo(text: "d. Proyecto de ejemplo", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "6. Capitulo 1.6: Concurrencia y gestión de estados",
            listaSubcapitulos: [
              Subcapitulo(text: "a. Async y Await", listaEpisodios: []),
              Subcapitulo(text: "b. Future", listaEpisodios: []),
              Subcapitulo(text: "c. Streams", listaEpisodios: []),
              Subcapitulo(text: "d. setState", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "7. Capitulo 1.7: Persistencia de datos",
            listaSubcapitulos: [
              Subcapitulo(text: "a. Shared Preferences", listaEpisodios: []),
              Subcapitulo(text: "b. SQFlite", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "8. Capitulo 1.8: Arquitectura de una aplicación Flutter",
            listaSubcapitulos: []),
        Capitulo(
            texto: "9. Capitulo 1.9: Introducción a testing",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Testing unitario en Flutter", listaEpisodios: []),
            ]),
        Capitulo(
            texto: "10. Capitulo 1.10: Proyecto final Flutter",
            listaSubcapitulos: [
              Subcapitulo(
                  text:
                  "a. Desarrollo de proyecto final por el alumno en el que ponga en práctica todos los conocimientos aprendidos",
                  listaEpisodios: []),
            ]),
      ],
      nameTechnology: "",
      imageTechnology:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1920px-Google-flutter-logo.svg.png")
];

