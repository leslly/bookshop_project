import 'package:bookshop_project/screen/search_not_found.dart';
import 'package:bookshop_project/utils/bottom_nav_bar/cart.dart';
import 'package:bookshop_project/utils/bottom_nav_bar/index/index_provider.dart';
import 'package:bookshop_project/utils/config.dart';
import 'package:bookshop_project/utils/global_colors.dart';
import 'package:bookshop_project/utils/store_items/item_desc.dart';
import 'package:bookshop_project/utils/store_items/item_design_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        _searchText = searchController.text.trim();
      });
    });
    super.initState();
  }

  String _searchText = '';

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Consumer<IndexProvider>(builder: (context, provider, child) {

      final items = _searchText.isEmpty ? provider.items : provider.items.isEmpty
              ? [] : provider.items.where((e) => e.title.toLowerCase().contains(_searchText.toLowerCase())).toList();

int index = 0;
final itemProvider =context.watch<IndexProvider>();

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.only(top: 32, left: 25, right: 25, bottom: 25),
          child: SingleChildScrollView(
            child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Hello, ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              username,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/hand_wave.png',
                              height: 25,
                              width: 25,
                            ),
                          ],
                        ),
                        Text(
                          "Welcome to OneStop",
                          style: TextStyle(
                            fontSize: 15,
                            color: GlobalColors.linear,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // go to cart
                       Cart(item: itemProvider.items[index]);
                    },
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GlobalColors.smallTextColorGrey,
                      ),
                      child: Image.asset(
                        'assets/images/cart_icon.png',
                        // height: 10,
                        // width: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              //SEARCH BAR
              Center(
                child: Container(
                  height: 36,
                  width: 257,
                  padding: const EdgeInsets.only(
                      top: 0, left: 16, bottom: 0, right: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        height: 1,
                        fontSize: 14,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            ////search for course
                          },
                          child: const Icon(CupertinoIcons.search)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
              'Recommendation',
              style:TextStyle(
              fontSize:20,
              )
              ),

              if (items.isEmpty)
                const SearchNotFound()
              else
//GRID OF ITEMS
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.only(bottom: 100),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 30,
                    mainAxisExtent:300
                  ),
                  // crossAxisSpacing -Gives space between the two columns
                  // due to somepadding whom i don'tknow where is, there is already space betwwen them
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ItemDesign(
                        item: item,
                        callback: (item) {
                          //Navigate to your next screen using the course object
                          if (mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  ItemDesc(item: item,),
                              ),
                            );
                          }
                        });
                  },
                  itemCount: items.length,
                ),
            ]),
          ),
        ),
      );
    });
  }
}
