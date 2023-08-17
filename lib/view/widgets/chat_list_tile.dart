import 'package:flutter/material.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:get/get.dart';
// import 'package:inductusjobs/view/widgets/custom_text.dart';


class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              // height: 30,
              // color: Colors.amberAccent,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black54, width: 0.5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        Row(
                         children: [
                            Text(
                            'Anu malik',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              
                            ),
                           ),
                            SizedBox(width: 4),
                            CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green
                           )
                         ],
                       ),
                        const SizedBox(height: 2),
                        const Text(
                        'Hi...',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          
                        ),
                       ),
                      ],
                    )
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: "5 min ago ",
                        fontSize: 12,
                      ),
                    ],
                  )

                ],
              )
            ); 
  }
}