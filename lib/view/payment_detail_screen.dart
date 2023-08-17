import 'package:flutter/material.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/widgets/custom_text.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          // title: CustomText(
          //   text: "Bill Details",
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15), 
              CustomText(
                  text: "Bill Detail",
                  fontSize: 18,
                  fontweight: FontWeight.w400,
                  // color: Colors.blue
              ),
              Divider(thickness: 1,),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Sub Total",
                    fontSize: 15,
                    // fontweight: ,
                  ),
                  CustomText(
                    text: "₹" + "1539",
                    fontSize: 15,
                    // fontweight: ,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Seller Discount",
                    fontSize: 15,
                    // fontweight: ,
                  ),
                  CustomText(
                    text: "(-)" + "31",
                    fontSize: 15,
                    // fontweight: ,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "GST",
                    fontSize: 15,
                    // fontweight: ,
                  ),
                  CustomText(
                    text: "(+)" + "180.99",
                    fontSize: 15,
                    // fontweight: ,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: "Total Ammount",
                      fontSize: 15,
                      // fontweight: ,
                      color: Colors.blue),
                  CustomText(
                      text: "₹" + "1689.24",
                      fontSize: 15,
                      color: Colors.blue
                      // fontweight: ,
                      ),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                  text: "Net Payble Ammount",
                  fontSize: 18,
                  fontweight: FontWeight.w400,
                  // color: Colors.blue
              ),
              const Divider(thickness: 1,),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: "Cash on Delivery",
                      fontSize: 15,
                      // fontweight: ,
                      // color: Colors.blue
                      ),
                  CustomText(
                      text: "₹" + "1689.24",
                      fontSize: 15,
                      color: Colors.green
                      // fontweight: ,
                      ),
                ],
              ),
            ],
          ),
        ));
  }
}
