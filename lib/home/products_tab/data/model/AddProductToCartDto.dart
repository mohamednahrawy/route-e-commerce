import 'package:route_e_commerce_app/home/products_tab/domain/entities/AddProductToCartEntity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity {
  AddToCartResponseDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
    super.statusMsg
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data =
        json['data'] != null ? AddToCartDataDto.fromJson(json['data']) : null;
  }
}

class AddToCartDataDto extends AddToCartDataEntity {
  AddToCartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddToCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddToCartProductDto extends AddToCartProductEntity {
  AddToCartProductDto({super.count, super.id, super.product, super.price});

  AddToCartProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
