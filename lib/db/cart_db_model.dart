class CartDBModel {
  
  String? product_id;
  String? product_name;
  String? product_carton_size;
  String? quantity;
  String? product_price;
  String? product_img_url;

  CartDBModel(
    {
      this.product_id,
      this.product_name,
      this.product_carton_size,
      this.quantity,
      this.product_price,
      this.product_img_url,
    }
  );

  CartDBModel.fromJson(Map<String, dynamic> res) {
    product_id = res['product_id'];
    product_name = res['product_name'];
    product_carton_size = res['product_carton_size'];
    quantity = res['quantity'];
    product_price = res['product_price'];
    product_img_url = res['product_img_url'];
  }

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = this.product_id;
    // data['product_name'] = this.product_name;
    // data['product_carton_size'] = this.product_carton_size;
    data['quantity'] = this.quantity;
    // data['product_price'] = this.product_price;
    // data['product_img_url'] = this.product_img_url;
    return data;
  }

}
