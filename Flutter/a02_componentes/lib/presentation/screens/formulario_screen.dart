import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {
   
  const FormularioScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario'),),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              
              children: [
                _RegisterForm(),
                
                
        
              ],
            ),
          ),
        ),
      )
    );
  }
}


class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          const FlutterLogo(size: 100,),
          const SizedBox(height: 20,),
          const CustomTextFormField( label: 'Nombre de Usuario', ),
          const SizedBox(height: 20,),
          const CustomTextFormField( label: 'Correo Electrónico', teclado: TextInputType.emailAddress,),
          const SizedBox(height: 20,),
          const CustomTextFormField( label: 'Password', obscureText: true,),
          const SizedBox(height: 20,),
          const CustomTextFormField( label: 'Repite Password', obscureText: true,),
                
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
                  onPressed: () {  }, 
                  icon: const Icon(Icons.save), 
                  label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? teclado;


  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.obscureText = false, 
    this.teclado,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context);

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      // borderSide: BorderSide(color: colors.primaryColor )
    );



    return TextFormField(
            obscureText: obscureText,
            keyboardType: teclado,
            autofocus: true,
            //initialValue: 'Alberto',
            //textCapitalization: TextCapitalization.words,
            onChanged: onChanged, 
            validator: validator,
            // Queremos cambiar la apariencia fisica del boton
            decoration: InputDecoration(
              enabledBorder: border,
              focusedBorder: border.copyWith( borderSide: BorderSide(color: colors.primaryColor )),


              isDense: true,
              label: label != null ? Text(label!) : null,
              hintText: hint,
              focusColor: colors.primaryColor,
              prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primaryColor,),
              //suffixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primaryColor,),
              //icon: Icon(Icons.supervised_user_circle_outlined, color: colors.primaryColor,),
              errorText: errorMessage,
              errorBorder: border.copyWith(borderSide: const BorderSide(color: Colors.redAccent)),
              focusedErrorBorder: border.copyWith(borderSide: const BorderSide(color: Colors.redAccent)),
            ),
    );
  }
}