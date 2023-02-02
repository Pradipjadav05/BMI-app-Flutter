import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageControler = TextEditingController();
  final TextEditingController _heightControler = TextEditingController();
  final TextEditingController _weightControler = TextEditingController();

  double _result = 0.0;

  double _inch = 0.0;
  double _weightPounds = 0.0;
  int age = 0;
  String _resultReading = "";

  void calculateBMI() {
    setState(() {
      // ignore: no_leading_underscores_for_local_identifiers
      _weightPounds = double.parse(_weightControler.text) * 2.20462;
      _inch = double.parse(_heightControler.text) * 12;
      // print(_weightPounds);
      age = int.parse(_ageControler.text);
      if ((_ageControler.text.isNotEmpty || age > 0) &&
          (_weightControler.text.isNotEmpty || _weightPounds > 0) &&
          (_heightControler.text.isNotEmpty || _inch > 0)) {
        _result = (_weightPounds / (_inch * _inch)) * 703;

        if (_result < 18.5) {
          _resultReading = "Underweight";
        } else if (_result >= 18.5 && _result < 25) {
          _resultReading = "Great Shape!";
        } else if (_result >= 25.0 && _result < 30) {
          _resultReading = "Overweight";
        } else if (_result >= 30) {
          _resultReading = "Obese";
        }
      } else {
        _result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Image.asset(
              "images/bmilogo.png",
              height: 120.0,
            ),
            Container(
              padding: const EdgeInsets.all(14.0),
              color: Colors.black12,
              child: Column(
                children: [
                  TextFormField(
                    controller: _ageControler,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person_outline),
                      label: Text("Age"),
                    ),
                  ),
                  TextFormField(
                    controller: _heightControler,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.auto_graph),
                      label: Text("Height in feet"),
                    ),
                  ),
                  TextFormField(
                    controller: _weightControler,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.line_weight),
                      label: Text("Weight in kg"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  ElevatedButton(
                    onPressed: calculateBMI,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 16.9),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "Your BMI: ${_result.toStringAsFixed(1)}",
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    _resultReading,
                    style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
