class ProductElement {
  String? displayName;
  String? productName;

  ProductElement({this.displayName, this.productName});

  ProductElement.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['productName'] = this.productName;
    return data;
  }
}
