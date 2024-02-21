import 'package:firechomon/models/user_model.dart';
import 'package:firechomon/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);


    return StreamBuilder<Usuario?>(
      stream: authProvider.user,
      builder: (_, snapshot) {
        
      },

    );
  }
}