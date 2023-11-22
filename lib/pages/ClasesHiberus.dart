
import 'package:flutter/material.dart';

class ClasesHiberus extends StatelessWidget {
  const ClasesHiberus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Lista de pokemons", style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, index){
            return GestureDetector(
              child: Item(),
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text("Has pinchado en la opción $index"),
                    )
                );
              },
            ) ;//Item();
          }
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20)
        ),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          children: [
            Image.asset("assets/images/charmander.png"),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Charmander", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Text("Descripcion de charmander hjklñ"),
                Text("fire")
              ],
            )
          ],
        ),
      ),
    );
  }
}


