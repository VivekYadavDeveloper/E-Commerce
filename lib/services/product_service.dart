import 'dart:convert';
import 'package:futkart/constants/url.dart';
import 'package:futkart/model/category_list_model.dart';
import 'package:futkart/model/category_product_list_model.dart';
import 'package:futkart/model/product_detail_model.dart';
import 'package:futkart/model/product_list_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  ////////////////////////////////////////////////////////////////     get product list
  static Future<List<ProductListModel>?> productList(int prodCat) async {
    var url = baseurl + categoryProductlist + prodCat.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("product api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    // print(data);
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      // print(data);
      return productListModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }

////////////////////////////////////////////////////////////////     get category product list
  static Future<List<CategoryProductListModel>?> categoryProductList(
      int prodCat) async {
    var url = baseurl + categoryProductlist + prodCat.toString();
    print(
        "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(prodCat);
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("product api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      return categoryProductListModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }

  ////////////////////////////////////////////////////////////////     get category product list  for pagination
  static Future<List<CategoryProductListModel>?> addItemToProductList(
      int prodCat, int start) async {
    print(
        "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
    print(start);
    var url = baseurl +
        categoryProductlist +
        prodCat.toString() +
        "&page=" +
        start.toString();
    print(
        "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(prodCat);
    print(url);
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print(
        "//////////////////////////    add product api call  //////////////////////////////////////");
    print("add  product api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      print(data);
      return categoryProductListModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }




  ////////////////////////////////////////////////////////////////     get filtered category product list  for pagination
  static Future<List<CategoryProductListModel>?> addFilterItemToProductList(
      int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder
    ) async {

    String parameter = "";

    if (strSearch != "") {
      parameter += "&search=$strSearch";
    }
    if (pageSize != null) {
      parameter += "&per_page=$pageSize";
    }
    if (pageNumber != null) {
      parameter += "&page=$pageNumber";
    }
    if (tagName != "") {
      parameter += "&tag=$tagName";
    }
    if (categoryId != "") {
      parameter += "&category=$categoryId";
    }
    if (sortBy != "") {
      parameter += "&orderby=$sortBy";
    }
    if( sortOrder != null){
      parameter += "&order=$sortOrder";
    }

    var url = "https://futcart.com/wp-json/wc" +
        "/v3/products?per_page=10" +
        parameter;
    print(
        "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(url);
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print(
        "//////////////////////////    add product api call  //////////////////////////////////////");
    print("add  product api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      print(data);
      return categoryProductListModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }





  //////////////////////////////////////////////////////////////////////////    get single product
  static Future<DetailProductModel?> getSingleProduct(int prodId) async {
    var url = baseurl + singleProduct + prodId.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("Single product api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("////////////////////////////////////////////////////////////////");
    var data = jsonDecode(await response.stream.bytesToString());
    // print(data);
    // var data = await response.stream.bytesToString();
    // print(data);
    if (response.statusCode == 200) {
      print(
          "******************************************************************");
      print(data);
      return DetailProductModel.fromJson(data);
    } else {
      print("failed");
      return null;
    }
  }

  ////////////////////////////////////////////////////////////////////    get product category list
  static Future<List<CategoryListModel>?> productCateroryList() async {
    var url = baseurl + productCategory + "?per_page=100";
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("category api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    // print(data);
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      print(data);
      return categoryListModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }

  ////////////////////////////////////////////////////////////////     filter product list
  static Future<List<CategoryProductListModel>?> filterProductList(
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder
  ) async {
    String parameter = "";

    if (strSearch != "") {
      parameter += "&search=$strSearch";
    }
    if (pageSize != null) {
      parameter += "&per_page=$pageSize";
    }
    if (pageNumber != null) {
      parameter += "&page=$pageNumber";
    }
    if (tagName != "") {
      parameter += "&tag=$tagName";
    }
    if (categoryId != "") {
      parameter += "&category=$categoryId";
    }
    if (sortBy != "") {
      parameter += "&orderby=$sortBy";
    }
    if( sortOrder != null){
      parameter += "&order=$sortOrder";
    }

    var url = "https://futcart.com/wp-json/wc" +
        "/v3/products?per_page=10" +
        parameter;

    print(
        "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(url);
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("product api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      return categoryProductListModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }
}
