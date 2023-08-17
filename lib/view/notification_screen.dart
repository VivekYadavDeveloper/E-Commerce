import 'package:flutter/material.dart';
import 'package:futkart/view/widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            elevation: 0,
            title: CustomText(
              text: "Notifications",
              color: Colors.white,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: CustomText(
              text: "No notifications yet",
              fontSize: 20,
            )
          )










          // child: ListView.separated(
          //   itemCount: 50,
          //   itemBuilder: (Buildcontext, index) {
          //     return Container(
          //         // height: 60,
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //         // decoration: BoxDecoration(
          //         //     color: Colors.grey[100],
          //         //     borderRadius: const BorderRadius.all(Radius.circular(10))),
          //         child: Row(
          //           children: [
          //             // Icon(Icons.notification_important_sharp, size: 30,),
          //             Stack(
          //               children: [
          //                 Image.asset(
          //                   "images/bell.png",
          //                   height: 30,
          //                   width: 25,
          //                   fit: BoxFit.fill,
          //                 ),
          //                 // CircleAvatar(radius: 5, backgroundColor: Colors.red)
          //                 const Positioned(
          //                   top: 0,
          //                   right: 0,
          //                   child: CircleAvatar(radius: 5, backgroundColor: Colors.red)
          //                 )
          //               ],
          //             ),
          //             const SizedBox(width: 5),
          //             Expanded(
          //               // width: double.infinity,
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     "5+ New jobs",
          //                     maxLines: 1,
          //                     style: TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w500,
          //                         overflow: TextOverflow.ellipsis),
          //                   ),
          //                   Text(
          //                     "we find new mwmbers for you",
          //                     maxLines: 2,
          //                     style: TextStyle(
          //                         fontSize: 12,
          //                         overflow: TextOverflow.ellipsis),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 CustomText(
          //                     text: '3/03/23',
          //                     // text: 'jhvxh\bjxhsvbh',
          //                     fontSize: 12,
          //                     color: Colors.black45),
          //                 // CustomText(
          //                 //   text: '3-03-23',
          //                 //   // text: 'jhvxh\bjxhsvbh',
          //                 //   fontSize: 12,
          //                 //   color: Colors.black45
          //                 // ),
          //                 CustomText(
          //                     text: '3:45 AM',
          //                     // text: 'jhvxh\bjxhsvbh',
          //                     fontSize: 10,
          //                     color: Colors.black45),
          //               ],
          //             )
          //           ],
          //         ));
          //   },
          //   separatorBuilder: (BuildContext context, int index) {
          //     return const Divider(height: 20);
          //   },
          // ),
        ));
  }
}
