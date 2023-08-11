import 'package:flutter/material.dart';
class details extends StatelessWidget {
   const details({Key? key}) : super(key: key);

  @override
  Widget  build(BuildContext context) {

    return Scaffold( appBar: AppBar(),
    body:SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(
          width: 220,
          child:  Image.asset('assets/images/planets.jpg'),
        ),
       Stack(
            children: [
              Container(

                height: 450,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)
                  )
                ),
              ),
              

                    Row(
                      children: [
                        Padding(
                          padding:  const EdgeInsets.only(top: 50 ,left:40),
                          child: RichText(
                           text:const TextSpan(
                             children: [
                               TextSpan(text: "Mint",style: TextStyle(color: Colors.black87,
                                   fontWeight: FontWeight.bold,fontSize:25)),
                             ]
                           )

                          ),

                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50 ,left:120),
                          child: Text(
                              'Price30\$',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(top: 100,left: 15,right: 10),
                child: Text('MY NAME IS ROKSAN AND I LIVE IN AL Thowra city and i study it in aleppo ............................... ',style: TextStyle(
                  fontWeight: FontWeight.w600,fontSize: 15
                ),),
              )

                  ],
                ),
            ],
      )
          ),

      );










































  }}
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//
//               height: 300,
//               child: Image.asset("assets/images/offers.jpg",fit: BoxFit.fill),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//
//               child: Container(
//
//                 padding: EdgeInsets.all(16),
//                 child: Column(children: [
//                   Text("flower",
//                   style:TextStyle(
//                     fontSize: 20,
//                   ),),],
//
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//
//                 Expanded(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Container(
//                       padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.grey,
//                     ),
//                   ),),),
//     Row(
//                   children: [
//
//                     Text(
//                   "size"
//                 ),
//
//                 Text("Color"
//                     )
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                 Text("details"),
//                 SizedBox(height: 50,),
//                 Text(" my name is roksan"
//                     " and i live"
//                     " in althowra city and my "
//                     "age is 23")
//
//               ],
//               ),
//             )
//
//           ],
//         ),
//     ],
//       )
//
//     ),);
//   }
// }
