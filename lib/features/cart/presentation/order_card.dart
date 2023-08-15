import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

import '../../../core/models/order_response_model.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key? key,
    required this.order,
    // required this.orderTime,
    required this.onTap,
  }) : super(key: key);

  final OrderModel order;
  final VoidCallback onTap;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late AppLocalizations appLocalizations;
  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: size.width * .9,
        height: size.width * .4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * .025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        l10n.orderno,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Text(
                        '${widget.order.id}',
                        style: TextStyle(
                          fontSize: size.width * .036,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        l10n.requeststatus,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Text(
                        widget.order.status == 0
                            ? l10n.pending
                            : widget.order.status == 2
                                ? l10n.rejected
                                : l10n.completed,
                        style: TextStyle(
                          fontSize: size.width * .036,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        l10n.totalprice,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${widget.order.totalPrice} ',
                            style: TextStyle(
                              fontSize: size.width * .036,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        l10n.requestdate,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Text(
                        intl.DateFormat('yyyy-MM-dd')
                            .format(widget.order.orderDate),
                        style: TextStyle(
                          fontSize: size.width * .036,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      if (widget.order.status == 0)
                        ElevatedButton(
                            onPressed: widget.onTap,
                            child: const Text('Order Done'))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
