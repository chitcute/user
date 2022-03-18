// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveItemAdapter extends TypeAdapter<HiveItem> {
  @override
  final int typeId = 4;

  @override
  HiveItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveItem(
      id: fields[0] as String,
      photo: fields[1] as String,
      photo2: fields[2] as String,
      photo3: fields[3] as String,
      name: fields[5] as String,
      brand: fields[6] as String,
      deliverytime: fields[7] as String,
      price: fields[8] as int,
      discountprice: fields[9] as int,
      desc: fields[4] as String,
      color: fields[10] as String,
      sizePrice: (fields[11] as List).cast<HiveSizePrice>(),
      star: fields[13] as int,
      category: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.photo)
      ..writeByte(2)
      ..write(obj.photo2)
      ..writeByte(3)
      ..write(obj.photo3)
      ..writeByte(4)
      ..write(obj.desc)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.brand)
      ..writeByte(7)
      ..write(obj.deliverytime)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.discountprice)
      ..writeByte(10)
      ..write(obj.color)
      ..writeByte(11)
      ..write(obj.sizePrice)
      ..writeByte(13)
      ..write(obj.star)
      ..writeByte(14)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
