import 'package:flowers/core/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../../../core/widgets/cached_network_image.dart';
import '../../products/presentation/product_details.dart';

class ProductsHomeListWidget extends StatefulWidget {
  final Function()? onPressed;
  const ProductsHomeListWidget({
    Key? key,
    required this.products,
    this.onPressed,
    required this.title,
  }) : super(key: key);
  final List<ProductModel> products;
  final String title;
  @override
  State<ProductsHomeListWidget> createState() => _ProductsHomeListWidgetState();
}

class _ProductsHomeListWidgetState extends State<ProductsHomeListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          if (widget.products.isNotEmpty) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                    onTap: widget.onPressed,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'more',
                            style: TextStyle(),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          )
                        ])),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            const SizedBox(height: 5),
            Directionality(
              textDirection: Directionality.of(context),
              child: AspectRatio(
                aspectRatio: 1.8,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const details();
                          }));
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 160,
                                child: Stack(
                                  children: [
                                    BlurHash(
                                        hash: widget
                                            .products[index].image!.blurhash!),
                                    SizedBox(
                                      height: 150,
                                      width: 160,
                                      child: CachedNetworkImage(
                                          url: widget
                                              .products[index].image!.url!,
                                          hash: widget
                                              .products[index].image!.blurhash!,
                                          width: 80,
                                          height: 80),
                                    ),
                                  ],
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          widget.products[index].name!,
                                          softWrap: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                        child: Column(
                                          children: [
                                            Text(
                                              widget.products[index].price!,
                                              style: TextStyle(
                                                  decoration: widget
                                                              .products[index]
                                                              .priceAfterOffer !=
                                                          null
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : null),
                                            ),
                                            if (widget.products[index]
                                                    .priceAfterOffer !=
                                                null)
                                              Text(
                                                widget.products[index]
                                                    .priceAfterOffer!,
                                                style: const TextStyle(
                                                    color: Colors.green),
                                              ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
