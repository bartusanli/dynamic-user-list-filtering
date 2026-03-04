import 'package:flutter/material.dart';
class inkwellcontainers extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Centered Inkwell Containers"),),
      body:Center(
        child:InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
              child:
                  ElevatedButton(onPressed: (){}, child: Text("julia Iron"),)
              ),
              SizedBox(height: 50,),
              Container(
                  child:
                  ElevatedButton(onPressed: (){}, child: Text("Ellan Welch"),)
              ),
              SizedBox(height: 50,),
              Container(
                  child:
                  ElevatedButton(onPressed: (){}, child: Text("Ashley Jhonsson"),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}