// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:get/get.dart';

// import 'features/cart/presentation/markting_basket.dart';
// import 'features/products/presentation/product_details.dart';

// class jugs extends StatelessWidget {
//   const jugs({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.search,
//                   color: Colors.black87,
//                 )),
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.shopping_cart_outlined,
//                   color: Colors.black87,
//                 )),
//           ],
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                           decoration: const BoxDecoration(
//                             color: Colors.white10,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "jugs",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 50,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: MasonryGridView.count(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 10.0,
//                 itemCount: 15,
//                 itemBuilder: (context, outerIndex) {
//                   return InkWell(
//                     onTap: () {
//                       Get.to(const details());
//                     },
//                     child: Container(
//                       // width: context.width * .5,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 200,
//                             width: 300,
//                             key: GlobalKey(),
//                             child: Image.asset('assets/images/planets.jpg', fit: BoxFit.fitWidth),
//                           ),
//                           FittedBox(
//                             child: Row(
//                               children: [
//                                 const SizedBox(height: 20),
//                                 const SizedBox(
//                                   width: 50,
//                                   child: Text(
//                                     'name',
//                                     softWrap: true,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: context.width * .3,
//                                   child: const Text(
//                                     // '1 Kg => ${state.ingredients[index].price}\$',
//                                     '{ingredient.priceBy} كجم => {ingredient.price} ل.س',
//                                     style: TextStyle(color: Colors.black87),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 InkWell(
//                                     child: IconButton(
//                                         onPressed: () {
//                                           Get.to(const MarktingBasket());
//                                         },
//                                         icon: const Icon(Icons.add)))
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ));
//   }
// }
