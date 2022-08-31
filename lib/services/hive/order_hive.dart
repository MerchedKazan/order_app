import 'package:hive/hive.dart';

import '../../model/order_model.dart';

part 'order_hive.g.dart';
@HiveType(typeId: 0)
class OrderSaved extends HiveObject{
  @HiveField(0)
  List<OrderModelHive>? orderSaved;
}
@HiveType(typeId: 1)
class OrderModelHive extends HiveObject{
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? total;
  @HiveField(3)
  String? createdAt;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String? currency;
  @HiveField(6)
  AddressHive? address;
  @HiveField(7)
  List<ItemsHive>? items;
}

@HiveType(typeId: 2)
class AddressHive extends HiveObject{
  @HiveField(8)
  String? lat;
  @HiveField(9)
  String? lng;
}
@HiveType(typeId: 3)
class ItemsHive extends HiveObject {
  @HiveField(10)
  int? id;
  @HiveField(11)
  String? name;
  @HiveField(12)
  String? price;
}


