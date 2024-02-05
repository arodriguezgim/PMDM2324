import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {
   
  const FormularioScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
          CustomTextFormField(),
          const SizedBox(height: 20,),
          CustomTextFormField(),
          const SizedBox(height: 20,),
          CustomTextFormField(),
                
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
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context);

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      // borderSide: BorderSide(color: colors.primaryColor )
    );



    return TextFormField(
            autofocus: true,
            //initialValue: 'Alberto',
            //textCapitalization: TextCapitalization.words,
            onChanged:(value) {
              print( value);
            }, 
            validator: (value) {
              if ( value == null ) return 'Este campo es requerido';
              if ( value.isEmpty ) return 'Este campo es requerido';
              if ( value.trim().isEmpty ) return 'Este campo es requerido';
              return null;
            },
            // Queremos cambiar la apariencia fisica del boton
            decoration: InputDecoration(
              enabledBorder: border,
              focusedBorder: border.copyWith( borderSide: BorderSide(color: colors.primaryColor )),


              isDense: true,
              label: Text('Cualquier cosa'),
              hintText: 'Este es el hint Text',
              focusColor: colors.primaryColor,
              //prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primaryColor,),
              suffixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primaryColor,),
              icon: Icon(Icons.supervised_user_circle_outlined, color: colors.primaryColor,),
            ),
    );
  }
}