import 'package:flutter/material.dart';
import 'package:futkart/controller/user_controller.dart';
import 'package:futkart/model/user_data_model.dart';
import 'package:futkart/services/user_services.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/custom_textfeild.dart';
import 'package:get/get.dart';

class EditAddAddressScreen extends StatefulWidget {
  String appTitle;
  String btName;
  String type;
  UserDataModel? userDataM;
  // int userId;

  EditAddAddressScreen(
      {super.key,
      required this.appTitle,
      required this.btName,
      required this.type,
      // required this.userId,
      required this.userDataM});

  @override
  State<EditAddAddressScreen> createState() => _EditAddAddressScreenState();
}

class _EditAddAddressScreenState extends State<EditAddAddressScreen> {


  final UserController userController = Get.put(UserController());
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
              text: widget.appTitle,
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
                  const SizedBox(height: 15),
                  CustomTextfeild(
                    controller: _phone,
                    hintText: "mobile No.",
                    validator: (value) {
                      if (value!.length < 10) {
                        return "Invalid data";
                      } else
                        return null;
                    },
                    // initialText: widget.type == "Bill" ? widget.userDataM!.billing!.phone : widget.userDataM!.shipping!.phone,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isloading=true;
                        });
                        if (widget.type == "Bill") {
                          UserService.editBillingAdd(
                                  widget.userDataM!.id.toString(),
                                  _firstName.text.toString(),
                                  _lastName.text.toString(),
                                  _address1.text.toString(),
                                  _address2.text.toString(),
                                  _city.text.toString(),
                                  _postCode.text.toString(),
                                  _country.text.toString(),
                                  _state.text.toString(),
                                  _phone.text.toString())
                              .then((value) {
                            userController
                                .fetchUserData(widget.userDataM!.id.toString());
                                
                            Get.back();
                            setState(() {
                              isloading=false;
                            });
                          });
                        } else if (widget.type == "Ship") {
                          UserService.editShippingAdd(
                                  widget.userDataM!.id.toString(),
                                  _firstName.text.toString(),
                                  _lastName.text.toString(),
                                  _address1.text.toString(),
                                  _address2.text.toString(),
                                  _city.text.toString(),
                                  _postCode.text.toString(),
                                  _country.text.toString(),
                                  _state.text.toString(),
                                  _phone.text.toString())
                              .then((value) {
                            userController
                                .fetchUserData(widget.userDataM!.id.toString());
                            Get.back();
                            setState(() {
                              isloading=false;
                            });
                          });
                          print("this is ship ");
                        } else {
                          print("this is an unwanted ");
                        }
                      } else {
                        print("not valid");
                      }
                    },
                    btname: isloading ? "Loading...": widget.btName,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
