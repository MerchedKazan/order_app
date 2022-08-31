// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderSavedAdapter extends TypeAdapter<OrderSaved> {
  @override
  final int typeId = 0;

  @override
  OrderSaved read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderSaved()
      ..orderSaved = (fields[0] as List?)?.cast<OrderModelHive>();
  }

  @override
  void write(BinaryWriter writer, OrderSaved obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.orderSaved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderSavedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderModelHiveAdapter extends TypeAdapter<OrderModelHive> {
  @override
  final int typeId = 1;

  @override
  OrderModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModelHive()
      ..id = fields[1] as String?
      ..total = fields[2] as String?
      ..createdAt = fields[3] as String?
      ..image = fields[4] as String?
      ..currency = fields[5] as String?
      ..address = fields[6] as AddressHive?
      ..items = (fields[7] as List?)?.cast<ItemsHive>();
  }

  @override
  void write(BinaryWriter writer, OrderModelHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.currency)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressHiveAdapter extends TypeAdapter<AddressHive> {
  @override
  final int typeId = 2;

  @override
  AddressHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressHive()
      ..lat = fields[8] as String?
      ..lng = fields[9] as String?;
  }

  @override
  void write(BinaryWriter writer, AddressHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(8)
      ..write(obj.lat)
      ..writeByte(9)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemsHiveAdapter extends TypeAdapter<ItemsHive> {
  @override
  final int typeId = 3;

  @override
  ItemsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsHive()
      ..id = fields[10] as int?
      ..name = fields[11] as String?
      ..price = fields[12] as String?;
  }

  @override
  void write(BinaryWriter writer, ItemsHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
