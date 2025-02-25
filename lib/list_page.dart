import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globalorappstatemanager/add_data_page.dart';
import 'package:globalorappstatemanager/listmap_provider.dart';
import 'package:globalorappstatemanager/themesettings.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return[
              PopupMenuItem(child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 11,),
                  Text('Settings')

                ],
              ),onTap:
              (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
              },)

            ];

          })
        ],
      ),
      body: Consumer<ListMapProvider>(builder: (context,provider,__){
        var allData =provider.getData();
        return allData.isNotEmpty?ListView.builder(itemBuilder: (context,index){
          return ListTile(
            title: Text('${allData[index]['name']}'),
            subtitle: Text('${allData[index]['mobileNO']}'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    context.read<ListMapProvider>().updateData({
                      "name":"Updated Name",
                      "mobileNO":"111111100"
                    }, index);//to listen false

                  }, icon: Icon(Icons.edit,color: Colors.green,),),
                  IconButton(onPressed: (){
                    context.read<ListMapProvider>().deleteData(index);

                  }, icon: Icon(Icons.delete),color: Colors.red,)
                ],
              ),
            ),
          );
        },itemCount: allData.length,):Center(
          child: Text('No contacts yet'),
        );
      },),
      floatingActionButton: FloatingActionButton(onPressed:(){
        // context.read<ListMapProvider>().addData({
        //   "name":"Contact Name",
        //   "mobileNO":"9849946466"
        // });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDataPage()));
      },
      child:Icon(Icons.add),),

    );
  }

}