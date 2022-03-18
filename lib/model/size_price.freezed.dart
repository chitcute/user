// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'size_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SizePrice _$SizePriceFromJson(Map<String, dynamic> json) {
  return _SizePrice.fromJson(json);
}

/// @nodoc
class _$SizePriceTearOff {
  const _$SizePriceTearOff();

  _SizePrice call(
      {required String id, required String sizeText, required int price}) {
    return _SizePrice(
      id: id,
      sizeText: sizeText,
      price: price,
    );
  }

  SizePrice fromJson(Map<String, Object?> json) {
    return SizePrice.fromJson(json);
  }
}

/// @nodoc
const $SizePrice = _$SizePriceTearOff();

/// @nodoc
mixin _$SizePrice {
  String get id => throw _privateConstructorUsedError;
  String get sizeText => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SizePriceCopyWith<SizePrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizePriceCopyWith<$Res> {
  factory $SizePriceCopyWith(SizePrice value, $Res Function(SizePrice) then) =
      _$SizePriceCopyWithImpl<$Res>;
  $Res call({String id, String sizeText, int price});
}

/// @nodoc
class _$SizePriceCopyWithImpl<$Res> implements $SizePriceCopyWith<$Res> {
  _$SizePriceCopyWithImpl(this._value, this._then);

  final SizePrice _value;
  // ignore: unused_field
  final $Res Function(SizePrice) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? sizeText = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sizeText: sizeText == freezed
          ? _value.sizeText
          : sizeText // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SizePriceCopyWith<$Res> implements $SizePriceCopyWith<$Res> {
  factory _$SizePriceCopyWith(
          _SizePrice value, $Res Function(_SizePrice) then) =
      __$SizePriceCopyWithImpl<$Res>;
  @override
  $Res call({String id, String sizeText, int price});
}

/// @nodoc
class __$SizePriceCopyWithImpl<$Res> extends _$SizePriceCopyWithImpl<$Res>
    implements _$SizePriceCopyWith<$Res> {
  __$SizePriceCopyWithImpl(_SizePrice _value, $Res Function(_SizePrice) _then)
      : super(_value, (v) => _then(v as _SizePrice));

  @override
  _SizePrice get _value => super._value as _SizePrice;

  @override
  $Res call({
    Object? id = freezed,
    Object? sizeText = freezed,
    Object? price = freezed,
  }) {
    return _then(_SizePrice(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sizeText: sizeText == freezed
          ? _value.sizeText
          : sizeText // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SizePrice implements _SizePrice {
  _$_SizePrice({required this.id, required this.sizeText, required this.price});

  factory _$_SizePrice.fromJson(Map<String, dynamic> json) =>
      _$$_SizePriceFromJson(json);

  @override
  final String id;
  @override
  final String sizeText;
  @override
  final int price;

  @override
  String toString() {
    return 'SizePrice(id: $id, sizeText: $sizeText, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SizePrice &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.sizeText, sizeText) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(sizeText),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$SizePriceCopyWith<_SizePrice> get copyWith =>
      __$SizePriceCopyWithImpl<_SizePrice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SizePriceToJson(this);
  }
}

abstract class _SizePrice implements SizePrice {
  factory _SizePrice(
      {required String id,
      required String sizeText,
      required int price}) = _$_SizePrice;

  factory _SizePrice.fromJson(Map<String, dynamic> json) =
      _$_SizePrice.fromJson;

  @override
  String get id;
  @override
  String get sizeText;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$SizePriceCopyWith<_SizePrice> get copyWith =>
      throw _privateConstructorUsedError;
}
