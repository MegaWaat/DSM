import 'package:dsm_flutter/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: EdgeInsets.all(20),
         child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: new TextStyle(color: Colors.white,fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Nome de Usuario",
                      labelStyle: TextStyle(color: Colors.black87)
                    ),
                  ),
                  TextFormField(

                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: new TextStyle(color: Colors.white,fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.black87)
                    ),
                  ),
                  ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(
                            AppRoutes.HOME);
                      },
                      child: Text(
                        "Entrar",style: TextStyle(color: Colors.black87),
                      ),
                      color: Colors.white,
                    ),
                  )

                ],



              )
          )
      )
    );

  }
}
