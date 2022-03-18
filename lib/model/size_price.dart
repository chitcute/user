import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'size_price.freezed.dart';
part 'size_price.g.dart';

@freezed
class SizePrice with _$SizePrice {
  factory SizePrice({
    required String id,
    required String sizeText,
    required int price,
  }) = _SizePrice;
  factory SizePrice.fromJson(Map<String, dynamic> json) =>
      _$SizePriceFromJson(json);

  factory SizePrice.empty() => SizePrice(
        id: Uuid().v1(),
        sizeText: "",
        price: 0,
      );
}
