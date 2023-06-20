import 'package:flutter/material.dart';
import 'Jugs.dart';
import 'Planets.dart';
import 'package:get/get.dart';
import 'flowers.dart';
import 'HandPocket.dart';
import 'Gifts.dart';
class Production extends StatefulWidget {

  const Production({Key? key}) : super(key: key);

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
        body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
              children: [Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search_rounded,color: Colors.black,),
                  ),
                ),
              ),
            const SizedBox(
                  height: 30,
                ),
                TabBar(controller: tabController,
                    isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                  color:
                      const Color.fromRGBO(154, 116, 128, 0.5411764705882353),
                    ),
                    tabs:[
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                    child: const Text(
                      'Flower',
                      style: TextStyle(
                   fontSize: 16,color: Colors.black87
                 ),),
               ),
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                    child: const Text(
                      'Planets',
                      style: TextStyle(
                     fontSize: 14,color: Colors.black87),
               ),),
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                    child: const Text(
                      'Gifts',
                      style: TextStyle(
    fontSize: 15,color: Colors.black87),
               ),),
               Container(
                 width: 50,
                 height: 30,
                 alignment: Alignment.center,
                    child: const Text(
                      'Offers',
                      style: TextStyle(
                     fontSize: 15,color: Colors.black87),
               ),),



             ]),
                Expanded(child: TabBarView(
                  controller: tabController,
                  children: [

                    ListView.builder(
                    physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: Flower.length,
                        itemBuilder: (context,index) {
                          return Card(
                            
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                            child: ListTile(
                              leading: InkWell(onTap: (){
                                if(index==0){
                                    Get.to(const Flowers());
                                  }
                                else if(index==1){
                                    Get.to(const handpocket());
                                }
                                else{
                                    Get.to(const jugs());
    }
                                },

                                child: (const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black87,
                                ))),
                              title: Text(Flower[index])
                            ),
                          );
                        }
                    ),


                    ListView.builder(
                    physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context,index) {
                          return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                            child: ListTile(
                              leading: InkWell(
                                onTap: (){
                                Get.to(const planets());
                                },
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              )),
                              title: Text(Planet[index]),
                            ),
                          );
                        }
                    ),

                    ListView.builder(
                    physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context,index) {
                          return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                            child: ListTile(
                              leading: InkWell(
                                  onTap: (){
                                Get.to(const gifts());
                                  },
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              )),
                              title: Text(Gifts[index]),
                            ),);


                        }
                    ),

                    ListView.builder(
                    physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context,index) {
                          return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                            child: ListTile(
                          leading: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
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



