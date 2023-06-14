import 'package:somador_igor/components/app_bar.dart';
import 'package:somador_igor/components/button.dart';
import 'package:somador_igor/components/form_text_field.dart';
import 'package:somador_igor/components/titel.dart';
import 'package:somador_igor/model/user.dart';
import 'package:flutter/material.dart';

import '../controller/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(text: 'Login'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormTextField(
                  hintText: 'E-mail',
                  labelText: 'E-mail',
                  textController: _emailController,
                  inputType: TextInputType.emailAddress,
                  inputValidator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'O campo e-mail deve ser preenchido';
                    } else if (!email.contains('@tsi.com.br')) {
                      return 'E-mail invalido';
                    }
                    return null;
                  },
                ),
                FormTextField(
                  hintText: 'Senha',
                  labelText: 'Senha',
                  textController: _passwordController,
                  obscureText: true,
                  inputValidator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'O campo senha deve ser preenchido';
                    } else if (password.length < 8) {
                      return 'Senha invalida';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          mainButton(
            buttonFunction: () async {
              if (_formKey.currentState!.validate()) {
                final messenger = ScaffoldMessenger.of(context);
                final navigator = Navigator.of(context);
                bool loginSucesso = await UserController.instance
                    .login(_emailController.text, _passwordController.text);

                if (loginSucesso) {
                  User.instance.setEmail(_emailController.text);
                  navigator.pushNamed('/home');
                } else {
                  messenger.showSnackBar(const SnackBar(
                    content: Text('As Credenciais informadas estão incorretas'),
                    backgroundColor: Colors.red,
                  ));
                }
              }
            },
            buttonText: 'Entrar',
            buttonCollor: Color.fromARGB(255, 211, 162, 17),
          ),
        ],
      ),
    );
  }
}
