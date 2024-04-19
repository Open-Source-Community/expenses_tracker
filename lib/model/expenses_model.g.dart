// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensesModelAdapter extends TypeAdapter<ExpensesModel> {
  @override
  final int typeId = 0;

  @override
  ExpensesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpensesModel(
      indexOfList: fields[3] as int,
      amount: fields[0] as double,
      username: fields[2] as String,
      indexIcons: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExpensesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.indexIcons)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.indexOfList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
