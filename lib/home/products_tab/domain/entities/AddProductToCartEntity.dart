class AddToCartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  AddToCartDataEntity? data;
  String? statusMsg;

  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.data,
    this.statusMsg
  });
}

class AddToCartDataEntity {
  String? id;
  String? cartOwner;
  List<AddToCartProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  AddToCartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}

class AddToCartProductEntity {
  int? count;
  String? id;
  String? product;
  int? price;

  AddToCartProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}
