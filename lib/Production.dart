import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appflowers/Jugs.dart';
import 'package:flutter_appflowers/Planets.dart';
import 'package:get/get.dart';
import 'package:flutter_appflowers/flowers.dart';
import 'package:flutter_appflowers/HandPocket.dart';
import 'package:flutter_appflowers/Gifts.dart';
class Production extends StatefulWidget {

  Production({Key? key}) : super(key: key);

  @override
  State<Production> createState() => _ProductionState();
}

class _ProductionState extends State<Production> with TickerProviderStateMixin {

  @override

  Widget build( BuildContext context) {
    TabController tabController=TabController(length: 4, vsync: this);
    List <String> Flower=["just flower","Hand pocket" , "flowers in jugs "];
    List <String> Planet=["planets "];
    List <String> Gifts=["gifts "];

    return Scaffold(
        backgroundColor:Color.fromRGBO(250, 210, 226, 0.9294117647058824),
        body: Container(
          padding: EdgeInsets.only(top: 70,left: 20,right: 20),
          child: Column(
              children: [Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search_rounded,color: Colors.black,),
                  ),
                ),
              ),
                SizedBox(
                  height: 30,
                ),
                TabBar(controller: tabController,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:Color.fromRGBO(154, 116, 128, 0.5411764705882353),
                    ),
                    tabs:[
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                 child: Text('Flower',style: TextStyle(
                   fontSize: 16,color: Colors.black87
                 ),),
               ),
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                 child: Text('Planets',style: TextStyle(
                     fontSize: 14,color: Colors.black87),
               ),),
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                 child: Text('Gifts',style: TextStyle(
    fontSize: 15,color: Colors.black87),
               ),),
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                 child: Text('Offers',style: TextStyle(
                     fontSize: 15,color: Colors.black87),
               ),),



             ]),
                Expanded(child: TabBarView(
                  controller: tabController,
                  children: [

                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: Flower.length,
                        itemBuilder: (context,index) {
                          return Card(
                            
                            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: ListTile(
                              leading: InkWell(onTap: (){
                                if(index==0){
                                Get.to(Flowers());}
                                else if(index==1){
                                  Get.to(handpocket());
                                }
                                else{
                               Get.to(jugs());
    }
                                },

                                  child: ( Icon(Icons.arrow_forward_ios_outlined,color: Colors.black87,))),
                              title: Text(Flower[index])
                            ),
                          );
                        }
                    ),


                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context,index) {
                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: ListTile(
                              leading: InkWell(
                                onTap: (){
                                  Get.to(planets());
                                },
                                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)),
                              title: Text(Planet[index]),
                            ),
                          );
                        }
                    ),

                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context,index) {
                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: ListTile(
                              leading: InkWell(
                                  onTap: (){
                                    Get.to(gifts());
                                  },
                                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)),
                              title: Text(Gifts[index]),
                            ),);


                        }
                    ),

                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context,index) {
                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: ListTile(
                              leading: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
                              title: Text("Flowers in jugs ${index+1}"),
                            ),
                          );
                        }
                    ),




                  ],


                ))

    ],
    ),
    ),


      );
  }
}



