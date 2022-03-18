// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
class _$ItemModelTearOff {
  const _$ItemModelTearOff();

  _ItemModel call(
      {required String id,
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
      required String category}) {
    return _ItemModel(
      id: id,
      photo: photo,
      photo2: photo2,
      photo3: photo3,
      desc: desc,
      name: name,
      brand: brand,
      deliverytime: deliverytime,
      price: price,
      discountprice: discountprice,
      color: color,
      sizePrice: sizePrice,
      star: star,
      category: category,
    );
  }

  ItemModel fromJson(Map<String, Object?> json) {
    return ItemModel.fromJson(json);
  }
}

/// @nodoc
const $ItemModel = _$ItemModelTearOff();

/// @nodoc
mixin _$ItemModel {
  String get id => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get photo2 => throw _privateConstructorUsedError;
  String get photo3 => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get deliverytime => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get discountprice => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  List<SizePrice> get sizePrice => throw _privateConstructorUsedError;
  int get star => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String photo,
      String photo2,
      String photo3,
      String desc,
      String name,
      String brand,
      String deliverytime,
      int price,
      int discountprice,
      String color,
      List<SizePrice> sizePrice,
      int star,
      String category});
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res> implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

  final ItemModel _value;
  // ignore: unused_field
  final $Res Function(ItemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? photo = freezed,
    Object? photo2 = freezed,
    Object? photo3 = freezed,
    Object? desc = freezed,
    Object? name = freezed,
    Object? brand = freezed,
    Object? deliverytime = freezed,
    Object? price = freezed,
    Object? discountprice = freezed,
    Object? color = freezed,
    Object? sizePrice = freezed,
    Object? star = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      photo2: photo2 == freezed
          ? _value.photo2
          : photo2 // ignore: cast_nullable_to_non_nullable
              as String,
      photo3: photo3 == freezed
          ? _value.photo3
          : photo3 // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      deliverytime: deliverytime == freezed
          ? _value.deliverytime
          : deliverytime // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountprice: discountprice == freezed
          ? _value.discountprice
          : discountprice // ignore: cast_nullable_to_non_nullable
              as int,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      sizePrice: sizePrice == freezed
          ? _value.sizePrice
          : sizePrice // ignore: cast_nullable_to_non_nullable
              as List<SizePrice>,
      star: star == freezed
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ItemModelCopyWith<$Res> implements $ItemModelCopyWith<$Res> {
  factory _$ItemModelCopyWith(
          _ItemModel value, $Res Function(_ItemModel) then) =
      __$ItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String photo,
      String photo2,
      String photo3,
      String desc,
      String name,
      String brand,
      String deliverytime,
      int price,
      int discountprice,
      String color,
      List<SizePrice> sizePrice,
      int star,
      String category});
}

/// @nodoc
class __$ItemModelCopyWithImpl<$Res> extends _$ItemModelCopyWithImpl<$Res>
    implements _$ItemModelCopyWith<$Res> {
  __$ItemModelCopyWithImpl(_ItemModel _value, $Res Function(_ItemModel) _then)
      : super(_value, (v) => _then(v as _ItemModel));

  @override
  _ItemModel get _value => super._value as _ItemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? photo = freezed,
    Object? photo2 = freezed,
    Object? photo3 = freezed,
    Object? desc = freezed,
    Object? name = freezed,
    Object? brand = freezed,
    Object? deliverytime = freezed,
    Object? price = freezed,
    Object? discountprice = freezed,
    Object? color = freezed,
    Object? sizePrice = freezed,
    Object? star = freezed,
    Object? category = freezed,
  }) {
    return _then(_ItemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      photo2: photo2 == freezed
          ? _value.photo2
          : photo2 // ignore: cast_nullable_to_non_nullable
              as String,
      photo3: photo3 == freezed
          ? _value.photo3
          : photo3 // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      deliverytime: deliverytime == freezed
          ? _value.deliverytime
          : deliverytime // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountprice: discountprice == freezed
          ? _value.discountprice
          : discountprice // ignore: cast_nullable_to_non_nullable
              as int,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      sizePrice: sizePrice == freezed
          ? _value.sizePrice
          : sizePrice // ignore: cast_nullable_to_non_nullable
              as List<SizePrice>,
      star: star == freezed
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ItemModel implements _ItemModel {
  _$_ItemModel(
      {required this.id,
      required this.photo,
      required this.photo2,
      required this.photo3,
      required this.desc,
      required this.name,
      required this.brand,
      required this.deliverytime,
      required this.price,
      required this.discountprice,
      required this.color,
      required this.sizePrice,
      required this.star,
      required this.category});

  factory _$_ItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ItemModelFromJson(json);

  @override
  final String id;
  @override
  final String photo;
  @override
  final String photo2;
  @override
  final String photo3;
  @override
  final String desc;
  @override
  final String name;
  @override
  final String brand;
  @override
  final String deliverytime;
  @override
  final int price;
  @override
  final int discountprice;
  @override
  final String color;
  @override
  final List<SizePrice> sizePrice;
  @override
  final int star;
  @override
  final String category;

  @override
  String toString() {
    return 'ItemModel(id: $id, photo: $photo, photo2: $photo2, photo3: $photo3, desc: $desc, name: $name, brand: $brand, deliverytime: $deliverytime, price: $price, discountprice: $discountprice, color: $color, sizePrice: $sizePrice, star: $star, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality().equals(other.photo2, photo2) &&
            const DeepCollectionEquality().equals(other.photo3, photo3) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality()
                .equals(other.deliverytime, deliverytime) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.discountprice, discountprice) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.sizePrice, sizePrice) &&
            const DeepCollectionEquality().equals(other.star, star) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(photo),
      const DeepCollectionEquality().hash(photo2),
      const DeepCollectionEquality().hash(photo3),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(deliverytime),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(discountprice),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(sizePrice),
      const DeepCollectionEquality().hash(star),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$ItemModelCopyWith<_ItemModel> get copyWith =>
      __$ItemModelCopyWithImpl<_ItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemModelToJson(this);
  }
}

abstract class _ItemModel implements ItemModel {
  factory _ItemModel(
      {required String id,
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
      required String category}) = _$_ItemModel;

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$_ItemModel.fromJson;

  @override
  String get id;
  @override
  String get photo;
  @override
  String get photo2;
  @override
  String get photo3;
  @override
  String get desc;
  @override
  String get name;
  @override
  String get brand;
  @override
  String get deliverytime;
  @override
  int get price;
  @override
  int get discountprice;
  @override
  String get color;
  @override
  List<SizePrice> get sizePrice;
  @override
  int get star;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$ItemModelCopyWith<_ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
