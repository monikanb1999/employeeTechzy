import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List decodedResponse=[];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:Scaffold(
      appBar:AppBar(
    title: const Text('AppBar Demo'),
        actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.add_alert),
    tooltip: 'go back',
    onPressed: () {
    Navigator.pop(context);}
    )],),
      body: Column(
        children: [
          Center(child: Text('Basic Information', style: TextStyle(fontSize: 25),)),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children:[
            Text('Name',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                Text('ABCDE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),

          ]
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
            Text('Age ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                Text('26',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),

          ]
          ) ,
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children:[
            Text('DOB',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                Text('26/06/1999',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),


          ]
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Center( child:         ElevatedButton(onPressed: ()async{
           http.Response response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'),) as http.Response;
          if(response.statusCode==200) {
          decodedResponse =jsonDecode(response.body);
          print(decodedResponse);
           }
            print('employees present');
          }, child: Text('Get List of the employees present'))),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: decodedResponse.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      trailing:  Text(
                        decodedResponse[index]['name'],
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(decodedResponse[index]['email']));
                }),
          ),
        ],
      ),

    )
    );
  }
}
