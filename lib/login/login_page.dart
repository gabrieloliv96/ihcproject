import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihcproject/rotas/app_routes.dart';

import '../widgets/text_form_login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isLoading;
  bool _popup = false;

  final _formKey = GlobalKey<FormState>();
  bool _manterConectado = false;
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  _showPopUp(String mensagemErro) {
    return AwesomeDialog(
      context: context,
      width: 360,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Informação',
      autoDismiss: true,
      btnOkOnPress: () {},
      btnOk: TextButton.icon(
        onPressed: () {
          setState(() {
            _popup = false;
          });
          Navigator.pop(context);
        },
        icon: const Icon(Icons.account_circle),
        label: const Text(
          'Ok',
          style: TextStyle(fontSize: 20),
        ),
      ),
      desc: mensagemErro,
      descTextStyle: const TextStyle(fontSize: 20),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            right: 15,
            left: 15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroundapp.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              // Image.asset(
              //   'assets/LogomarcaAzul.png',
              //   height: 200,
              //   width: 150,
              // ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  bottom: 10,
                  top: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormLoginWidget(
                        controller: _loginController,
                        validator: (value) {
                          if (!EmailValidator.validate(value!)) {
                            if (!_popup) {
                              setState(() {
                                _popup = true;
                              });
                              _showPopUp('Por favor informe um email válido.');
                            }
                            return 'Email inválido.';
                          }
                          return null;
                        },
                        icon: Icon(
                          Icons.person_pin_circle_rounded,
                          color: Colors.blue.shade900,
                          size: 27,
                        ),
                        cor: Colors.blue.shade900,
                        label: 'Email',
                        textInput: TextInputType.emailAddress,
                        // onChangeController: _controller.setLogin,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter(
                            RegExp(
                              r'(\s)$',
                              multiLine: false,
                              caseSensitive: false,
                            ),
                            allow: false,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormLoginWidget(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            if (!_popup) {
                              setState(() {
                                _popup = true;
                              });
                              _showPopUp('Por favor informe senha válida.');
                            }
                            return 'Por favor insira uma senha válida.';
                          }
                          return null;
                        },
                        controller: _passController,
                        cor: Colors.blue.shade900,
                        icon: Icon(
                          Icons.vpn_key_rounded,
                          color: Colors.blue.shade900,
                        ),
                        label: 'Senha',
                        isObscure: true,
                        textInput: TextInputType.text,
                        showButtom: true,
                        // onChangeController: _controller.setSenha,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter(
                            RegExp(
                              r'(\s)$',
                              multiLine: false,
                              caseSensitive: false,
                            ),
                            allow: false,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Theme(
                    data:
                        ThemeData(unselectedWidgetColor: Colors.blue.shade900),
                    child: Checkbox(
                        value: _manterConectado,
                        activeColor: Colors.blue.shade900,
                        onChanged: (newValue) {
                          setState(() {
                            _manterConectado = newValue!;
                          });
                        }),
                  ),
                  Text(
                    'Mantenha-me conectado',
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    minimumSize:
                        MaterialStateProperty.all(const Size.fromHeight(55)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade600)),
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2)
                    : const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.INDEX);
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  // Navigator.of(context).pushNamed(AppRoutes.REDEFINIRSENHA);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.blue.shade900,
                  thickness: 1.2,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    minimumSize:
                        MaterialStateProperty.all(const Size.fromHeight(55)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffe69012),
                    )),
                child: const Text(
                  'Primeiro acesso',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  // Navigator.of(context).pushNamed(AppRoutes.CADASTRAR);
                },
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Criado por:',
                style: TextStyle(color: Color(0xffbababa), fontSize: 15),
              ),
              Text(
                'Setor de Inovação do IFCE',
                style: TextStyle(
                    color: Color(0xffbababa),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
