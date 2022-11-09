// ignore_for_file: prefer_const_constructors

import 'package:animation/custom_app_bar.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAnimation = false;
  List<Widget> dooot = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80) ,
        child: CustomAppBar(),
      ),
      // ignore: avoid_unnecessary_containers
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                if(isAnimation == false){
                  isAnimation = true;
                }else if (isAnimation == true){
                  isAnimation = false;
                }
              });
            },
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(
                        milliseconds: 200,
                      ),
                      bottom: isAnimation == true ? 100 : 0,
                     
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              AnimatedOpacity(
                opacity: isAnimation == true ? 1 : 0, 
                duration: Duration(milliseconds: 100),
                child: Text("Not Connect",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: isAnimation == true ? 0 : 1, 
                duration: Duration(milliseconds: 100),
                child: Text("Connect",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}