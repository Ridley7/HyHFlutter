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
              );
            }).toList(),

          ),
        ),
      ),
    );
  }

  Widget buildImageCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24)
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
            image: NetworkImage(
              "https://cdn.pixabay.com/photo/2023/12/09/15/04/dog-8439530_1280.jpg",
            ),
          colorFilter: Filters.greyscale,
          height: 240,
          fit: BoxFit.cover,
          child: InkWell(
            splashColor: Colors.greenAccent,
            onTap: (){


            },
          ),
        ),

        Text(
          "Card with splash",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24
          ),
        )
      ],
    ),
  );

  Widget buildBasicCard() => Card(
    clipBehavior: Clip.antiAlias,
    shadowColor: Colors.amber,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32)
    ),
    child: Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WordOfTheDayWidget(
            splitWords: ['be', 'nev', 'o', 'lent'],
            definition: "weel meaing and kindly",
            type: "adjective",
            example: "a benevolent smile",
          ),

          SizedBox(height: 12,),
          TextButton(
              onPressed: (){},
              child: Text("Learn More")
          )
        ],
      ),
    ),
  );
}

class ExpandibleCard extends StatefulWidget{
  ExpandibleCard({
    Key? key,
    required this.titleModule,
    required this.listaCapitulos
  }):super(key:key);

  String titleModule;
  List<Capitulo> listaCapitulos;


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
        HeaderCard(callback: _expandOnChanged),
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
                  children: _listaCapitulos.map((e) {
                    return Column(
                      children: [
                        Text(titleModule),
                        Column(
                          children: [
                            Text(e.texto),
                            Column(
                              children: e.listaSubcapitulos!.map((subcapitulo) {
                                return Column(
                                  children: [
                                    Text(subcapitulo.text),
                                    subcapitulo.listaEpisodios == null
                                        ? Container() :
                                    Column(
                                      children: subcapitulo.listaEpisodios!.map((episodio) {
                                        return Text(episodio.text);
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
                  }).toList()

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
    required this.callback
  }):super(key:key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: callback,
        child: Container(
            color: Colors.transparent,
            width: double.infinity,
            alignment: Alignment.center,
            child: Ink.image(
              image: const NetworkImage(
                "https://cdn.pixabay.com/photo/2023/12/09/15/04/dog-8439530_1280.jpg",
              ),
              fit: BoxFit.cover,
              height: 240,
            )
        )
    );
  }
}

class WordOfTheDayWidget extends StatelessWidget{
  final List<String> splitWords;
  final String type;
  final String definition;
  final String example;

  const WordOfTheDayWidget({
    Key? key,
    required this.splitWords,
    required this.type,
    required this.definition,
    required this.example
}): super(key: key);

  @override
  Widget build(BuildContext context){
    final bullet = " \2022 ";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Word of the Day',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        const SizedBox(height: 12,),
        Text(
          splitWords.join(bullet),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -1
          ),
        ),
        const SizedBox(height: 12,),
        Text(
          type,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 8,),
        Text(
          definition,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 8,),
        Text(
          example,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
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
      tituloModulo: "Modulo 1 - DEsarrollo para la plataforma Android",
      listaCapitulo:
      [
        Capitulo(
            texto: "1. Capitulo 1.1: Introducción al lenguaje de programación Kotlin",
            listaSubcapitulos: [
              Subcapitulo(
                  text: "a. Principales aspectos del lenguaje de prorgamación Kotlin",
                  listaEpisodios: []
              )
            ]
        ),
        ]
  ),

  Modulo(
      tituloModulo: "Modulo 2 - Desarrollo para la plataforma de iOS",
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
      ]
  ),

];

class Modulo{
  String tituloModulo;
  List<Capitulo> listaCapitulo;

  Modulo({
    required this.tituloModulo,
    required this.listaCapitulo
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