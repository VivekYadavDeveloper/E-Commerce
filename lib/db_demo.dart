import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:futkart/db/db_helper.dart';
import 'package:futkart/db/db_helper_model.dart';

class DbDemo extends StatefulWidget {
  const DbDemo({super.key});

  @override
  State<DbDemo> createState() => _DbDemoState();
}

class _DbDemoState extends State<DbDemo> {

  DbHelperModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("insert"),
            onPressed: () async {
              await DbHelper.dbhelper.insertData(
                {
                  // DbHelper.columnId: "45638",
                  // DbHelper.columnPName: "shivam"
                }
              );
            },
          ),
          ElevatedButton(
            child: Text("read"),
            onPressed: () async {
              var datac =await DbHelper.dbhelper.getData();
              print(datac);
              // data = DbHelperModel.fromJson(data as Map<String, dynamic>) as List<Map<String, dynamic>>;
              model=datac[0];
              setState(() {
                
              });
            },
          ),
          // ElevatedButton(
          //   child: Text("update"),
          //   onPressed: () async {
          //     await DbHelper.dbhelper.updateData(
          //       {
          //        DbHelper.columnId: "45678",
          //        DbHelper.columnPName: "updated"
          //       }
          //     );
          //   },
          // ),
          ElevatedButton(
            child: Text("delete"),
            onPressed: () async {
              await DbHelper.dbhelper.deleteData("");
            },
          ),

          SizedBox(height: 25),
          // Text(
          //   'id:- ${model?.id}',
          // ),
          Text(
            'product name:- ${model?.product_name}',
          )
        ],
      ),
    );
  }
}
