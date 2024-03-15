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

    return Consumer<IndexProvider>(builder: (context, provider, child){
      final items = _searchText.isEmpty ? provider.items : provider.items.isEmpty
          ? [] : provider.items.where((e) => e.title.toLowerCase().contains(_searchText.toLowerCase())).toList();
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
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
                              "Hi, ",
                              style: TextStyle(
                              fontSize:15,
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                                  Text(
                                    username,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                              const SizedBox(width: 10,),
                              Image.asset(
                              'assets/images/emoji_teeth.png',
                              height: 25,
                              width: 25,
                            ),
                                ],
                              ),
                            Text(
                              "Welcome to OneStop",
                              style: TextStyle(
                              fontSize:15,
                              color:GlobalColors.linear,
                              ),
                            )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                          // go to cart
                          const Cart();
                          },
                          child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                          shape:BoxShape.circle,
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
                  const SizedBox(height: 15),

                  //SEARCH BAR
                  Container(
                    height: 36,
                    width: 257,
                    padding: const EdgeInsets.only(top: 0, left: 16, bottom: 0, right: 0),
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
                          child: const Icon(CupertinoIcons.search)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      // empty
                    )
                  ),

                        const SizedBox(height: 20),

                        if(items.isEmpty)
                          const SearchNotFound()
                        else
                        //GRID OF ITEMS
                        // ListView.separated(
                        //     shrinkWrap: true,
                        //       physics: const NeverScrollableScrollPhysics(),
                        //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                        //       itemBuilder: (context, index){
                        //         final item = items[index];
                        //         return ItemDesign(item: item, callback: (item){
                        //           //Navigate to your next screen using the course object
                        //           if(mounted) {
                        //             Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemDesc()));
                        //           }
                        //         });
                        //       },
                        //       separatorBuilder: (context, index){
                        //         return const SizedBox(height: 14);
                        //       },
                        //       itemCount: items.length
                        //   ),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //padding: const EdgeInsets.only(bottom: 100),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 115, crossAxisSpacing: 10),
// crossAxisSpacing -Gives space between the two columns
// due to somepadding whom i don'tknow where is, there is already space betwwen them
                    itemBuilder: (context, index){
                                final item = items[index];
                                return ItemDesign(item: item, callback: (item){
                                  //Navigate to your next screen using the course object
                                  if(mounted) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemDesc()));
                                  }
                                });
                              },
                                itemCount: items.length,
                    ),
                ]
            ),
          ),
        ),
      );
    });
  }

}
