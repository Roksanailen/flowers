import 'package:flowers/core/widgets/error_widget.dart';
import 'package:flowers/features/products/presentation/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/widgets/main_text_failed.dart';
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
                            const EdgeInsets.only(top: 70, left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: MainTextField(
                                controller: TextEditingController(),
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                key: UniqueKey(),
                                height: 45,
                                child: ValueListenableBuilder<int>(
                                  valueListenable: _selectedCat,
                                  builder: (context, value, child) {
                                    return SizedBox(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                end: 15),
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
                                                          .types[_selectedCat
                                                              .value]
                                                          .id!));
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )),
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
                                            itemCount: state.categories.length,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 10),
                                                child: ListTile(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) {
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
