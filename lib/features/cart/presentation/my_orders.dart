import 'package:flowers/core/toaster.dart';
import 'package:flowers/core/widgets/error_widget.dart';
import 'package:flowers/features/cart/presentation/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/order_bloc.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  late final OrderBloc orderBloc;
  late AppLocalizations appLocalizations;
  @override
  void initState() {
    orderBloc = OrderBloc();
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
      body: BlocConsumer<OrderBloc, OrderState>(
        bloc: orderBloc..add(GetMyOrdersEvent()),
        listener: (context, state) {
          if (state.completeOrderStatus == CompleteOrderStatus.loading) {
            Toaster.showLoading();
          } else if (state.completeOrderStatus == CompleteOrderStatus.failed) {
            Toaster.closeLoading();
            Toaster.showToast('Failed Please Check Your Internet');
          } else if (state.completeOrderStatus == CompleteOrderStatus.success) {
            Toaster.closeLoading();
          }
        },
        builder: (context, state) {
          return state.status == GetOrdersStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : state.status == GetOrdersStatus.failed
                  ? Center(
                      child: MainErrorWidget(onTap: () {
                        orderBloc.add(GetMyOrdersEvent());
                      }),
                    )
                  : RefreshIndicator(
                      onRefresh: () {
                        orderBloc.add(GetMyOrdersEvent());
                        return Future.value();
                      },
                      child: ListView.builder(
                        itemCount: state.orders.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                              order: state.orders[index],
                              onTap: () {
                                orderBloc.add(OrderCompletedEvent(
                                    id: state.orders[index].id));
                              });
                        },
                      ),
                    );
        },
      ),
    );
  }
}
