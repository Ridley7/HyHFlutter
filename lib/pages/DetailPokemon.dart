import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailPokemon extends StatelessWidget {
  const DetailPokemon({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> imagesPokemon = [
      "https://assets.pokemon.com/assets/cms2/img/pokedex/full/100.png",
      "https://assets.pokemon.com/assets/cms2/img/pokedex/full/101.png",
      "https://assets.pokemon.com/assets/cms2/img/pokedex/full/102.png",
      "https://assets.pokemon.com/assets/cms2/img/pokedex/full/103.png",
      "https://assets.pokemon.com/assets/cms2/img/pokedex/full/104.png",
    ];

    PageController _controller = PageController();
    double sizeImage = 180.0;

    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
            "Detail Page", style: TextStyle(color: Colors.white),),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.brown,
                  Colors.white
                ]
            ),
          ),
          child: Column(
            children: [
              //Carrusel de imagenes
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: imagesPokemon.length,
                      itemBuilder: (context, index){
                      return Image.network(imagesPokemon[index]);
                      },
                        /*
                        Image.asset("assets/images/charmander.png"),
                        Image.asset("assets/images/charmander.png")
                        */
                    ),
                ),
              ),
        
              Container(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: imagesPokemon.length,
                ),
              ),
        
              //Detalle del pokemon
              RowAttributePokemon(attributeName: "Name", text: "Charmander",),
        
              SizedBox(height: 10,),
        
              RowAttributePokemon(attributeName: "Descripción", text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
        
              SizedBox(height: 10,),
        
              RowAttributePokemon(attributeName: "Peso", text: "8 Kg"),
        
              SizedBox(height: 10,),
        
              RowAttributePokemon(attributeName: "Altura", text: "20 m"),
        
              //Galeria del pokemon
              Row(
                children: [
                  Flexible(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: imagesPokemon.map((url) {
                        return Image.network(url,
                        height: sizeImage,
                        width: sizeImage,);
                      }).toList()
        
                    ),
                  ),
                ],
              )
        
            ],
          ),
        
        ),
      ),
    );
  }
}

class RowAttributePokemon extends StatelessWidget {
  const RowAttributePokemon({
    super.key,
    required this.attributeName,
    required this.text
  });

  final String attributeName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            attributeName,
          style: TextStyle( fontWeight: FontWeight.bold),),

          const SizedBox(width: 40,),

          Flexible(
            child: Text(
              text, style: TextStyle(fontSize: 12), ),
          ),

        ],
      ),
    );
  }
}
