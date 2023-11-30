import 'dart:math';

import 'package:flutter/material.dart';

class ListPokemon extends StatefulWidget {
  const ListPokemon({super.key});

  @override
  State<ListPokemon> createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {

  //Lista de pokemons que vamos a representar
  List<Pokemon> pokemonList = [
    Pokemon(
      name: 'Pikachu',
      description: 'Electric-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png',
      type: "Electric",
      weight: "5Kg"
    ),
    Pokemon(
      name: 'Charmander',
      description: 'Fire-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png',
      type: "Fire",
      height: "40cm"
    ),
    Pokemon(
      name: 'Squirtle',
      description: 'Water-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png',
      type: "Water",
      weight: "20Kg",
      height: "80cm"
    ),
    Pokemon(
      name: 'Bulbasaur',
      description: 'Grass/Poison-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png',
      type: 'Grass/Poison',
    ),
    Pokemon(
      name: 'Jigglypuff',
      description: 'Normal/Fairy-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/039.png',
      type: 'Normal/Fairy',
    ),
    Pokemon(
      name: 'Meowth',
      description: 'Normal-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/052.png',
      type: 'Normal',
    ),
    Pokemon(
      name: 'Geodude',
      description: 'Rock/Ground-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/074.png',
      type: 'Rock/Ground',
    ),
    Pokemon(
      name: 'Psyduck',
      description: 'Water-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/054.png',
      type: 'Water',
    ),
    Pokemon(
      name: 'Machop',
      description: 'Fighting-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/066.png',
      type: 'Fighting',
    ),
    Pokemon(
      name: 'Abra',
      description: 'Psychic-type Pokémon',
      urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/063.png',
      type: 'Psychic',
    ),
  ];

  //Boleano que controla nuestro switch
  bool _switchValue = false;
  bool _switchForm = true;

  //Controladores de inputs
  TextEditingController _controllerPokemonName = TextEditingController();
  TextEditingController _controllerPokemonType = TextEditingController();
  TextEditingController _controllerPokemonDescription = TextEditingController();
  TextEditingController _controllerPokemonHeight = TextEditingController();
  TextEditingController _controllerPokemonWeight = TextEditingController();
  TextEditingController _controllerPokemonImage = TextEditingController();
  final GlobalKey<FormState> _formAddPokemonKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //atributo que permite ver a traves de la appbar, con esto conseguimos transparentar el color de la Appbar
      appBar: AppBar(
        title: const Text("Lista de Pokemons", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            child: Icon(Icons.add),
            onTap: (){
              setState(() {
                _switchForm = !_switchForm;
              });
            },
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        //Definimos la imagen de fondo de la app
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://i.pinimg.com/originals/a1/86/a8/a186a8aff83506c70b0b307e3fb062c8.png"),
            fit: BoxFit.cover //Usamos BoxFit cover por que queremos que toda la imagen "cubra" el Container. Dado que el Container
            //no tiene un alto y ancho defino va a cubrir toda la pantalla.
          )
        ),
        child: Padding(
          //Aplicamos un padding de 90 para que el switch y el texto que le acompaña queden por debajo de la appbar.
          //Es posible que esto se puede hacer mejor
          padding: const EdgeInsets.only(top: 90),
          child: _switchForm
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                //Titulo
                const Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all( 8.0,),
                      child: Text("Rellena el formulario para continuar", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),

                //Formulario
                Flexible(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formAddPokemonKey,
                      child: Column(

                        children: [

                          //Campo nombre
                          PokeTextFormField(
                              controllerPokemonName: _controllerPokemonName,
                            pokeHintText: "Escriba el nombre del Pokemon",
                            pokeLabelText: "Nombre",
                            mandatoryField: true,
                          ),

                          //Campo Tipo
                          PokeTextFormField(
                            controllerPokemonName: _controllerPokemonType,
                            pokeHintText: "Escriba el tipo del Pokemon",
                            pokeLabelText: "Tipo",
                            mandatoryField: true,
                          ),


                          //Campo descripcion
                          PokeTextFormField(
                            controllerPokemonName: _controllerPokemonDescription,
                            pokeHintText: "Escriba la descripcion del Pokemon",
                            pokeLabelText: "Descripcion",
                            mandatoryField: true,
                          ),

                          //Campo altura
                          PokeTextFormField(
                            controllerPokemonName: _controllerPokemonHeight,
                            pokeHintText: "Escriba la altura del Pokemon",
                            pokeLabelText: "Altura",
                            mandatoryField: false,
                          ),

                          //Campo peso
                          PokeTextFormField(
                            controllerPokemonName: _controllerPokemonWeight,
                            pokeHintText: "Escriba el peso del Pokemon",
                            pokeLabelText: "Peso",
                            mandatoryField: false,
                          ),

                          //Campo imagen
                          PokeTextFormField(
                            controllerPokemonName: _controllerPokemonImage,
                            pokeHintText: "Escriba el numero del Pokemon",
                            pokeLabelText: "Numero imagen",
                            mandatoryField: true,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: ElevatedButton(
                                  onPressed: (){

                                    if(_formAddPokemonKey.currentState!.validate()){
                                      //Añadimos un pokemon
                                      Random random = Random();
                                      int randomIndex = random.nextInt(149);

                                      print("Tenemos que añadir pokemon");
                                      Pokemon newPokemon = Pokemon(
                                          name: _controllerPokemonName.text,
                                          description: _controllerPokemonDescription.text,
                                          urlImage: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/100.png",
                                          type: _controllerPokemonType.text,
                                        height: _controllerPokemonHeight.text,
                                          weight: _controllerPokemonWeight.text
                                      );

                                      pokemonList.add(newPokemon);

                                      //Quitamos el formulario
                                      _switchForm = !_switchForm;
                                      //Activamos Lista de pokemon
                                      _switchValue = true;
                                      setState(() {

                                      });


                                    }else{
                                      print("ERROR");
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0)
                                    )
                                  ),
                                  child: const Text(
                                    "Enviar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                    ),
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                            ],
                          ),
              )


              : Column(
            children: [
              //Definimos el switch y su leyenda
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //opcional -> Centra Switch y texto que le acompaña
                children: [
                  Switch(
                      value: _switchValue,
                      onChanged: (value){
                        setState(() { //Usamos setState porque queremos repintar un nuevo estado de la pantalla
                          _switchValue = !_switchValue;
                        });
                      }
                  ),

                  const Text("Mostrar lista de Pokemons", style: TextStyle(color: Colors.white),)
                ],
              ),

              //Definimos la lista
              _switchValue ? WidgetListaPokemon(pokemonList: pokemonList) : const SizedBox(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Añadimos un pokemon, para ello tomamos uno al azar de la lista que esta al final de este documento
          Random random = Random();
          int randomIndex = random.nextInt(pokemonNewList.length);
          pokemonList.add(pokemonNewList[randomIndex]);

          //Aplicamos el set state para repintar la pantalla y poder ver al nuevo pokemon añadido
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PokeTextFormField extends StatelessWidget {
  const PokeTextFormField({
    super.key,
    required TextEditingController controllerPokemonName,
    required this.pokeHintText,
    required this.pokeLabelText,
    required this.mandatoryField
  }) : _controllerPokemonName = controllerPokemonName;

  final TextEditingController _controllerPokemonName;
  final String pokeHintText;
  final String pokeLabelText;
  final bool? mandatoryField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _controllerPokemonName,
        decoration: InputDecoration(
            hintText: pokeHintText,
            labelText: pokeLabelText,

            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black),
            ),
        ),

        validator: (value){

          if(mandatoryField!){
            if(value!.isEmpty){
              return "Campo obligatorio";
            }
            return null;
          }else{
            return null;
          }

        },
      ),
    );
  }
}

class WidgetListaPokemon extends StatelessWidget {
  const WidgetListaPokemon({
    super.key,
    required this.pokemonList,
  });

  final List<Pokemon> pokemonList;

  @override
  Widget build(BuildContext context) {
    //La lista la tenemos que incluir dentro de un Expanded para que sepa que ha de ocupar todo el espacio
    //posible de la pantalla. Si no usamos exte expanded la lista cuenta con espacio infinito y peta la app
    return Expanded(
        child: ListView.builder(
          //Dado que las ListView ya vienen con un padding por defecto, ponemos un padding 0 en todos
          //lados para quitar ese padding por defecto. Ese padding por defecto da la sensación de que la lista
          //no esta en su lugar o que no empieza correctamente desde la parte superior de la pantalla
          padding: const EdgeInsets.all(0),
          itemCount: pokemonList.length,
            itemBuilder: (context, index){
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Padding(
                    //Pequeño padding para separar los elementos de la lista, sobretodo a en el eje horizontal.
                    //Esto es opcional
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Image.network(pokemonList[index].urlImage),
                        //Este Sizedbox es para dar un pequeño separado entre la imagen del pokemon y los otros datos
                        const SizedBox(width: 20,),
                        //Incluimos un Flexible para controlar que el texto de la descripción del pokemon puede desbordar un poco
                        //sin que suponga un overflow y en caso de overflow poder aplicar un correctivo como la elipsis.
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Espaciamos veerticalmente los textos de nombre de pokemn, descripcion y tipo
                            crossAxisAlignment: CrossAxisAlignment.start, //Indicamos que los textos de nombre de pokemn, descripcipn y tipo han de empezar por la izquierda
                            children: [
                              Text(pokemonList[index].name, style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),

                              Padding(
                                padding: const EdgeInsets.only(right: 16.0), //aplicamos un padding solo a la derecha para que el icono de delete no quede tan pegado al borde derecho
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(pokemonList[index].description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                                    Icon(Icons.delete)
                                  ],
                                ),
                              ),

                              Row(
                                children: [
                                  const Icon(Icons.ac_unit_sharp),
                                  Text(pokemonList[index].type),
                                  const SizedBox(width: 4,),
                                  pokemonList[index].weight == null ? SizedBox() : Icon(Icons.line_weight),
                                  pokemonList[index].weight == null ? SizedBox() : Text("5cm"),
                                  const SizedBox(width: 4,),
                                  pokemonList[index].height == null ? SizedBox() : Icon(Icons.height),
                                  pokemonList[index].height == null ? SizedBox() : Text("2m"),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text("Has elegido la opcion $index"),
                    )
                );
              },
            );
            }
        )
    );
  }
}

class Pokemon{
  String name;
  String description;
  String urlImage;
  String type;
  String? weight; //Este atributo es opcional
  String? height; //Este atributo es opcional

  Pokemon({
    required this.name,
    required this.description,
    required this.urlImage,
    required this.type,
    this.weight,
    this.height
  });
}


//Pokemons que se añaden
List<Pokemon> pokemonNewList = [

  Pokemon(
    name: 'Gyarados',
    description: 'Water/Flying-type Pokémon',
    urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/130.png',
    type: 'Water/Flying',
  ),
  Pokemon(
    name: 'Alakazam',
    description: 'Psychic-type Pokémon',
    urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/065.png',
    type: 'Psychic',
  ),
  Pokemon(
    name: 'Dragonite',
    description: 'Dragon/Flying-type Pokémon',
    urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/149.png',
    type: 'Dragon/Flying',
  ),
  Pokemon(
    name: 'Mewtwo',
    description: 'Psychic-type Pokémon',
    urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/150.png',
    type: 'Psychic',
  ),
  Pokemon(
    name: 'Mew',
    description: 'Psychic-type Pokémon',
    urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/151.png',
    type: 'Psychic',
  ),

];
