import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          Column(
            children: [
              Text(
                  "TEMARIO",
                  style: ConstantsApp.TittleApp
              ),
              
              Column(
                children: temario.map((e) {

                  return ExpandibleCard(
                    titleModule: e.tituloModulo,
                    listaCapitulos: e.listaCapitulo,
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

class ExpandibleCard extends StatefulWidget{
  ExpandibleCard({
    Key? key,
    required this.titleModule,
    required this.listaCapitulos,
    required this.nameTechnology,
    required this.imageTechnology
  }):super(key:key);

  String titleModule;
  List<Capitulo> listaCapitulos;
  String nameTechnology;
  String imageTechnology;

  @override
  State<ExpandibleCard> createState() => _ExpandibleCardState();
}

class _ExpandibleCardState extends State<ExpandibleCard> with TickerProviderStateMixin{

  late final AnimationController _controller;

  //animation que genera un valor dependiendo del tween aplicado
  late final Animation<double> _animation;

  //definimos valor de inicio y final de la animacion
  late final Tween<double> _sizeTween;

  // expansion state
  bool _isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150)
    );

    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn
    );

    _sizeTween = Tween(begin: 0, end: 1);
    super.initState();
  }

  void _expandOnChanged() {
    _isExpanded = !_isExpanded;
    _isExpanded ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      children: [
        HeaderCard(
            callback: _expandOnChanged,
          imageBackground: widget.imageTechnology,
          nameTechnology: widget.nameTechnology,
        ),
        ContentCard(
            sizeTween: _sizeTween,
            animation: _animation,
          titleModule: widget.titleModule,
          capitulos: widget.listaCapitulos,
        ),

      ],
    );
  }
}

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required Tween<double> sizeTween,
    required Animation<double> animation,
    required String titleModule,
    required List<Capitulo> capitulos,
  }) : _sizeTween = sizeTween, _animation = animation, titleModule = titleModule, _listaCapitulos = capitulos;

  final Tween<double> _sizeTween;
  final Animation<double> _animation;
  final String titleModule;
  final List<Capitulo> _listaCapitulos;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
              sizeFactor: _sizeTween.animate(_animation),
              child: AnimatedContainer(
                width: double.infinity,
                duration: const Duration(milliseconds: 150),

                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(titleModule,
                              style: ConstantsApp.TitleModule
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _listaCapitulos.map((chapter) {
                        return ChapterWidget(chapter: chapter);
                      }).toList(),
                    )
                  ]

                )
              ),
            );
  }
}

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({
    super.key,
    required this.chapter
  });

  final Capitulo chapter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chapter.texto,
                style: ConstantsApp.ChapterModule,),
              chapter.listaSubcapitulos == null
                  ? Container()
                  : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: chapter.listaSubcapitulos!.map((subchapter) {
                    return Subchapter(subchapter: subchapter);
                  }).toList()
              )
            ],
          )
        ),
      ],
    );
  }
}

class Subchapter extends StatelessWidget {
  const Subchapter({
    super.key,
    required this.subchapter
  });

  final Subcapitulo subchapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subchapter.text, style: ConstantsApp.SubchapterModule,),
          subchapter.listaEpisodios == null
          ? Container()
              : EpisodeWidget(episodeList: subchapter.listaEpisodios)
        ],
      )
    );
  }
}

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({
    super.key,
    required this.episodeList,
  });

  final List<Episodio>? episodeList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: episodeList!.map((episode) {
          return Text(episode.text, style: ConstantsApp.EpisodeModule);
        }).toList(),
      )
    );
  }

}


class HeaderCard extends StatelessWidget{
  const HeaderCard({
    Key? key,
    required this.callback,
    required this.nameTechnology,
    required this.imageBackground
  }):super(key:key);

  final VoidCallback callback;
  final String nameTechnology;
  final String imageBackground;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
              image: CachedNetworkImageProvider(
                imageBackground
              ),
            height: 240,
            fit: BoxFit.fitWidth,
            child: InkWell(
              onTap: callback
            ),
          ),

          Text(
            nameTechnology,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24
            ),
          )

        ],
      ),
    );
  }
}

class Filters{
  static final greyscale = ColorFilter.matrix(<double>[
    0.22126, 0.7152, 0.0722, 0, 0,
    0.22126, 0.7152, 0.0722, 0, 0,
    0.22126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0
  ]);
}

class Modulo{
  String tituloModulo;
  List<Capitulo> listaCapitulo;
  String nameTechnology;
  String imageTechnology;

