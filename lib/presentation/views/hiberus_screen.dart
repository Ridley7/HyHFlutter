import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/pages/ClasesHiberus.dart';

class HiberusScreen extends StatefulWidget {
  const HiberusScreen({Key? key}) : super(key: key);

  @override
  State<HiberusScreen> createState() => _HiberusScreenState();
}

class _HiberusScreenState extends State<HiberusScreen> {
  PageController _pageController = PageController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmailCompany = TextEditingController();
  TextEditingController _controllerTelephone = TextEditingController();
  TextEditingController _controllerCompany = TextEditingController();
  TextEditingController _controllerMessage = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _privacyPolicy = false;
  bool _marketing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/background_hiberus_university.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo_hiberus_white.png",
                      width: (MediaQuery.of(context).size.width / 2.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HIBERUS UNIVERSITY",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 48),
                          ),
                          const Text(
                            "Fórmate con nosotros",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.bounceIn);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          child: const Text(
                            "Más informacion",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.0),
                          child: Text(
                            "APOSTAMOS POR TU TALENTO",
                            style: TextStyle(
                                fontSize: 36,
                                color: Color(0xFF133963),
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.0),
                          child: Text(
                            "En la Hiberus University, apostamos por tu talento.",
                            style: TextStyle(fontSize: 17, height: 1),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32.0),
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text:
                                        "Nuestro proyecto es una iniciativa pionera basada en la ",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.black)),
                                TextSpan(
                                    text:
                                        "formación y especialización en competencias digitales. ",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                TextSpan(
                                    text:
                                        "El objetivo es poder proporcionarte un futuro profesional en el sector TIC, dándote la oportunidad de crecer y desarrollarte con nosotros.",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.black))
                              ]),
                            )),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.0),
                          child: Text(
                              "Nuestros cursos están orientados tanto a estudiantes con formación no STEM como para personas con formación de base tecnológica que quieren aumentar su excelencia. ¿Te apasiona el mundo TIC y no sabes cómo empezar? ¿Quieres convertirte en un referente en tu área tecnológica? ¿Quieres obtener una certificación de referencia? Tenemos un programa para cada necesidad.",
                              style: TextStyle(fontSize: 17, height: 1)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  color: Color(0xFF133963),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset("assets/images/alumnos.png"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Más de 1285 alumnos y alumnas en 2022",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/contratacion.png"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "80% de contratación de alumnos",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/formacion.png"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Formación intensiva y especifica",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/tecnologias.png"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Tecnologías punteras en el mercado",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  )),

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
            ],
          )
        ],
      ),
    );
  }
}
