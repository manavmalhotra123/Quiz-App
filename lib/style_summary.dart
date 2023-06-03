import 'package:flutter/material.dart';

class Design extends StatelessWidget{
  const Design(this.data,{super.key});
  
  final String data;


  @override 
  Widget build(context){
    return Text(
      data,
      style: const TextStyle(
           fontSize: 10,
           color:Colors.white
      ),
    );
  }


}
