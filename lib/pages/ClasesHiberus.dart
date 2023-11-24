
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ClasesHiberus extends StatefulWidget {
  const ClasesHiberus({Key? key}) : super(key: key);

  @override
  State<ClasesHiberus> createState() => _ClasesHiberusState();
}

class _ClasesHiberusState extends State<ClasesHiberus> {

  File? _xFile;
  String path = "";
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerSurename = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerTelephone = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Formularios", style: TextStyle(color: Colors.white),),
      ),
      body:

      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //Nombre
                  FormItem(
                    controllerName: _controllerName,
                    icon: Icon(Icons.person),
                    prefixIcon: Icon(Icons.star),
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Nombre",
                    labelText: "Introduza su nombre"
                  ),

                  const SizedBox(height: 20,),

                  //Apellido
                  FormItem(
                    controllerName: _controllerSurename,
                    icon: Icon(Icons.person),
                    prefixIcon: Icon(Icons.star),
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Apellido",
                    labelText: "Introduzca su Apellido",
                  ),

                  const SizedBox(height: 20,),

                  //Correo electronico
                  FormEmailItem(
                    controllerName: _controllerEmail,
                    icon: Icon(Icons.person),
                    prefixIcon: Icon(Icons.star),
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Email",
                    labelText: "Introduzca su correo electronico",
                  ),

                  const SizedBox(height: 20,),

                  //Telefono
                  FormPhoneItem(
                    controllerName: _controllerTelephone,
                    icon: Icon(Icons.person),
                    prefixIcon: Icon(Icons.star),
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Telefono",
                    labelText: "Introduzca su telefono",
                  ),

                  const SizedBox(height: 20,),

                  //Direccion
                  FormItem(
                    controllerName: _controllerAddress,
                    icon: Icon(Icons.person),
                    prefixIcon: Icon(Icons.star),
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Direcciónm",
                    labelText: "Introduzca su dirección",
                  ),

                  const SizedBox(height: 20,),

                  //Contraseña
                  FormItem(
                    controllerName: _controllerPass,
                    icon: Icon(Icons.person),
                    prefixIcon: Icon(Icons.star),
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Contraseña",
                    labelText: "Introduzca su Contraseña",
                    obscureText: true,
                  ),

                  const SizedBox(height: 20,),

                  //Fecha
                  FormDateItem(
                      controllerName: _controllerDate,
                      icon: const Icon(Icons.add),
                      prefixIcon: const Icon(Icons.ac_unit_sharp),
                      suffixIcon: const Icon(Icons.g_mobiledata),
                      hintText: "Fecha",
                      labelText: "Introduza su fecha"
                  ),

                  const SizedBox(height: 20,),

                  GestureDetector(
                    child: CircleAvatar(
                      radius: 100.0,
                      //backgroundImage: AssetImage("assets/images/charmander.png")
                      backgroundImage: _xFile == null ? AssetImage("assets/images/charmander.png") : Image.file(_xFile!).image,
                    ),

                    onTap: () async {
                      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
                      maxWidth: 1000,
                      maxHeight: 1000);
                      if(image == null) return;

                      path = image.path;
                      _xFile = File(path);

                      setState(() {});
                    },
                  ),

                  ElevatedButton(
                      onPressed: (){

                        if(_formKey.currentState!.validate()){
                          print("Todo correcto");

                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text("Tienes los siguientes datos:\n"
                                    "${_controllerName.text}\n"
                                    "${_controllerSurename.text}\n"
                                    "${_controllerEmail.text}\n"
                                    "${_controllerTelephone.text}\n"
                                    "${_controllerAddress.text}\n"
                                    "${_controllerPass.text}\n"
                                    "${_controllerDate.text}\n"),

                              ));

                        }else{
                          print("ERROR");
                        }

                      },
                      child: Text("Submit")
                  )
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}

class FormDateItem extends StatefulWidget {
  const FormDateItem({
    super.key,
    required TextEditingController controllerName,
    required this.icon,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.labelText,

  }) : _controllerName = controllerName;

  final TextEditingController _controllerName;
  final Icon icon;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String hintText;
  final String labelText;

  @override
  State<FormDateItem> createState() => _FormDateItemState();
}

class _FormDateItemState extends State<FormDateItem> {

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101)
    );

    if(picked != null && picked != _selectedDate){
      setState(() {
        _selectedDate = picked;
        widget._controllerName.text = "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controllerName,
      readOnly: true,
      decoration: InputDecoration(
          icon: widget.icon,
          prefixIcon: widget.prefixIcon,//Icon(Icons.phone),
          suffixIcon: IconButton(
            icon: widget.suffixIcon,
            onPressed: (){
              print("selected date");
              _selectDate(context);
            },
          ),//Icon(Icons.star),
          hintText: widget.hintText,
          labelText: widget.labelText,

          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.blue),
          ),

          filled: true,
          fillColor: Colors.amberAccent

      ),

      validator: (value){
        if(value!.isEmpty){
          return "Campo obligatorio";
        }

        return null;
      },

    );
  }
}


class FormPhoneItem extends StatelessWidget {
  const FormPhoneItem({
    super.key,
    required TextEditingController controllerName,
    required this.icon,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.labelText,

  }) : _controllerName = controllerName;

  final TextEditingController _controllerName;
  final Icon icon;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerName,
      decoration: InputDecoration(
          icon: icon,
          prefixIcon: prefixIcon,//Icon(Icons.phone),
          suffixIcon: suffixIcon,//Icon(Icons.star),
          hintText: hintText,
          labelText: labelText,

          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.blue),
          ),

          filled: true,
          fillColor: Colors.amberAccent

      ),

      validator: (value){
        if(value!.isEmpty){
          return "Campo obligatorio";
        }

        if (!RegExp(r'^\d{9}$').hasMatch(value)) {
          return 'Introduzca un numero correcto';
        }

        return null;
      },

    );
  }
}

class FormEmailItem extends StatelessWidget {
  const FormEmailItem({
    super.key,
    required TextEditingController controllerName,
    required this.icon,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.labelText,
  }) : _controllerName = controllerName;

  final TextEditingController _controllerName;
  final Icon icon;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerName,
      decoration: InputDecoration(
          icon: icon,
          prefixIcon: prefixIcon,//Icon(Icons.phone),
          suffixIcon: suffixIcon,//Icon(Icons.star),
          hintText: hintText,
          labelText: labelText,

          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.blue),
          ),

          filled: true,
          fillColor: Colors.amberAccent

      ),

      validator: (value){
        if(value!.isEmpty){
          return "Campo obligatorio";
        }

        if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
          return 'Introduzca un correo electronico valido';
        }
        return null;
      },

    );
  }
}

class FormItem extends StatelessWidget {
  const FormItem({
    super.key,
    required TextEditingController controllerName,
    required this.icon,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.labelText,
    this.obscureText

  }) : _controllerName = controllerName;

  final TextEditingController _controllerName;
  final Icon icon;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String hintText;
  final String labelText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerName,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        icon: icon,
        prefixIcon: prefixIcon,//Icon(Icons.phone),
        suffixIcon: suffixIcon,//Icon(Icons.star),
        hintText: hintText,
        labelText: labelText,

        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.blue),
        ),

        filled: true,
        fillColor: Colors.amberAccent

      ),

      validator: (value){
        if(value!.isEmpty){
          return "Campo obligatorio";
        }
        return null;
      },

    );
  }
}

class ListaCharmander extends StatelessWidget {
  const ListaCharmander({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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


