import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flowers/core/widgets/error_widget.dart';
import 'package:flowers/features/products/presentation/product_details.dart';
import 'package:flowers/features/products/presentation/products_screen.dart';
import 'package:flowers/features/products/requests/products_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/bloc/cart_bloc.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../../core/widgets/main_text_failed.dart';
import '../../../dependency_injection.dart';
import '../../cart/presentation/cart_screen.dart';
import '../bloc/products_bloc.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late ValueNotifier<int> _selectedCat;
  late ProductsBloc productsBloc;
  late AppLocalizations appLocalizations;
  TextEditingController searchController = TextEditingController();
  var globalKey = GlobalKey<CartIconKey>();
  late final Function(GlobalKey) _runAddToCartAnimation;
  ValueNotifier<String?> colorsSelected = ValueNotifier(null);
  @override
  void initState() {
    _selectedCat = ValueNotifier(0);
    productsBloc = ProductsBloc();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
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
        create: (context) {
          return productsBloc..add(GetTypesEvent());
        },
        child: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {
            if (state.getTypesStatus == GetTypesStatus.success) {
              productsBloc.add(GetCategoriesEvent(
                  typeId: state.types[_selectedCat.value].id!));
            }
          },
          builder: (context, state) {
            return state.getTypesStatus == GetTypesStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : state.getTypesStatus == GetTypesStatus.failed
                    ? Center(
                        child: MainErrorWidget(onTap: () {
                          productsBloc.add(GetTypesEvent());
                        }),
                      )
                    : Container(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  MainTextField(
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    controller: searchController,
                                    prefixIcon: const Icon(
                                      Icons.search_rounded,
                                      color: Colors.black,
                                    ),
                                    textInputAction: TextInputAction.go,
                                    onSubmitted: (value) {
                                      productsBloc.add(GetProductsEvent(
                                          params: GetProductsParams(
                                              search: value)));
                                    },
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        searchController.clear();
                                        colorsSelected.value = null;
                                        productsBloc.add(GetTypesEvent());
                                      },
                                      icon: const Icon(Icons.close)),
                                  if (state.getProductsStatus ==
                                      GetProductsStatus.success)
                                    IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      const Text("Color"),
                                                      const SizedBox(
                                                          height: 10),
                                                      Container(
                                                          width: 300,
                                                          height: 7,
                                                          color:
                                                              Colors.pink[100]),
                                                      SizedBox(
                                                        height: 50,
                                                        child:
                                                            ValueListenableBuilder(
                                                                valueListenable:
                                                                    colorsSelected,
                                                                builder:
                                                                    (context,
                                                                        value,
                                                                        _) {
                                                                  return ListView
                                                                      .builder(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          colorsSelected.value =
                                                                              state.colors[index];
                                                                          productsBloc
                                                                              .add(GetProductsEvent(params: GetProductsParams(search: searchController.text, color: colorsSelected.value)));
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          width:
                                                                              75,
                                                                          decoration: BoxDecoration(
                                                                              color: state.colors[index] == value ? Colors.grey : null,
                                                                              borderRadius: BorderRadius.circular(25)),
                                                                          padding:
                                                                              const EdgeInsets.all(10),
                                                                          margin:
                                                                              const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                10,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            state.colors[index]!,
                                                                            style:
                                                                                const TextStyle(fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    itemCount: state
                                                                        .colors
                                                                        .length,
                                                                    shrinkWrap:
                                                                        true,
                                                                  );
                                                                }),
                                                      ),
                                                      const SizedBox(
                                                        height: 50,
                                                      ),
                                                      if (state.occasion
                                                          .isNotEmpty) ...[
                                                        const Text("associen"),
                                                        const SizedBox(
                                                            height: 10),
                                                        Container(
                                                            width: 300,
                                                            height: 7,
                                                            color: Colors
                                                                .pink[100]),
                                                        SizedBox(
                                                          height: 200,
                                                          child:
                                                              ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                margin: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        60),
                                                                child: Text(
                                                                  state.occasion[
                                                                          index] ??
                                                                      '',
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              );
                                                            },
                                                            itemCount: state
                                                                .occasion
                                                                .length,
                                                            shrinkWrap: true,
                                                          ),
                                                        ),
                                                      ]
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        icon:
                                            const Icon(Icons.filter_alt_sharp))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            searchController.text.isNotEmpty
                                ? Expanded(
                                    child: GridView.builder(
                                        itemCount: state.products.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: .7),
                                        itemBuilder: (context, index) {
                                          var globalKey2 = GlobalKey();
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return ProductDetails(
                                                    product:
                                                        state.products[index],
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
                                                        key: globalKey2,
                                                        child:
                                                            CachedNetworkImage(
                                                                url: state
                                                                    .products[
                                                                        index]
                                                                    .image!
                                                                    .url!,
                                                                hash: state
                                                                    .products[
                                                                        index]
                                                                    .image!
                                                                    .blurhash!,
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 300,
                                                                height: 175),
                                                      ),
                                                    ),
                                                    FittedBox(
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                              height: 20),
                                                          SizedBox(
                                                            width: 50,
                                                            child: Text(
                                                              state
                                                                  .products[
                                                                      index]
                                                                  .name!,
                                                              softWrap: true,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 45,
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  state
                                                                      .products[
                                                                          index]
                                                                      .price!,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                                if (state
                                                                        .products[
                                                                            index]
                                                                        .priceAfterOffer !=
                                                                    null)
                                                                  Text(
                                                                    state
                                                                        .products[
                                                                            index]
                                                                        .priceAfterOffer!,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .green),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 20),
                                                          InkWell(
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    await _runAddToCartAnimation(
                                                                        globalKey2);
                                                                    await globalKey
                                                                        .currentState!
                                                                        .runCartAnimation();
                                                                    serviceLocator<
                                                                            CartBloc>()
                                                                        .add(UpdateCartEvent(
                                                                            product:
                                                                                state.products[index]));
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .add)))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : SizedBox(
                                    key: UniqueKey(),
                                    height: 45,
                                    child: ValueListenableBuilder<int>(
                                      valueListenable: _selectedCat,
                                      builder: (context, value, child) {
                                        return SizedBox(
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            padding: const EdgeInsetsDirectional
                                                .only(end: 15),
                                            itemCount: state.types.length,
                                            itemBuilder: (context, index) {
                                              return TypeChoiceChip(
                                                title: state.types[index].name!,
                                                isActive: index == value,
                                                onTap: () {
                                                  _selectedCat.value = index;
                                                  productsBloc.add(
                                                      GetCategoriesEvent(
                                                          typeId: state
                                                              .types[
                                                                  _selectedCat
                                                                      .value]
                                                              .id!));
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    )),
                            if (searchController.text.isEmpty)
                              Expanded(
                                  child: state.getCategoriesStatus ==
                                          GetCategoriesStatus.loading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.white),
                                        )
                                      : state.getCategoriesStatus ==
                                              GetCategoriesStatus.failed
                                          ? Center(
                                              child: MainErrorWidget(onTap: () {
                                                productsBloc.add(
                                                    GetCategoriesEvent(
                                                        typeId: state
                                                            .types[_selectedCat
                                                                .value]
                                                            .id!));
                                              }),
                                            )
                                          : ListView.builder(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  state.categories.length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30,
                                                      vertical: 10),
                                                  child: ListTile(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return ProductsScreen(
                                                          categoryId: state
                                                              .categories[index]
                                                              .id!,
                                                          categoryName: state
                                                              .categories[index]
                                                              .attributes!
                                                              .name!,
                                                        );
                                                      }));
                                                    },
                                                    leading: const Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(state
                                                        .categories[index]
                                                        .attributes!
                                                        .name!),
                                                  ),
                                                );
                                              }))
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }
}

class TypeChoiceChip extends StatelessWidget {
  const TypeChoiceChip({
    Key? key,
    required this.isActive,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(154, 116, 128, 0.5411764705882353),
              )
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
