// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListModelAdapter extends TypeAdapter<ListModel> {
  @override
  final int typeId = 2;

  @override
  ListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListModel(
      indexOfList: fields[2] as int,
      listName: fields[0] as String,
      username: fields[5] as String,
      fromBudget: fields[3] as bool,
      indexicon: fields[1] as int,
      price: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ListModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.listName)
      ..writeByte(1)
      ..write(obj.indexicon)
      ..writeByte(2)
      ..write(obj.indexOfList)
      ..writeByte(3)
      ..write(obj.fromBudget)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
