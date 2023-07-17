import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'Markting_basket.dart';
import 'details.dart';
class gifts extends StatelessWidget {
   gifts({Key? key}) : super(key: key);
  List <String> Color=["pink","blue","red","white","purple"];
  List <String> Kind=["gift  for a baby boy","gift  for a baby girl","gift  for Mom","gift  for friend","gift  for gradution"];
   List <String> associen =["blessing","Newborn baby","Birthday","Valentine","graduation"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black87,)),
            IconButton(onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined, color: Colors.black87,)),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(


                            color: Colors.white10,
                          )
                          , child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Planets", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          ],
                        ),
                        ),
                      ), SizedBox(
                        width: 50,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: IconButton(
                            icon: const Icon(Icons.filter_alt_sharp),
                            onPressed: () {
                              Get.bottomSheet(
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 1000,
                                    width: 1000,
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50))
                                    ),

                                    child: Column(
                                      children: [
                                        Text("Color"),
                                        SizedBox(height: 10),
                                        Container(width: 300,
                                            height: 7,
                                            color: Colors.pink[100]),

                                        SizedBox(
                                          height: 150,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 10),

                                                child: Text(
                                                  Color[index],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold
                                                  ),),
                                              );
                                            },
                                            itemCount: Color.length,
                                            shrinkWrap: true,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text("Kind"),
                                        SizedBox(height: 10),
                                        Container(width: 300,
                                            height: 7,
                                            color: Colors.pink[100]),

                                        SizedBox(
                                          height: 150,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 10),
                                                child: Text(
                                                  Kind[index], style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),),);
                                            },
                                            itemCount: Kind.length,
                                            shrinkWrap: true,
                                          ),
                                        ),

                                        Text("associen"),
                                        SizedBox(height: 10),
                                        Container(width: 300,
                                            height: 7,
                                            color: Colors.pink[100]),

                                        SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 60),
                                                child: Text(
                                                  associen[index],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold
                                                  ),),);
                                            },
                                            itemCount: associen.length,
                                            shrinkWrap: true,

                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),


                              );
                            },)
                      ),
                    ],),
                ],
              ),),
            Expanded(
              child: MasonryGridView.count(
                padding:  const EdgeInsets.symmetric(horizontal: 10),
                crossAxisCount:  2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10.0,
                itemCount: 15,
                itemBuilder: (context, outerIndex) {
                  return InkWell(
                    onTap: (){
                      Get.to(details());
                    },
                    child: Container(                    // width: context.width * .5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),                    ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 300
                            , key: GlobalKey(),
                            child: Image.asset('assets/images/Gifts.jpg',fit:BoxFit.fitWidth),
                          ),
                          FittedBox(
                            child: Row(                            children: [
                              const SizedBox(height: 20),                              SizedBox(
                                width: 50,
                                child: Text(
                                  'name',
                                  softWrap: true,
                                ),                              ),
                              SizedBox(                                width: context.width * .3,
                                child: Text(                                  // '1 Kg => ${state.ingredients[index].price}\$',
                                  '{ingredient.priceBy} كجم => {ingredient.price} ل.س',
                                  style: const TextStyle(color: Colors.black87),
                                ),                              ),
                              const SizedBox(height: 20),
                              InkWell(child: IconButton(onPressed: (){
                                Get.to(Markting_basket());
                              }, icon: Icon(Icons.add)))],
                            ),
                          ),
                        ],                    ),
                    ),
                  );
                },              ),
            ),
          ],
        )
    );
    }}


