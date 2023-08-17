import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/product_tile.dart';

class MyFavouritesScreen extends StatefulWidget {
  const MyFavouritesScreen({super.key});

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
          title: CustomText(
            text: "Favourites",
            color: Colors.white,
          )),
      body:  AlignedGridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
            itemCount: 3,
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            // axisDirection: AxisDirection.up,
            itemBuilder: (BuildContext context, int index) { 
              //  return  ProductTile();
              return Container();
            },
              ),
    );
  }
}
