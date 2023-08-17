import 'package:flutter/material.dart';
import 'package:futkart/controller/user_controller.dart';
import 'package:futkart/model/user_data_model.dart';
import 'package:futkart/services/user_services.dart';
import 'package:futkart/view/home_screen.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/custom_textfeild.dart';
import 'package:get/get.dart';

class AddAddressScreen extends StatefulWidget {
  String? uid;

  AddAddressScreen({super.key,required this.uid});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {


  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _firstName = new TextEditingController();
  final TextEditingController _lastName = new TextEditingController();
  final TextEditingController _address1 = new TextEditingController();
  final TextEditingController _address2 = new TextEditingController();
  final TextEditingController _city = new TextEditingController();
  final TextEditingController _postCode = new TextEditingController();
  final TextEditingController _country = new TextEditingController();
  final TextEditingController _state = new TextEditingController();
  final TextEditingController _phone = new TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            elevation: 0,
            title: CustomText(
              text: "Add Address",
              color: Colors.white,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    controller: _firstName,
                    hintText: "First name",
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextfeild(
                    controller: _lastName,
                    hintText: "Last name",
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                    // initialText: widget.type == "Bill" ? widget.userDataM!.lastName : widget.userDataM!.lastName,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfeild(
                    controller: _address1,
                    hintText: "Address 1",
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                    // initialText: widget.type == "Bill" ? widget.userDataM!.billing!.address1 : widget.userDataM!.shipping!.address1,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfeild(
                    controller: _address2,
                    hintText: "Address 2",
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                    // initialText: widget.type == "Bill" ? widget.userDataM!.billing!.address2 : widget.userDataM!.shipping!.address2,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfeild(
                    controller: _city,
                    hintText: "City",
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                    // initialText: widget.type == "Bill" ? widget.userDataM!.billing!.city : widget.userDataM!.shipping!.city
                  ),
                  const SizedBox(height: 15),
                  CustomTextfeild(
                    controller: _postCode,
                    hintText: "Post code",
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                    // initialText: widget.type == "Bill" ? widget.userDataM!.billing!.postcode : widget.userDataM!.shipping!.postcode,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfeild(
                    controller: _state,
                    hintText: "State",
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                    // initialText: widget.type == "Bill" ? widget.userDataM!.billing!.state : widget.userDataM!.shipping!.state,
                  ),
                  // const SizedBox(height: 15),
                  // CustomTextfeild(
                  //   controller: _country,
                  //   hintText: "Country",
                  // ),
                  // const SizedBox(height: 15),
                  // CustomTextfeild(
                  //   controller: _phone,
                  //   hintText: "mobile No.",
                  //   validator: (value) {
                  //     if (value!.length < 10) {
                  //       return "Invalid data";
                  //     } else
                  //       return null;
                  //   },
                  // ),
                  const SizedBox(height: 25),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isloading=true;
                        });
                        
                          UserService.addAddress(
                                  widget.uid.toString(),                       //  uid comes here
                                  _firstName.text.toString(),
                                  _lastName.text.toString(),
                                  _address1.text.toString(),
                                  _address2.text.toString(),
                                  _city.text.toString(),
                                  _postCode.text.toString(),
                                  _country.text.toString(),
                                  _state.text.toString())
                              .then((value) {
                                Get.offAll(HomeScreen(uIid: widget.uid));
                            // userController
                            //     .fetchUserData(widget.userDataM!.id.toString());
                            setState(() {
                              isloading= false;
                            });
                          });
                      } else {
                        print("not valid");
                      }
                    },
                    btname: isloading ? "Loading...": "Add",
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
