// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemModel _$$_ItemModelFromJson(Map<String, dynamic> json) => _$_ItemModel(
      id: json['id'] as String,
      photo: json['photo'] as String,
      photo2: json['photo2'] as String,
      photo3: json['photo3'] as String,
      desc: json['desc'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      deliverytime: json['deliverytime'] as String,
      price: json['price'] as int,
      discountprice: json['discountprice'] as int,
      color: json['color'] as String,
      sizePrice: (json['sizePrice'] as List<dynamic>)
          .map((e) => SizePrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      star: json['star'] as int,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_ItemModelToJson(_$_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'photo2': instance.photo2,
      'photo3': instance.photo3,
      'desc': instance.desc,
      'name': instance.name,
      'brand': instance.brand,
      'deliverytime': instance.deliverytime,
      'price': instance.price,
      'discountprice': instance.discountprice,
      'color': instance.color,
      'sizePrice': instance.sizePrice.map((e) => e.toJson()).toList(),
      'star': instance.star,
      'category': instance.category,
    };
