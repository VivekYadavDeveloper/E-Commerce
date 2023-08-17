import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:futkart/controller/order_list_controller.dart';
import 'package:futkart/view/widgets/order_tile.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}
 
class _OrderTabState extends State<OrderTab> {

  final OrderListController orederListController = Get.put(OrderListController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              backgroundColor: Colors.redAccent,
              unselectedBackgroundColor: Colors.grey[400],
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              labelStyle:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                    child: SizedBox(
                        width: width / 3.5,
                        child: Center(
                            child: CustomText(
                                text: 'Active', color: Colors.white)))),
                Tab(
                    child: SizedBox(
                        width: width / 3.5,
                        child: Center(
                            child: CustomText(
                                text: 'Delivered', color: Colors.white)))),
                Tab(
                    child: SizedBox(
                        width: width / 3.5,
                        child: Center(
                            child: CustomText(
                                text: 'Cancelled', color: Colors.white)))),
              ],
            ),
            Obx(() {
              if(orederListController.isLoading.value) {
                return const Expanded(child: Center(child: CircularProgressIndicator()));
              }
              return Expanded(
              child: TabBarView(
                children: <Widget>[

                  ///////////////////////////////////////////////////////////////     active order
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: ListView.separated(
                      itemCount: orederListController.orderList.where((element) => element.status == "processing" || element.status == "onhold").toList().length,
                        itemBuilder: (buildcontext, index) {
                          return OrderTile(
                            orderTyp: 'Active',
                            oColor: Colors.blue,
                            orderListModel: orederListController.orderList.where((element) => element.status == "processing" || element.status == "onhold").toList()[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                      )
                  ),

                  

                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: ListView.separated(
                        itemCount: orederListController.orderList.where((element) => element.status == "completed").toList().length,
                        itemBuilder: (buildcontext, index) {
                          return OrderTile(
                            orderTyp: 'Delivered',
                            oColor: Colors.green,
                            orderListModel: orederListController.orderList.where((element) => element.status == "completed").toList()[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                      )),

                  
                  
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: ListView.separated(
                        itemCount: orederListController.orderList.where((element) => element.status == "cancelled" || element.status == "draft" || element.status == "refunded").toList().length,
                        itemBuilder: (buildcontext, index) {
                          return OrderTile(
                            orderTyp: 'Cancelled',
                            oColor: Colors.red,
                            orderListModel: orederListController.orderList.where((element) => element.status == "cancelled" || element.status == "draft" || element.status == "refunded").toList()[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                      )),

                      
                ],
              ),
            );
            })
          ],
        ),
      ),
    );
  }
}
    