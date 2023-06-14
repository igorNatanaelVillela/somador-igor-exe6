import 'package:somador_igor/components/app_bar.dart';
import 'package:somador_igor/components/button.dart';
import 'package:somador_igor/components/form_text_field.dart';
import 'package:somador_igor/components/titel.dart';
import 'package:somador_igor/controller/somar_controller.dart';
import 'package:somador_igor/model/somar.dart';
import 'package:somador_igor/model/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numero1Controller = TextEditingController();
  TextEditingController numero2Controller = TextEditingController();

  final email = User.instance.getEmail();

  double _numero1 = 0;
  double _numero2 = 0;
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Olá ' + email,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          title(text: 'Entre com os valores'),
          FormTextField(
            labelText: 'Número 1',
            hintText: 'Número 1',
            textController: numero1Controller,
          ),
          FormTextField(
            labelText: 'Número 2',
            hintText: 'Número 2',
            textController: numero2Controller,
          ),
          mainButton(
            buttonFunction: () {
              Somar.instance.setNumero1(double.parse(numero1Controller.text));
              Somar.instance.setNumero2(double.parse(numero2Controller.text));

              _numero1 = Somar.instance.getNumero1();
              _numero2 = Somar.instance.getNumero2();

              setState(() {
                resultado =
                    SomarController.instance.calcular(_numero1, _numero2);
              });
            },
            buttonCollor: Colors.amberAccent,
            buttonText: 'Calcular',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                resultado > 0
                    ? 'Resultado: ${resultado.toStringAsFixed(2)}'
                    : 'Resultado: 0',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
