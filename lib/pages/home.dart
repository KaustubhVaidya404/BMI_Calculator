import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _height = TextEditingController();
  final _weight  = TextEditingController();

  double? _bmi;

  String _statemessage = "Please enter your height and weight";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return Center(
      child: SizedBox(
        width: 350,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: "Height (m)"
                  ),
                  controller: _height,
                ),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: "Weight (kg)"
                  ),
                  controller: _weight,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15.00),
                    child: ElevatedButton(onPressed: _calculate, style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: const Text("Calculate"))),
                Container(
                  padding: const EdgeInsets.only(top: 10.00),
                  child: Text(
                    _bmi == null? "":  _bmi!.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10.00),
                  child: Text(
                    _statemessage,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        "BMI calculator",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
  void _calculate(){
    final double? height = double.tryParse(_height.value.text);
    final double? weight = double.tryParse(_weight.value.text);

    if(height==null || height<=0 || weight==null || weight<=0){
      setState(() {
        _statemessage = "Please enter positive number";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if(_bmi! < 18.5){
        _statemessage = "You are underweight";
      }
      else if(_bmi!< 25){
        _statemessage = "Hurry You are absolutely fit";
      }
      else if(_bmi! < 30){
        _statemessage = "You are overweight";
      }
      else{
        _statemessage = "You are obese";
      }
    });
  }
}


