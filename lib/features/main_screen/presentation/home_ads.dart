import 'dart:async';

import 'package:flowers/core/app_text_styles.dart';
import 'package:flowers/core/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/widgets/cached_network_image.dart';

class HomeAdsList extends StatefulWidget {
  const HomeAdsList({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<ProductModel> products;
  @override
  State<HomeAdsList> createState() => _HomeAdsListState();
}

class _HomeAdsListState extends State<HomeAdsList> {
  final PageController pageController = PageController(initialPage: 200);
  late AppLocalizations appLocalizations;
  late Size size;
  final indexValue = ValueNotifier<double>(0);
  late Timer timer;
  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    timer = Timer.periodic(const Duration(seconds: 10), (time) {
      pageController.animateToPage(pageController.page!.floor() + 1,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    });
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: indexValue,
      builder: (context, value, state) {
        return Container(
            width: size.width,
            height: size.height * .3,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                if (widget.products.isNotEmpty) ...[
                  PageView.builder(
                    controller: pageController,
                    onPageChanged: ((value) {
                      indexValue.value =
                          pageController.page! % widget.products.length;
                    }),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            url: widget.products[value.floor()].image!.url!,
                            width: size.width,
                            height: size.height * .3,
                            hash:
                                widget.products[value.floor()].image!.blurhash!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    width: size.width,
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        gradient: const LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center)),
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(appLocalizations.ourOffers,
                          style: AppTextStyles.normal(
                              color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ]
              ],
            ));
      },
    );
  }
}
