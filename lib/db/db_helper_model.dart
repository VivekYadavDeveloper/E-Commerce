class DbHelperModel {
  String? product_id;
  String? product_name;
  String? product_carton_size;
  String? product_price;
  String? product_img_url;

  DbHelperModel({
    this.product_id,
    this.product_name,
    this.product_carton_size,
    this.product_price,
    this.product_img_url,
  });

  DbHelperModel.fromJson(Map<String, dynamic> res) {
    product_id = res['product_id'];
    product_name = res['product_name'];
    product_carton_size = res['product_carton_size'];
    product_price = res['product_price'];
    product_img_url = res['product_img_url'];
  }
}
