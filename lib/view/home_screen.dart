import 'package:flutter/material.dart';
import 'package:futkart/controller/user_controller.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/tabs/cart_screen.dart';
import 'package:futkart/view/tabs/category_tab.dart';
import 'package:futkart/view/tabs/home_tab.dart';
import 'package:futkart/view/tabs/my_account_tab.dart';
import 'package:futkart/view/tabs/order_tab.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/controller/tab_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  String? uIid;

  HomeScreen({super.key, required this.uIid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TabCController tabc = Get.put(TabCController());
  List<String> apptitle = ['Futcart', 'Products', 'My Orders', 'My account'];
  final UserController userController = Get.put(UserController());
  bool hasInternet = false;

  // ConnectivityResul

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  void getData() {
    userController.fetchUserData(widget.uIid ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: CustomText(
            text: apptitle[tabc.pindex.value],
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          actions: [
            // tabc.pindex.value == 0
            //     ?
            //     IconButton(
            //         onPressed: () {
            //           Get.to(const NotificationScreen());
            //         },
            //         icon: const Icon(
            //           Icons.notifications,
            //           color: Colors.white,
            //         ))
            //     : const SizedBox(),
            // tabc.pindex.value == 1
            //     ? IconButton(
            //         onPressed: () {
            //           Get.to(SerachProductScreen());
            //         },
            //         icon: const Icon(
            //           Icons.search,
            //           color: Colors.white,
            //         ))
            //     : const SizedBox(),
            // IconButton(
            //   onPressed: (){
            //     Get.to(WishlistScreen());
            //   },
            //   icon: Icon(Icons.favorite_border, color: Colors.white,)
            // ),
            IconButton(
                onPressed: () {
                  Get.to(const CartScreen());
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                )),
          ],
        ),
        body: tabc.pindex.value == 0
            ? HomeTab(
                tab: tabc,
              )
            : tabc.pindex.value == 1
                ? CategoryTab(prodCat: tabc.categ.value)
                : tabc.pindex.value == 2
                    ? const OrderTab()
                    : MyAccountTab(userId: widget.uIid),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: tabc.pindex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.black,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_rounded,
                ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Account',
              )
            ],
            onTap: (index) {
              setState(() {
                tabc.pindex.value = index;
              });
            }),
      );
    });
  }
}
