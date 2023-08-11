import 'package:flowers/core/widgets/error_widget.dart';
import 'package:flowers/features/cart/presentation/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/order_bloc.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderBloc, OrderState>(
        bloc: OrderBloc()..add(GetMyOrdersEvent()),
        listener: (context, state) {},
        builder: (context, state) {
          return state.status == GetOrdersStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : state.status == GetOrdersStatus.failed
                  ? Center(
                      child: MainErrorWidget(onTap: () {}),
                    )
                  : ListView.builder(
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) {
                        return OrderCard(
                            order: state.orders[index], onTap: () {});
                      },
                    );
        },
      ),
    );
  }
}
