import 'package:bookshop_project/utils/cart_provider.dart';
import 'package:bookshop_project/utils/global_colors.dart';
import 'package:bookshop_project/utils/store_items/model/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, required this.item}) : super(key: key);

final Item item;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: GlobalColors.buttonColorwhite,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
              color: GlobalColors.linear,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: GlobalColors.buttonColorwhite,
          elevation: 0,
          actions:   const [
            Icon(CupertinoIcons.cart),
            SizedBox(width: 20.0,)
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                    child: ListView.builder(
                      reverse: false,
                      physics: const BouncingScrollPhysics(),
                      itemCount: provider.cartItems.length,
                        itemBuilder: (context, index) {
                        final  item = provider.cartItems[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                    children: [
                                  Image.asset( item.image,
                                  height: 100,
                                  width: 100,
                                  ),
                                  const SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.title,
                                            style: const TextStyle(
                                            fontSize:16,
                                            fontWeight:FontWeight.bold
                                            ),
                                            ),
                                            const SizedBox(height: 5,),
                                        Text(item.price.toStringAsFixed(2),
                                            style: const TextStyle(
                                            fontSize:16,
                                            fontWeight:FontWeight.bold
                                            ),
                                            ),
                                    ],
                                  ),
                                  ],
                                  ),
                                  ]
                                  ),
                            )
                                    // child: ListTile(
                                    //   leading: Image.asset(item.image),// course image
                                    //   title: Text(item.title),
                                    //   // course title
                                    //   trailing:IconButton(
                                    //     icon: const Icon(CupertinoIcons.trash),
                                    //     onPressed: () => context.read<CartProvider>().removeItemFromCart(index),
                                    //   ),// clear button
                                    //   subtitle: Text(item.price.toStringAsFixed(2)),// course price
                                    // ),
                          );
                        },
                    ),
                ),
                ///// TOTAL + PAY NOW
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: GlobalColors.profileBorder,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                'Total Price',
                              style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 16,
                            ),
                            ),
                            Text(
                              provider.calculateTotal(),
                              style: const TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        // pay now button
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Row(
                            children: [
                              Text(
                                'Pay Now',
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                              size: 16,
                              color: CupertinoColors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}