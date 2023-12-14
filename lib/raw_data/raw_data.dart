import 'dart:ui';

import 'package:hiberus_university/models/program/capitulo.dart';
import 'package:hiberus_university/models/program/episodio.dart';
import 'package:hiberus_university/models/program/modulo.dart';
import 'package:hiberus_university/models/program/subcapitulo.dart';
import 'package:hiberus_university/presentation/navigation/navigation_routes.dart';

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
