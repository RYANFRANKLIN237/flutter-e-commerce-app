class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    required this.attributeValues,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
  });

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  ///json format
  toJson() {
    return {
     'Id': id,
      'Image': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  ///map json document snapshot from firebase to model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
        id: data['Id'] ?? '',
        price: double.parse((data['Price'] ?? 0.0).toString()),
        sku: data['SKU'] ?? '',
        stock: data['Stock'] ?? 0,
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        image: data['Image'] ?? '',
        attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
