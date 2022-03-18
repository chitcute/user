import 'package:freezed_annotation/freezed_annotation.dart';

import 'size_price.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class ItemModel with _$ItemModel {
  @JsonSerializable(explicitToJson: true)
  factory ItemModel({
    required String id,
    required String photo,
    required String photo2,
    required String photo3,
    required String desc,
    required String name,
    required String brand,
    required String deliverytime,
    required int price,
    required int discountprice,
    required String color,
    required List<SizePrice> sizePrice,
    required int star,
    required String category,
  }) = _ItemModel;
  // final DateTime? created;
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  factory ItemModel.empty() => ItemModel(
        id: "",
        photo: "",
        photo2: "",
        photo3: "",
        desc: "",
        name: "",
        brand: "",
        deliverytime: "",
        price: 0,
        discountprice: 0,
        color: '',
        sizePrice: [],
        star: 0,
        category: '',
      );
}

class PurchaseItem {
  final String id;
  final int count;
  final String size;
  final String color;
  final bool isHotDeal;
  final int price;

  PurchaseItem(
      this.id, this.count, this.size, this.color, this.isHotDeal, this.price);
}
