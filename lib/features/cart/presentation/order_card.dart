import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../../core/models/order_response_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
    // required this.orderTime,
    required this.onTap,
  }) : super(key: key);

  final OrderModel order;
  final VoidCallback onTap;

  // final DateTime deliveryDate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
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
                        'orderNo: #',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Text(
                        '${order.id}',
                        style: TextStyle(
                          fontSize: size.width * .036,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'requestStatus: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Text(
                        'rejected',
                        style: TextStyle(
                          fontSize: size.width * .036,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'totalPrice: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${order.totalPrice} ',
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
                        'requestDate: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .036,
                        ),
                      ),
                      Text(
                        intl.DateFormat('yyyy-MM-dd').format(order.orderDate),
                        style: TextStyle(
                          fontSize: size.width * .036,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      if (order.status == 0)
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Order Done'))
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
