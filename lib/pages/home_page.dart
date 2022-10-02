import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "Informe seus dados!";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      result = "Informe seus dados!";
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.5) {
        result = "Peso Baixo(${imc.toStringAsPrecision(3)})";
      } else if (imc < 25) {
        result = "Peso Normal(${imc.toStringAsPrecision(3)})";
      } else if (imc < 30) {
        result = "Sobrepeso(${imc.toStringAsPrecision(3)})";
      } else if (imc < 35) {
        result = "Obesidade Grau I(${imc.toStringAsPrecision(3)})";
      } else if (imc < 39.9) {
        result = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc > 40) {
        result = "Obesidade Grau III ou Mórbida(${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: resetFields,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Icon(
                Icons.person,
                color: Colors.green,
                size: 150,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: "Peso Kg",
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: "Altura Cm",
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(
                      double.maxFinite,
                      40,
                    )),
                onPressed: calculate,
                child: const Text("Calcular"),
              ),
              Text(
                result,
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
