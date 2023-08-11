import 'package:flowers/core/app_text_styles.dart';
import 'package:flowers/core/models/products_model.dart';
import 'package:flowers/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
                url: product.image!.url!,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
                hash: product.image!.blurhash),
          ),
          Container(
            height: 450,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 40),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: product.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ])),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 120, right: 40),
                      child: Text(
                        'Price ${product.price} S.P',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25),
                child: Text(
                  'Description',
                  style: AppTextStyles.bold(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Text(
                  product.description!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
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
