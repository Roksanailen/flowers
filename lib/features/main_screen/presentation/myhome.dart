import 'package:flowers/core/bloc/language_bloc.dart';
import 'package:flowers/features/main_screen/presentation/home_ads.dart';
import 'package:flowers/features/main_screen/presentation/product_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/bloc/theme_service_bloc.dart';
import '../../../core/widgets/main_text_failed.dart';
import '../../../dependency_injection.dart';
import 'bloc/home_bloc.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  late AppLocalizations appLocalizations;
  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                moonIcon,
                color: Colors.black87,
              ),
              onPressed: () {
                serviceLocator<ThemeServiceBloc>().add(ChangeThemeEvent());
              },
            ),
            IconButton(
                onPressed: () {
                  serviceLocator<LanguageBloc>().add(ToggleLanguageEvent());
                },
                icon: const Icon(Icons.language_rounded))
          ],
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: HomeBloc()
            ..add(GetHomeFlowersEvent())
            ..add(GetHomeGiftsEvent())
            ..add(GetHomePlantsEvent())
            ..add(GetHomeOffersEvent()),
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView(children: [
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
                (state.offersProducts.isEmpty &&
                        state.getOffersStatus == GetOffersStatus.success)
                    ? const SizedBox()
                    : state.getOffersStatus == GetOffersStatus.loading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ))
                        : HomeAdsList(products: List.of(state.offersProducts)),
                state.getFlowersStatus == GetFlowersStatus.loading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: AspectRatio(
                          aspectRatio: 1.8,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      end: 5, top: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 150,
                                );
                              }),
                        ))
                    : ProductsHomeListWidget(
                        products: List.of(state.flowers),
                        title: appLocalizations.newFlowers),
                state.getPlantsStatus == GetPlantsStatus.loading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: AspectRatio(
                          aspectRatio: 1.8,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      end: 5, top: 8),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 150,
                                );
                              }),
                        ))
                    : ProductsHomeListWidget(
                        products: List.of(state.plants),
                        title: appLocalizations.newPlants),
                state.getGiftsStatus == GetGiftsStatus.loading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: AspectRatio(
                          aspectRatio: 1.8,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      end: 5, top: 8),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 150,
                                );
                              }),
                        ))
                    : ProductsHomeListWidget(
                        products: List.of(state.gifts),
                        title: appLocalizations.newGifts)
              ]),
            );
          },
        ));
  }
}
