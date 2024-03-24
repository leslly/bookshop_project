import 'package:bookshop_project/utils/bottom_nav_bar/cart.dart';
import 'package:bookshop_project/utils/bottom_nav_bar/index/index_provider.dart';
import 'package:bookshop_project/utils/cart_provider.dart';
import 'package:bookshop_project/utils/global_button.dart';
import 'package:bookshop_project/utils/global_colors.dart';
import 'package:bookshop_project/utils/store_items/model/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDesc extends StatefulWidget {
  const ItemDesc({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  State<ItemDesc> createState() => _ItemDescState();
}

class _ItemDescState extends State<ItemDesc> {
  @override
  Widget build(BuildContext context) {
int index = 0;
    final itemProvider = context.watch<IndexProvider>();
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
          backgroundColor: GlobalColors.buttonColorwhite,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 257,
                          width: 375,
                          child: Image.asset(
                            widget.item.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                const SizedBox(height: 12),
                Text(
              '\u20a6${widget.item.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  Text(
            widget.item.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
                  const SizedBox(height: 10),
                  Text(
                    widget.item.description,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        ),
                    overflow: TextOverflow.fade,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: GlobalButton(
                      colorOfText: GlobalColors.whiteTextColor,
                      colorOfButton: GlobalColors.linearPurple,
                      nextPage: () {
                        Provider.of<CartProvider>(context, listen: false).addItemToCart(widget.item);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(item:itemProvider.items[index])));
                      },
                      text: 'Add to cart',
                    ),
                  ),
const SizedBox(height: 24),
                    Center(
                    child: GlobalButton(
                      colorOfText: GlobalColors.whiteTextColor,
                      colorOfButton: GlobalColors.linearPurple,
                      nextPage: () {
                        //Provider.of<CartProvider>(context, listen: false).addItemToCart(widget.item);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(item:itemProvider.items[index])));
                      },
                      text: 'Continue to cart',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}