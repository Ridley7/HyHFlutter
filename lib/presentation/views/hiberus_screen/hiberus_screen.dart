import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/pages/ClasesHiberus.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/pages/contact_page.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/pages/info_graphic_page.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/pages/landing_page.dart';

import 'pages/bet_talent_page.dart';

class HiberusScreen extends StatefulWidget {
  const HiberusScreen({Key? key}) : super(key: key);

  @override
  State<HiberusScreen> createState() => _HiberusScreenState();
}

class _HiberusScreenState extends State<HiberusScreen> {
  final PageController _pageController = PageController();
  /*
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmailCompany = TextEditingController();
  final TextEditingController _controllerTelephone = TextEditingController();
  final TextEditingController _controllerCompany = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _privacyPolicy = false;
  bool _marketing = false;

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              LandingPage(pageController: _pageController),
              const BetTalentPage(),
              const InfoGraphicPage(),
              ContactPage(),
/*
              //Formulario
              SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "¿TE INTERESA?",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFF133963),
                              fontWeight: FontWeight.bold,
                              fontSize: 36),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Si quieres descubrir más sobre la Hiberus University o más información sobre los programas formativos, déjanos tus datos y nos pondremos en contacto contigo.",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      controller: _controllerName,
                                      decoration: const InputDecoration(
                                        hintText: "Nombre*",
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
              )
              */
            ],
          )
        ],
      ),
    );
  }
}


