import 'package:flutter/material.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  final List<Item> _data = List<Item>.generate(
  10,
          (int index) {
    return Item(
      headerText: 'Item $index',
      expandedText: 'This is item number $index'
    );
          }
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded){
          setState(() {
            _data[index].isExpanded = isExpanded;
          });
        },

        children: _data.map<ExpansionPanel>((Item item){
          return ExpansionPanel(
            canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded){
                return buildImageCard();
                  //buildBasicCard();
                /*
                return ListTile(
                  title: Text(item.headerText + " dfdf"),
                );

                 */
              },
              body: ListTile(
                title: Text(item.expandedText),
                subtitle: const Text('To delete this item, click trash icon'),
                trailing: const Icon(
                  Icons.delete,
                  color: Colors.orangeAccent,
                ),
                onTap: (){
                  //Hago cosas

                },
              ),
            isExpanded: item.isExpanded
          );
        }).toList(),

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