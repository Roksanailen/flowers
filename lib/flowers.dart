import 'package:flutter/material.dart';

class Flowers extends StatelessWidget {
  const Flowers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .8,
                crossAxisCount: 2,
                mainAxisSpacing: 9,
                crossAxisSpacing: 6),
            itemCount: 5,
            itemBuilder: (context, index) {
              return buildCartItems();
            }),
      ),
    );
  }

  Widget buildCartItems() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 3,
                blurRadius: 5)
          ],
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
              Container(
                width: 100,
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  'assets/images/bs.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(children: [
                  Text('\$',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ]),
              )
            ])
          ],
        ),
      ),
    );
  }
}
