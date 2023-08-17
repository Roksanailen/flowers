import 'package:flowers/core/toaster.dart';
import 'package:flowers/core/widgets/cached_network_image.dart';
import 'package:flowers/core/widgets/main_button.dart';
import 'package:flowers/dependency_injection.dart';
import 'package:flowers/features/cart/presentation/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/bloc/cart_bloc.dart';
import '../../products/presentation/product_details.dart';
import 'order_placed_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<String> color = [
    'yellow',
    'red',
    'white',
    'pink',
    'blue',
    'purple'
  ];

  final List<String> kind = ['tulip', 'roze', 'lily', 'calla'];

  final List<String> occasion = [
    'blessing',
    'newbornBaby',
    'birthday',
    'valentine',
    'graduation'
  ];
  late final CartBloc cartBloc;
  late AppLocalizations appLocalizations;
  @override
  void initState() {
    cartBloc = serviceLocator<CartBloc>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => cartBloc,
          child: BlocConsumer<CartBloc, CartState>(
            bloc: cartBloc,
            listener: (context, state) {
              if (state.status == GetOrdersStatus.loading) {
                Toaster.showLoading();
              } else if (state.status == GetOrdersStatus.success) {
                Toaster.closeLoading();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OrderPlacedScreen()));
              } else if (state.status == GetOrdersStatus.failed) {
                Toaster.closeLoading();
                Toaster.showToast(appLocalizations.failedPleaseTryAgain);
              }
            },
            builder: (context, state) {
              return state.products.isEmpty
                  ? const Center(
                      child: Text('Empty Cart Please Add Some Products'),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: MasonryGridView.count(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10.0,
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductDetails(
                                      product: state.products[index],
                                    );
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
                                            url: state
                                                .products[index].image!.url!,
                                            hash: state.products[index].image!
                                                .blurhash!,
                                            fit: BoxFit.cover,
                                            width: 300,
                                            height: 175),
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
                                                    state
                                                        .products[index].price!,
                                                    style: const TextStyle(
                                                        color: Colors.black87),
                                                  ),
                                                  if (state.products[index]
                                                          .priceAfterOffer !=
                                                      null)
                                                    Text(
                                                      state.products[index]
                                                          .priceAfterOffer!,
                                                      style: const TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            InkWell(
                                                child: IconButton(
                                                    onPressed: () {
                                                      cartBloc.add(
                                                          UpdateCartEvent(
                                                              isDelete: true,
                                                              product: state
                                                                      .products[
                                                                  index]));
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove)))
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
                        SizedBox(
                            height: 50,
                            child: MainButton(
                              height: 50,
                              width: 80,
                              onTap: () async {
                                final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)));
                                if (date != null) {
                                  cartBloc.add(CreateOrderEvent(params: {
                                    'flowers': state.products,
                                    'order_date': date.toString()
                                  }));
                                }
                              },
                              title: 'Create Order',
                            ))
                      ],
                    );
            },
          ),
        ));
  }
}
