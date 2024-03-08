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
      amount: fields[0] as double,
      index: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExpensesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.index);
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
