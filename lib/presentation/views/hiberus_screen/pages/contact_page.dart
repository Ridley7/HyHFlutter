import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmailCompany = TextEditingController();
  final TextEditingController _controllerTelephone = TextEditingController();
  final TextEditingController _controllerCompany = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _privacyPolicy = false;
  bool _marketing = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                StringsApp.TE_INTERESA,
                style: ConstantsApp.TittleApp
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringsApp.DESCUBRE_MAS,
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormWidget(
                          controllerName: _controllerName,
                          hintText: "Nombre*",
                        ),

                        CustomFormWidget(
                            controllerName: _controllerEmailCompany,
                            hintText: "Email de empresa",
                          expresionRegular: RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"),
                          messageAdhoc: "Introduzca un correo electronico valido",
                        ),

/*
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0),
                          child: TextFormField(
                            controller: _controllerEmailCompany,
                            decoration: const InputDecoration(
                              hintText: "Email de empresa*",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2)),
                                borderSide:
                                BorderSide(color: Colors.black54),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Campo obligatorio";
                              }

                              if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
                                return 'Introduzca un correo electronico valido';
                              }

                              return null;
                            },
                          ),
                        ),
                        */
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0),
                          child: TextFormField(
                            controller: _controllerTelephone,
                            decoration: const InputDecoration(
                              hintText: "Teléfono",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2)),
                                borderSide:
                                BorderSide(color: Colors.black54),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0),
                          child: TextFormField(
                            controller: _controllerCompany,
                            decoration: const InputDecoration(
                              hintText: "Compañia*",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2)),
                                borderSide:
                                BorderSide(color: Colors.black54),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Campo obligatorio";
                              }
                              return null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0),
                          child: TextFormField(
                            controller: _controllerMessage,
                            decoration: const InputDecoration(
                              hintText: "\t\tMensaje",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 50.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2)),
                                borderSide:
                                BorderSide(color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: _marketing,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _marketing = !_marketing;
                                    });
                                  }),
                              const Flexible(
                                  child: Text(
                                    "Me gustaría recibir comunicaciones de marketing de Hiberus y sobre sus productos, servicios y eventos.",
                                    style: TextStyle(fontSize: 12),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: _privacyPolicy,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _privacyPolicy = !_privacyPolicy;
                                    });
                                  }),
                              Flexible(
                                  child: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text:
                                            "Acepto el aviso legal y la politica de privacidad",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.red))
                                      ])))
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.8,
                            height:
                            MediaQuery.of(context).size.height *
                                0.1,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!
                                    .validate() ) {
                                  //Todo correcto
                                  print("ERROR");
                                }

                                if(!_privacyPolicy){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => const AlertDialog(
                                        title: Text("Error"),
                                        content: Text("Debe aceptar las politicas de privacidad"),

                                      )
                                  );
                                }else{
                                  //Todo correcto
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0))),
                              child: const Text(
                                "Recibir más información",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFormWidget extends StatelessWidget {
  const CustomFormWidget({
    super.key,
    required this.controllerName,
    required this.hintText,
    this.expresionRegular,
    this.messageAdhoc
  });

  final TextEditingController controllerName;
  final String hintText;
  final RegExp? expresionRegular;
  final String? messageAdhoc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0),
      child: TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(2)),
            borderSide:
            BorderSide(color: Colors.black54),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return StringsApp.CAMPO_OBLIGATORIO;
          }

          if(expresionRegular == null){
            return null;
          }

          if(!expresionRegular!.hasMatch(value)){
            return messageAdhoc;
          }

          return null;

          /*
          if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
            return 'Introduzca un correo electronico valido';
          }
          */
        },
      ),
    );
  }
}
