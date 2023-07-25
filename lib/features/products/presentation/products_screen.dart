import 'package:flowers/core/widgets/cached_network_image.dart';
import 'package:flowers/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/presentation/markting_basket.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../bloc/products_bloc.dart';
import 'product_details.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key, required this.categoryId, required this.categoryName}) : super(key: key);
  final String categoryName;
  final int categoryId;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<String> color = ["yellow", "Red", "white ", "pink", "blue", "purple"];

  final List<String> kind = ["tulip", "roze", "lily", "calla"];

  final List<String> occasion = ["blessing", "Newborn baby", "Birthday", "Valentine", "graduation"];
  late final ProductsBloc productsBloc;

  @override
  void initState() {
    productsBloc = ProductsBloc()..add(GetProductsEvent(categoryId: widget.categoryId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Get.to(DraggableWidget());
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black87,
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
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            const SizedBox(
                              width: 50,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: IconButton(
                                  icon: const Icon(Icons.filter_alt_sharp),
                                  onPressed: () {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) => SingleChildScrollView(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 1000,
                                          width: 1000,
                                          decoration: const BoxDecoration(
                                              color: Colors.white70,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                                          child: Column(
                                            children: [
                                              const Text("Color"),
                                              const SizedBox(height: 10),
                                              Container(width: 300, height: 7, color: Colors.pink[100]),
                                              SizedBox(
                                                height: 150,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                      child: Text(
                                                        color[index],
                                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: color.length,
                                                  shrinkWrap: true,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text("Kind"),
                                              const SizedBox(height: 10),
                                              Container(width: 300, height: 7, color: Colors.pink[100]),
                                              SizedBox(
                                                height: 150,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                      child: Text(
                                                        kind[index],
                                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: kind.length,
                                                  shrinkWrap: true,
                                                ),
                                              ),
                                              const Text("associen"),
                                              const SizedBox(height: 10),
                                              Container(width: 300, height: 7, color: Colors.pink[100]),
                                              SizedBox(
                                                height: 200,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                                                      child: Text(
                                                        occasion[index],
                                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: occasion.length,
                                                  shrinkWrap: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: state.getProductsStatus == GetProductsStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : state.getProductsStatus == GetProductsStatus.failed
                            ? Center(child: MainErrorWidget(
                                onTap: () {
                                  productsBloc.add(GetProductsEvent(categoryId: widget.categoryId));
                                },
                              ))
                            : MasonryGridView.count(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10.0,
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                        return const details();
                                      }));
                                    },
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 175,
                                            width: 300,
                                            child: CachedNetworkImage(
                                                url: state.products[index].image!.url!,
                                                hash: state.products[index].image!.blurhash!,
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80),
                                          ),
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                const SizedBox(height: 20),
                                                SizedBox(
                                                  width: 50,
                                                  child: Text(
                                                    state.products[index].name!,
                                                    softWrap: true,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 45,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        state.products[index].price!,
                                                        style: TextStyle(color: Colors.black87),
                                                      ),
                                                      if (state.products[index].priceAfterOffer != null)
                                                        Text(
                                                          state.products[index].priceAfterOffer!,
                                                          style: TextStyle(color: Colors.green),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                InkWell(
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .push(MaterialPageRoute(builder: (context) {
                                                            return const MarktingBasket();
                                                          }));
                                                        },
                                                        icon: const Icon(Icons.add)))
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
        ));
  }
}