  Modulo({
    required this.tituloModulo,
    required this.listaCapitulo,
    required this.nameTechnology,
    required this.imageTechnology
  });
}

List<Modulo> temario = [
  Modulo(
      tituloModulo: "Modulo 1 - Desarrollo para la plataforma Android",
      listaCapitulo:
      [
        Capitulo(
            texto: "1. Capitulo 1.1: Introducción al lenguaje de programación Kotlin",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Principales aspectos del lenguaje de programación Kotlin",
                  listaEpisodios: []
              )
            ]
        ),

        Capitulo(
            texto: "2. Capitulo 1.2: Entorno de desarrollo y anatomía de una aplicación Android",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Android Studio",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Recursos",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Actividades y Fragmentos",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Layouts",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "e. Manifest",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "f. Ciclo de vida",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "3. Capitulo 1.3: Diseño de interfaces mediante XML y navegación",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Componentes básicos de interfaz",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Conexión entre vistas y código",
                  listaEpisodios: [
                    Episodio(
                        text: "i. findViewById"
                    ),

                    Episodio(
                        text: "ii. View Binding"
                    ),
                  ]
              ),

              Subcapitulo(
                  text: "c. Navegación",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Mi primera aplicación Android",
                  listaEpisodios: []
              ),

            ]
        ),

        Capitulo(
            texto: "4. Capitulo 1.4: Conexión con API Rest",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. ¿Qué es una API Rest?",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Retrofit",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Autenticación",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Proyecto de ejemplo.",
                  listaEpisodios: []
              ),

            ]
        ),

        Capitulo(
            texto: "5. Capitulo 1.5: Concurrencia, reactividad y gestión de estados",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Contextos",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Flow",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. StateFlow",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. LiveData",
                  listaEpisodios: []
              ),

            ]
        ),

        Capitulo(
            texto: "6. Capitulo 1.6: Peristencia de datos",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. ¿Qué es la persistencia de datos?",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Shared Preferences",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Room",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "7. Capitulo 1.7: Arquitectura de una aplicación Android",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Importancia de una bunea arquitectura",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Clean Architecture",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. PAtrones de arquitectura: MVVM",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Navigation Graphs",
                  listaEpisodios: []
              ),

            ]
        ),

        Capitulo(
            texto: "8. Capitulo 1.8: Diseño de interfaces mediante Jetpack Compose",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Aspectos básicos de Jetpack Compose",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Interacción con el usuario",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Gestión de estados",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "9. Capitulo 1.9: Introducción a testing",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Importancia del testing en el desarrollo",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Testing unitario mediante Junit",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "10. Capitulo 1.10: Proyecto final Android",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Desarrollo de proyecto final por el alumno en el que ponga en práctica todos los conocimientos aprendidos",
                  listaEpisodios: []
              ),
            ]
        ),

        ],
    nameTechnology: "Android",
    imageTechnology: "https://cdn.pixabay.com/photo/2016/12/13/18/53/android-1904852_1280.jpg"
  ),

  Modulo(
      tituloModulo: "Modulo 2 - Desarrollo para la plataforma iOS",
      listaCapitulo:
      [
        Capitulo(
            texto: "1. Capitulo 1.1: Introducción al lenguaje de programación Swift",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Principales aspectos del lenguaje de programación Swift",
                  listaEpisodios: []
              )
            ]
        ),

        Capitulo(
            texto: "2. Capitulo 1.2: Entorno de desarrollo y anatomía de una apliacion iOS en UIKit",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. XCode",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Estructura de proyecto",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. ViewController y ciclo de vida",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Vistas y AutoLayout",
                  listaEpisodios: [
                    Episodio(
                        text: "i. StackView"
                    ),

                    Episodio(
                        text: "ii. Button"
                    ),

                    Episodio(
                        text: "iii. TextField"
                    ),

                    Episodio(
                        text: "iv. ScrollView"
                    ),

                    Episodio(
                        text: "v. TableView y CollectionView"
                    ),
                  ]
              ),

              Subcapitulo(
                  text: "e. Navegación",
                  listaEpisodios: []
              ),


            ]
        ),

        Capitulo(
            texto: "3. Capitulo 1.3: Anatomía de una aplicación iOS en SwiftUI",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Estructura de proyecto",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Vistas y estilos",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Ciclo de vida",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. List y VStack",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "e. Preview",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "f. Navegación",
                  listaEpisodios: []
              )
            ]
        ),

        Capitulo(
            texto: "4. Capitulo 1.4: Consumo de datos, concurrenciay gestión de estados",
            listaSubcapitulos: [

              Subcapitulo(
                  text: "a. Consumo de API Rest",
                  listaEpisodios: [
                    Episodio(
                        text: "i. URLSession"
                    ),

                    Episodio(
                        text: "ii. Codable"
                    ),

                    Episodio(
                        text: "iii. Throw"
                    ),

                    Episodio(
                        text: "iv. Async y Await"
                    ),

                    Episodio(
                        text: "v. TableView y Combine"
                    ),

                    Episodio(
                        text: "vi. Closure y Result"
                    ),
                  ]
              ),

              Subcapitulo(
                  text: "b. Concurrencia y reactividad",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Gestión de estados",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Consumo de datos en local",
                  listaEpisodios: [
                    Episodio(
                        text: "i. UserDefaults"
                    ),

                    Episodio(
                        text: "ii. KeyChain"
                    ),

                    Episodio(
                        text: "iii. Core Data"
                    ),
                  ]
              ),
            ]
        ),

        Capitulo(
            texto: "5. Capitulo 1.5: Arquitectura de una aplicación iOS",
            listaSubcapitulos: []
        ),

        Capitulo(
            texto: "6. Capitulo 1.6: Introducción a testing",
            listaSubcapitulos: [

              Subcapitulo(
                  text: "a. Testing unitario en iOS",
                  listaEpisodios: []
              ),

            ]
        ),

        Capitulo(
            texto: "7. Capitulo 1.7: Proyecto final iOS",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Desarrollo de proyecto final por el alumno en el que ponga en práctica todos los conocimientos aprendidos",
                  listaEpisodios: []
              ),

            ]
        ),

      ],
    nameTechnology: "iOS",
    imageTechnology: "https://cdn.pixabay.com/photo/2022/09/18/18/40/apple-logo-7463795_1280.png"
  ),

  Modulo(
      tituloModulo: "Modulo 3 - Desarrollo multiplataforma en Flutter",
      listaCapitulo: [
        Capitulo(
            texto: "1. Capitulo 1.1: Introducción al lenguaje de programación Dart.",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Principales aspectos del lenguaje de programación Dart",
                  listaEpisodios: []
              )
            ]
        ),

        Capitulo(
            texto: "2. Capitulo 1.2: Entorno de desarrollo y anatomia de una aplicación Flutter",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Android Studio y Visual Studio Code",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Estructura de proyecto",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Recursos",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Localización",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "e. Librerías",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "3. Capitulo 1.3: Diseño de interfaces: Widgets y componentes",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Componentes básicos de interfaz",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Tipos de Widget",
                  listaEpisodios: [
                    Episodio(text: "i. Stateful"),
                    Episodio(text: "ii. Stateless"),
                  ]
              ),

              Subcapitulo(
                  text: "c. Desarrollo basado en componentes",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Mi primera aplicación Android",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "4. Capitulo 1.4: Navegación",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Navigator",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Tipos de GO Router",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "5. Capitulo 1.5: Conexión con API Rest",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Dio",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Autenticación",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Interceptores",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. Proyecto de ejemplo",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "6. Capitulo 1.6: Concurrencia y gestión de estados",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Async y Await",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. Future",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "c. Streams",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "d. setState",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "7. Capitulo 1.7: Persistencia de datos",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Shared Preferences",
                  listaEpisodios: []
              ),

              Subcapitulo(
                  text: "b. SQFlite",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "8. Capitulo 1.8: Arquitectura de una aplicación Flutter",
            listaSubcapitulos: []
        ),

        Capitulo(
            texto: "9. Capitulo 1.9: Introducción a testing",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Testing unitario en Flutter",
                  listaEpisodios: []
              ),
            ]
        ),

        Capitulo(
            texto: "10. Capitulo 1.10: Proyecto final Flutter",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Desarrollo de proyecto final por el alumno en el que ponga en práctica todos los conocimientos aprendidos",
                  listaEpisodios: []
              ),
            ]
        ),
      ],
      nameTechnology: "",
      imageTechnology: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1920px-Google-flutter-logo.svg.png"
  )

];

class Capitulo{
  String texto;
  List<Subcapitulo>? listaSubcapitulos;

  Capitulo({
    required this.texto,
    required this.listaSubcapitulos
  });
}

class Subcapitulo{
  Subcapitulo({
    required this.text,
    required this.listaEpisodios
  });

  String text;
  List<Episodio>? listaEpisodios;
}

class Episodio{
  Episodio({
    required this.text
  });

  String text;
}

class Item{
  Item({
    required this.headerText,
    required this.expandedText,
    this.isExpanded = false
  });

  String headerText;
  String expandedText;
  bool isExpanded;
}