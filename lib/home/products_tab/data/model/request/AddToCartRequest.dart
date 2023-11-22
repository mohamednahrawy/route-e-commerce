/// productId : "6428ebc6dc1175abc65ca0b9"

class AddToCartRequest {
  String? productId;

  AddToCartRequest({
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    return map;
  }
}
