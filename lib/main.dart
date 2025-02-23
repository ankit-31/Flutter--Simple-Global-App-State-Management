import 'package:flutter/material.dart';
import 'package:globalorappstatemanager/counter_provider.dart';
import 'package:globalorappstatemanager/list_page.dart';
import 'package:globalorappstatemanager/listmap_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>ListMapProvider(),),
        ChangeNotifierProvider(create: (context)=>CounterProvider(),),

      ],
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:  ChangeNotifierProvider(create: (context)=>CounterProvider(),
        //this is new one
    //   home: ChangeNotifierProvider(create:(context)=>ListMapProvider(),
    //   child: ChangeNotifierProvider(create:(context)=>CounterProvider(),
    // child: ListPage(),
    //
    // ),
    //
    //   )
      // we can use multi prov ider for this
      home:ListPage(),//here we go for for higher hirearchy to manage global state..which is myapp() so put in above all
      //in runApp

       );
  }


}

class HomePage extends StatelessWidget{



  int _count=0;
  @override
  Widget build(BuildContext context) {

    print("Build function called");

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),

      ),
      body: Center(
        child:
      //  here it will rebuild the whole things but we need to rebuild the only one component so
      //  consumer is used
       // Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',style: TextStyle(fontSize: 25),),
//type is CounterProvider
     Consumer<CounterProvider>(builder:(Consumercontext, _, __){
       print("i am only text componentt");
      //  now only this component is rebuild it will build only Text with the help of builder of Consumer
       return Text('${Provider.of<CounterProvider>(Consumercontext,listen: true).getCount()}',style: TextStyle(fontSize: 25),);


     }
        )

      ,),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed:(){
            //as this function  are only for work so listen false
            Provider.of<CounterProvider>(context,listen:false).decrementCount();
          },child: Icon(Icons.remove)),
          FloatingActionButton(onPressed:(){
          //as this function  are only for work so listen false
            Provider.of<CounterProvider>(context,listen:false).incrementCount();
          },child: Icon(Icons.add)),
        ],
      ),
    );
  }
}


