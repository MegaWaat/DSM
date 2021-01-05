import 'package:dsm_flutter/provider/users.dart';
import 'package:dsm_flutter/routes/app_routes.dart';
import 'package:dsm_flutter/views/login.dart';
import 'package:dsm_flutter/views/user_form.dart';
import 'package:dsm_flutter/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
  ChangeNotifierProvider(create: (ctx)=>Users(),
  )
    ],child:MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.purple,

        visualDensity:VisualDensity.adaptivePlatformDensity,
      ),
     
      routes: {
        AppRoutes.LOGIN:(_)=>Login(),
        AppRoutes.HOME:(_)=>UserList(),
        AppRoutes.USER_FORM:(_)=>UserForm()
      },

    )
    );
  }
}

