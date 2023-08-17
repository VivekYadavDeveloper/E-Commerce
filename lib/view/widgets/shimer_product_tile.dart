import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:shimmer/shimmer.dart';

// import '../model/new_product_model2.dart';

class ShimerProductTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.10),
            highlightColor: Colors.white.withOpacity(0.06),
            child: Container(
              height: 180,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.10),
            highlightColor: Colors.white.withOpacity(0.06),
            child: Container(
              height: 10,
              width: 100,
              clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(height: 4),
          Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.10),
            highlightColor: Colors.white.withOpacity(0.06),
            child: Container(
              height: 10,
              width: 70,
              clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(height: 10),
            Shimmer.fromColors(
               baseColor: Colors.grey.withOpacity(0.10),
            highlightColor: Colors.white.withOpacity(0.06),
              child: Container(
                height: 20,
                width: 30,
                clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
              ),
            ),
          SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.10),
            highlightColor: Colors.white.withOpacity(0.06),
            child: Container(
              height: 40,
              width: 60,
              clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}