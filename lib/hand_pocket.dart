import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'features/cart/presentation/markting_basket.dart';
import 'features/products/presentation/product_details.dart';

class handpocket extends StatelessWidget {
  const handpocket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black87,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black87,
                )),
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
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hand pockets",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: MasonryGridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10.0,
                itemCount: 15,
                itemBuilder: (context, outerIndex) {
                  return InkWell(
                    onTap: () {
                      Get.to(details());
                    },
                    child: Container(
                      // width: context.width * .5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            key: GlobalKey(),
                            child: Image.asset('assets/images/planets.jpg', fit: BoxFit.fitWidth),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    'name',
                                    softWrap: true,
                                  ),
                                ),
                                SizedBox(
                                  width: context.width * .3,
                                  child: Text(
                                    // '1 Kg => ${state.ingredients[index].price}\$',
                                    '{ingredient.priceBy} كجم => {ingredient.price} ل.س',
                                    style: const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                    child: IconButton(
                                        onPressed: () {
                                          Get.to(MarktingBasket());
                                        },
                                        icon: Icon(Icons.add)))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
