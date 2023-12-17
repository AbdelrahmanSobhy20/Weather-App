import 'package:flutter/material.dart';
import 'package:weather_project/api/api.dart';
import 'package:weather_project/api/models/weather_api_response.dart';

import 'home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Terminal(),
    );
  }
}

 class Terminal extends StatelessWidget {
   const Terminal({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: FutureBuilder<WeatherApiResponse>(
         future: WeatherAPI().getAPIData('cairo'),
         builder: (context , snapshot){
           if(snapshot.hasData){
             print(snapshot.data!.toMap().toString());
             return Container();
           }
           if(snapshot.hasError){
             print(snapshot.error.toString());
             return Container();
           }
           return const Center(child: SizedBox(
             height: 100,
             width: 100,
             child: CircularProgressIndicator(),
           ),);
         },
       ),
     );
   }
 }
