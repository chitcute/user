
import 'package:hive/hive.dart';

part 'hive_size_price.g.dart';

@HiveType(typeId: 1)
class HiveSizePrice {
  @HiveField(0)
  String id;
  @HiveField(1)
  String sizeText;
  @HiveField(2)
  int price;
   HiveSizePrice({required this.id,required this.sizeText,required this.price});
}