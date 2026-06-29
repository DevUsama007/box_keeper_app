// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Boxes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoxesModelAdapter extends TypeAdapter<BoxesModel> {
  @override
  final int typeId = 1;

  @override
  BoxesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BoxesModel(
      uniqueID: fields[0] as String,
      qrCodePath: fields[1] as String,
      boxTitle: fields[2] as String,
      boxLocation: fields[3] as String,
      boxCreationDate: fields[4] as String,
      boxItems: (fields[5] as List).cast<String>(),
      itemCount: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BoxesModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uniqueID)
      ..writeByte(1)
      ..write(obj.qrCodePath)
      ..writeByte(2)
      ..write(obj.boxTitle)
      ..writeByte(3)
      ..write(obj.boxLocation)
      ..writeByte(4)
      ..write(obj.boxCreationDate)
      ..writeByte(5)
      ..write(obj.boxItems)
      ..writeByte(6)
      ..write(obj.itemCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoxesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
