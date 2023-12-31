import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flowers/core/widgets/cached_network_image.dart';
import 'package:flowers/core/widgets/error_widget.dart';
import 'package:flowers/dependency_injection.dart';
import 'package:flowers/features/cart/presentation/cart_screen.dart';
import 'package:flowers/features/products/requests/products_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/bloc/cart_bloc.dart';
import '../bloc/products_bloc.dart';
import 'product_details.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);
  final String categoryName;
  final int categoryId;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late final ProductsBloc productsBloc;
  late AppLocalizations appLocalizations;
  @override
  void initState() {
    productsBloc = ProductsBloc();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    productsBloc.add(GetProductsEvent(
        params: GetProductsParams(
      cagtegoryId: widget.categoryId,
    )));
    super.didChangeDependencies();
  }

  var globalKey = GlobalKey<CartIconKey>();
  late final Function(GlobalKey) _runAddToCartAnimation;

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      gkCart: globalKey,
      receiveCreateAddToCardAnimationMethod: (key) {
        _runAddToCartAnimation = key;
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black87,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartScreen()));
                  },
                  icon: AddToCartIcon(
                    key: globalKey,
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black87,
                    ),
                  )),
            ],
          ),
          body: BlocProvider(
            create: (context) => productsBloc,
            child: BlocConsumer<ProductsBloc, ProductsState>(
              bloc: productsBloc,
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Category: ' + widget.categoryName,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: state.getProductsStatus ==
                              GetProductsStatus.loading
                          ? const Center(child: CircularProgressIndicator())
                          : state.getProductsStatus == GetProductsStatus.failed
                              ? Center(child: MainErrorWidget(
                                  onTap: () {
                                    productsBloc.add(GetProductsEvent(
                                        params: GetProductsParams(
                                            cagtegoryId: widget.categoryId)));
                                  },
                                ))
                              : MasonryGridView.count(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10.0,
                                  itemCount: state.products.length,
                                  itemBuilder: (context, index) {
                                    var _widgetKey = GlobalKey();
                                    return InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ProductDetails(
                                            product: state.products[index],
                                          );
                                        }));
                                      },
                                      child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 175,
                                              width: 300,
                                              child: Container(
                                                key: _widgetKey,
                                                child: CachedNetworkImage(
                                                    url: state.products[index]
                                                        .image!.url!,
                                                    hash: state.products[index]
                                                        .image!.blurhash!,
                                                    fit: BoxFit.cover,
                                                    width: 300,
                                                    height: 175),
                                              ),
                                            ),
                                            FittedBox(
                                              child: Row(
                                                children: [
                                                  const SizedBox(height: 20),
                                                  SizedBox(
                                                    width: 50,
                                                    child: Text(
                                                      state.products[index]
                                                          .name!,
                                                      softWrap: true,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 45,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          state.products[index]
                                                              .price!,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black87),
                                                        ),
                                                        if (state
                                                                .products[index]
                                                                .priceAfterOffer !=
                                                            null)
                                                          Text(
                                                            state
                                                                .products[index]
                                                                .priceAfterOffer!,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  InkWell(
                                                      child: IconButton(
                                                          onPressed: () async {
                                                            await _runAddToCartAnimation(
                                                                _widgetKey);
                                                            await globalKey
                                                                .currentState!
                                                                .runCartAnimation();
                                                            serviceLocator<
                                                                    CartBloc>()
                                                                .add(UpdateCartEvent(
                                                                    product: state
                                                                            .products[
                                                                        index]));
                                                            productsBloc.add(
                                                                UpdateScreenEvent(
                                                                    product: state
                                                                            .products[
                                                                        index]));
                                                          },
                                                          icon: const Icon(
                                                              Icons.add)))
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
                );
              },
            ),
          )),
    );
  }
}
