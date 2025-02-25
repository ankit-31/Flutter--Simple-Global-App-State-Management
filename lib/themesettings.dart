import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globalorappstatemanager/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),


      ),
      body:
        Consumer<ThemeProvider>(builder: (_,provider,__){
          return  SwitchListTile.adaptive(value: provider.getThemeValue(),
              title: Text('Dark Mode'),
              subtitle: Text("Change theme here")

              , onChanged:(value){//adaptive  make to adapt accoring to iphone and android
               provider.updateTheme(value: value);


              });

        })
    );
  }
}