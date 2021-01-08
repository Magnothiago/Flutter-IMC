import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
/*
@Autor Thiago Furtado
 */
class _HomeState extends State<Home> {
  TextEditingController _controleIdade = new TextEditingController();
  TextEditingController _controlePeso = new TextEditingController();
  TextEditingController _controleAltura = new TextEditingController();

  double resultado = 0.0;
  String _resultadoFinal = '';
  String _resultadoConsulta = '';

  void calcularIMC() {
    setState(() {
      int idade = int.parse(_controleIdade.text);
      double altura = double.parse(_controleAltura.text);
      double peso = double.parse(_controlePeso.text);

      if ((_controleIdade.text.isNotEmpty || idade > 0) &&
          (_controleAltura.text.isNotEmpty) &&
          (_controlePeso.text.isNotEmpty || peso > 0)) {
        resultado = peso / (altura * altura);

        if (double.parse(resultado.toStringAsFixed(1)) < 16) {
          _resultadoConsulta = 'Baixo peso, muito grave ';
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 16 &&
            resultado < 16) {
          _resultadoConsulta = 'Baixo peso, grave';
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 17.0 &&
            resultado < 18.49) {
          _resultadoConsulta = 'Baixo peso';
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 18.50 &&
            resultado < 24.99) {
          _resultadoConsulta = 'Peso normal';
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 25.0 &&
            resultado < 29.99) {
          _resultadoConsulta = 'Sobre peso';
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 30.0 &&
            resultado < 34.99) {
          _resultadoConsulta = 'Obesidade grau I';
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 35.0 &&
            resultado < 39.99) {
          _resultadoConsulta = 'Obesidade grau II';
        } else if (double.parse(resultado.toStringAsFixed(1)) >= 40.0) {
          _resultadoConsulta = 'Obesidade mórmida';
        } else {
          resultado = 0.0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('IMC'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/imc_logo.png',
              height: 100,
              width: 200,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  TextField(
                    controller: _controleIdade,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Digite sua idade',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  TextField(
                    controller: _controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Digite seu peso',
                        icon: Icon(Icons.accessibility_new_rounded)),
                  ),
                  TextField(
                      controller: _controleAltura,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Digite sua altura',
                          icon: Icon(Icons.all_inclusive_sharp))),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: calcularIMC,
                  color: Colors.lightBlue,
                  child: Text('Calcular IMC'),
                  textColor: Colors.black,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${resultado.toStringAsFixed(1)}',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$_resultadoConsulta',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
