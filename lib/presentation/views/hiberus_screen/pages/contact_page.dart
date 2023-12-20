import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/presentation/widgets/hiberus_screen/corporative_button.dart';
import 'package:hiberus_university/presentation/widgets/hiberus_screen/custom_form_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Text(StringsApp.TE_INTERESA, style: ConstantsApp.TittleApp),
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
                          expresionRegular: RegExp(
                              r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"),
                          messageAdhoc:
                              "Introduzca un correo electronico valido",
                        ),
                        CustomFormWidget(
                            controllerName: _controllerTelephone,
                            hintText: "Teléfono"),
                        CustomFormWidget(
                            controllerName: _controllerCompany,
                            hintText: "Compañia"),
                        CustomFormWidget(
                          controllerName: _controllerMessage,
                          hintText: "\t\tMensaje",
                          contentPadding: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                                StringsApp.RECIBIR_COMUNICACIONES,
                                style: TextStyle(fontSize: 12),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                                  child: Wrap(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      if (await canLaunchUrl(Uri.parse(
                                          "https://www.hiberus.com/aviso-legal"))) {
                                        launchUrl(
                                            Uri.parse(
                                                "https://www.hiberus.com/aviso-legal"),
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        if (!mounted) return;

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(StringsApp.ERROR_URL)));
                                      }
                                    },
                                    child: const Text(
                                      StringsApp.AVISO_LEGAL,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (await canLaunchUrl(Uri.parse(
                                          "https://www.hiberus.com/aviso-legal"))) {
                                        launchUrl(
                                            Uri.parse(
                                                "https://www.hiberus.com/aviso-legal"),
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        if (!mounted) return;

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(StringsApp.ERROR_URL)));
                                      }
                                    },
                                    child: const Text(
                                      StringsApp.POLITICA_PRIVACIDAD,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  const Text(
                                    "*",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: CorporativeButton(
                              callback: (){
                                if (!_formKey.currentState!.validate()) {
                                  //Todo correcto
                                  print("ERROR");
                                }

                                if (!_privacyPolicy) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                      const AlertDialog(
                                        title: Text("Error"),
                                        content: Text(
                                            "Debe aceptar las politicas de privacidad"),
                                      ));
                                } else {
                                  //Todo correcto
                                }
                              },
                              text: StringsApp.MAS_INFORMACION,
                            )
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
