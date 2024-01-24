import 'package:a02_componentes/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValor = 100;
  bool _isChecked = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider y Checkboxes'),),
      body: Column(
        children: [
          Slider(
            //divisions: 10,
            //activeColor: Colors.amber,
            min: 50,
            max: 400,
            value: _sliderValor, 
            onChanged: ( _isChecked )
              ? null
              : ( value ){
              setState(() {
                _sliderValor = value;
              });
            }
          ),

          // Checkbox(
          //   value: _isChecked, 
          //   onChanged: (value) {
          //     _isChecked = value!;
          //     setState(() {  });
          //   },
          // ),
          // CheckboxListTile.adaptive(
          //   title: const Text('Bloquear Slider'),
          //   checkColor: Colors.white,
          //   tileColor: Colors.amberAccent.shade100,
          //   value: _isChecked, 
          //   onChanged: (value) {
          //      _isChecked = value!;
          //      setState(() {  });
          //    },
          //   ),
          // Switch.adaptive(
          //   value: _isChecked, 
          //   onChanged: (value) {
          //       _isChecked = value!;
          //       setState(() {  });
          //     },
          //   ),
          SwitchListTile.adaptive(
            //hoverColor: Colors.indigo,
            //activeTrackColor: Colors.indigo,
            title: const Text('Bloquear Slider'),
            //tileColor: Colors.amberAccent.shade100,
            value: _isChecked, 
            onChanged: (value) {
                _isChecked = value!;
                setState(() {  });
              },
            ),
          BatmanPersonalizado(sliderValor: _sliderValor),

          SizedBox(height: 20,)
        ],
      )
    );
  }
}

class BatmanPersonalizado extends StatelessWidget {
  const BatmanPersonalizado({
    super.key,
    required double sliderValor,
  }) : _sliderValor = sliderValor;

  final double _sliderValor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Image(
          width: _sliderValor,
          fit: BoxFit.contain,
          image: NetworkImage('https://cdn.pixabay.com/photo/2020/07/06/17/51/batman-5377804_1280.png'),
          ),
      ),
    );
  }
}