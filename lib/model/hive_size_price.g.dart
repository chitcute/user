// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_size_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSizePriceAdapter extends TypeAdapter<HiveSizePrice> {
  @override
  final int typeId = 1;

  @override
  HiveSizePrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSizePrice(
      id: fields[0] as String,
      sizeText: fields[1] as String,
      price: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSizePrice obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sizeText)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSizePriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
