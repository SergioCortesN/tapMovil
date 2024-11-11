import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/settings/global_values.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('TAP AGOS-DIC 2024',
          style: TextStyle(fontFamily: 'poke'),
          ),
      ),
      drawer: myDrawer(context),
    );
  }

  Widget myDrawer(context){
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/perfil.png'),
            ),
            accountName: Text('Serch CV'), 
            accountEmail: Text('22031446@itcelaya.edu.mx')
            ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/chal');
            } ,
            title: Text('Practica 1'),
            subtitle: Text('Challenge'),
            leading: Icon(Icons.code),
            trailing: Icon(Icons.chevron_right),
            onLongPress: () {
              
            },
          ),
          ListTile(
            onTap: () {},
            title: Text('Popular Movies'),
            subtitle: Text('Test API'),
            leading: Icon(Icons.movie),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            title: Text('Salir'),
            leading: Icon(Icons.exit_to_app),
            trailing: Icon(Icons.chevron_right),
          ),
          
          DayNightSwitcher(
            isDarkModeEnabled: GlobalValues.bandThemeDark.value, 
            onStateChanged: (isDarkModeEnabled){
              GlobalValues.bandThemeDark.value = isDarkModeEnabled;
            })
        ]
      ),
    );
  }
}