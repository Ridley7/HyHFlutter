import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
            children: temario.map((e) {

              return ExpandibleCard(
                titleModule: e.tituloModulo,
                listaCapitulos: e.listaCapitulo,
                nameTechnology: e.nameTechnology,
                imageTechnology: e.imageTechnology,
              );
            }).toList(),

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
                color: Colors.amber,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(titleModule)
                      ],
                    ),

                    Column(
                      children: _listaCapitulos.map((e) {
                        return Column(
                          children: [
                            Column(
                              children: [
                                Text(e.texto),
                                e.listaSubcapitulos == null
                                    ? Container()
                                    : Column(
                                  children:
                                    e.listaSubcapitulos!.map((subcapitulo) {
                                      return Column(
                                        children: [
                                          Text(subcapitulo.text),
                                          subcapitulo.listaEpisodios == null
                                          ? Container() :
                                              Column(
                                                children: subcapitulo.listaEpisodios!.map((episode) {
                                                  return Text(episode.text);
                                                }).toList(),
                                              )
                                        ],
                                      );
                                    }).toList()

                                )
                              ],
                            )
                          ],
                        );
                      }).toList(),
                    )
                  ]

                      /*
                  [
                    TitleModule(title: "Modulo 1 - Desarrollo para la plataforma Android"),
                    TitleChapter(text: "1.\t Capítulo 1.1: Introducción al lenguajo de programación Kotlin.",),
                    TitleSubchapter(text: "a.\t Principales aspectos del lenguaje de programación Kotlin.",),
                    Episode(text: "i.\t StackView")
                  ],

                  */
                )
              ),
            );
  }
}

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({
    super.key,
    required this.listaCapitulos
  });

  final List<Capitulo> listaCapitulos;

  @override
  Widget build(BuildContext context) {
    return Text(
      "titleModule",
      style: const TextStyle(
          fontSize: 20,
          color: Colors.lightBlueAccent
      ),);
  }
}

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64.0),
      child: Text(text),
    );
  }
}

class TitleSubchapter extends StatelessWidget {
  const TitleSubchapter({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(text),
    );
  }
}

class TitleChapter extends StatelessWidget {
  const TitleChapter({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(text, style:
      const TextStyle(
        fontSize: 16,
        color: Color(0xFF133963)
      ),),
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
            fit: BoxFit.cover,
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
                    const Episode(
                        text: "i. findViewById"
                    ),

                    const Episode(
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
                    const Episode(
                        text: "i. StackView"
                    ),

                    const Episode(
                        text: "ii. Button"
                    ),

                    const Episode(
                        text: "iii. TextField"
                    ),

                    const Episode(
                        text: "iv. ScrollView"
                    ),

                    const Episode(
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
                    const Episode(
                        text: "i. URLSession"
                    ),

                    const Episode(
                        text: "ii. Codable"
                    ),

                    const Episode(
                        text: "iii. Throw"
                    ),

                    const Episode(
                        text: "iv. Async y Await"
                    ),

                    const Episode(
                        text: "v. TableView y Combine"
                    ),

                    const Episode(
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
                    const Episode(
                        text: "i. UserDefaults"
                    ),

                    const Episode(
                        text: "ii. KeyChain"
                    ),

                    const Episode(
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

];

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
  List<Episode>? listaEpisodios;
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