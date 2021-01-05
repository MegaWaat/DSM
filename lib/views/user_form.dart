import 'package:dsm_flutter/models/user.dart';
import 'package:dsm_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);


    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de Usuario"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save), onPressed: () async{
                final isValid = _form.currentState.validate();
                if(isValid){
                  _form.currentState.save();

                  await Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData['id'],
                      name: _formData['name'],
                      email: _formData['email'],
                      avatarUrl: _formData['avatarUrl'],
                    ),
                  );
                  Navigator.of(context).pop();
                }


          })
        ],
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator())
          :Padding(
        padding: EdgeInsets.all(15),
      child: Form(
        key:_form,
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: _formData['name'],
              decoration: InputDecoration(labelText: 'Nome'),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Nome inválido';
            }

            if (value.trim().length < 3) {
              return 'Nome muito pequeno. No mínimo 3 letras.';
            }

            return null;
          },

                onSaved: (value) => _formData['name'] = value
            ),

            TextFormField(
                initialValue: _formData['email'],
              decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value
            ),
            TextFormField(
                initialValue: _formData['avatarUrl'],
              decoration: InputDecoration(labelText: 'URL DO AVATAR'),
                onSaved: (value) => _formData['avatarUrl'] = value
            )
          ],
        ),
      ),
      ),
    );

  }
}
