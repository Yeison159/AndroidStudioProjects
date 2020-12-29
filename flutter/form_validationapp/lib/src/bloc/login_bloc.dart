import 'dart:async';

import 'package:form_validationapp/src/bloc/validator.dart';

class LoginBloc with Validators {
// el broadcast es para poder ser escuchado por varioas personas

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // recuperar los datos del stream

Stream<String> get emailStream => _emailController.stream;
Stream<String> get passStream => _passwordController.stream.transform(validarPassword);

  // Insertar valores al stream

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

 void dispose(){
   _emailController?.close();
   _passwordController?.close();
  }
}
