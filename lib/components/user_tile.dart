import 'package:dsm_flutter/models/user.dart';
import 'package:dsm_flutter/provider/users.dart';
import 'package:dsm_flutter/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
  final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
   ? CircleAvatar(child: Icon(Icons.person))
    :CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading:avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: (){
            Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                    arguments: user,
            );
          },
          color: Colors.purple,
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: (){
            showDialog(context: context,builder: (ctx)=>AlertDialog(
              title: Text('Excluir'),
              content: Text('Tem certeza?'),
              actions: <Widget>[
                FlatButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Não')),
                FlatButton(onPressed: (){
                  Provider.of<Users>(context, listen: false)
                      .remove(user);
                  Navigator.of(context).pop();
                }, child: Text('Sim'))
              ],
            ));


          },
          color: Colors.red,
      )],
      ),
      )
    );
  }
}
