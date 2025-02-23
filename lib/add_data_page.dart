import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'listmap_provider.dart';

class AddDataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),

      ),
      body: Center(
        child: IconButton(onPressed: (){
    context.read<ListMapProvider>().addData({
      "name":"Name",
      "mobileNO":"982828282"
    });
        }, icon:Icon(Icons.add) ),
      ),
    );
  }

}