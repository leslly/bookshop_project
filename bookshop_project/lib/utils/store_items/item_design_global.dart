import 'package:bookshop_project/utils/store_items/model/items_model.dart';
import 'package:flutter/material.dart';

/*
* TypeDef allows you to utilize a function as a variable, field, or boundary.
* Out typedef is MyCallBack, the function Course has been made the variable course
*
* These are the item that are on the home screen. Acts as a button that leads to item description.
*
* The container wrapped in the inkwell below is the design for each item widget button that navigates to
* the item_desc*/
typedef MyCallback = Function(Item item);

class ItemDesign extends StatelessWidget {
  const ItemDesign({Key? key, required this.item, required this.callback}) : super(key: key);
  final Item item;
  final MyCallback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        callback(item);
      },
      child: Container(
       // width: 160,
       // height: 400,
        decoration: BoxDecoration(
color: Colors.lightBlueAccent,
        border: Border.all(
        color: Colors.black,width:2,
        style:BorderStyle.solid,
        )
        ),
        child: Column(
          children: [
            //IMAGE
            Container(
              //height: 203,
              width: 160,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(17),
                border: Border.all(
        color: Colors.black,width:2,
        style:BorderStyle.solid,
        )
              ),
              child: Image.asset(
                        item.image,
                        fit: BoxFit.contain,
                      ),
            ),
            const SizedBox(height: 13,),
            //TITLE
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  //PRICE
                  Text(
                          '\u20a6${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
          ],
        ),
      ),
    );
  }
}
