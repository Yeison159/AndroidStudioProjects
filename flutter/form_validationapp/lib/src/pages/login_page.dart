import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validationapp/src/bloc/login_bloc.dart';
import 'package:form_validationapp/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _crearFondo(context),
        _loginForm(context)
      ],
    ));
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0),
      ])),
    );

    final circulo = Container(
        width: 90.0,
        height: 90.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Color.fromRGBO(255, 255, 255, 0.25)));

    return Stack(
      children: [
        fondoMorado,
        Positioned(child: circulo, top: 90.0, left: 30.0,),
        Positioned(child: circulo, top: -40.0, right: - 30.0,),
        Positioned(child: circulo, bottom: -50.0, right: -10.0,),
        Positioned(child: circulo, bottom: 120.0, right: 20.0,),
        Positioned(child: circulo, bottom: -50.0, left: -20.0,),
        Container(
          padding: EdgeInsets.only(top: 65.0),
          child: Column(
            children: [
              Icon(Icons.person_pin_circle, color: Colors.white, size: 90.0),
              SizedBox(height: 10.0, width: double.infinity,),
              Text('Yeison Guzman', style: TextStyle(color: Colors.white, fontSize: 20.0),)
            ],
          ),
        )
      ],
    );
  }

 Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(
            height: 180.0,
          )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(vertical: 40.0),
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: [
                Text('Ingreso', style: TextStyle(
                  fontSize: 20.0
                ),),
                SizedBox(height: 10.0,),
                _crearEmail(context, bloc),
                SizedBox(height: 30.0,),
                _crearPassWord(context, bloc),
                SizedBox(height: 30.0,),
                _crearBotton()
              ],
            ),
          ),
          Text('¿Olvido la contraseña?'),
            SizedBox(height: 100.0)
          ],
      ),
    );
 }

 Widget _crearEmail(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: bloc.changeEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  counterText: snapshot.data,
                  labelText: 'Correo electronico',
                  hintText: 'ejemplo@correo.com',
                  icon: Icon(Icons.alternate_email, color: Colors.deepPurple,
                  )
              ),
            ),
          );
        },
    );
 }

  Widget _crearPassWord(BuildContext context, LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            onChanged: bloc.changePass,
            obscureText: true,
            decoration: InputDecoration(
              errorText: snapshot.error,
              counterText: snapshot.data,
                labelText: 'Contraseña',
                icon: Icon(Icons.lock_outline, color: Colors.deepPurple,)
            ),
          ),
        );
      },
    );
  }

  Widget _crearBotton(){
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('ingresar'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        elevation: 0.0,
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: (){}
    );
  }
}
