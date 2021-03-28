// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'PatientModel.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class PatientModelAdapter extends TypeAdapter<PatientModel> {
//   @override
//   final int typeId = 0;

//   @override
//   PatientModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return PatientModel(
//       fields[0] as int,
//       fields[1] as String,
//       fields[2] as String,
//       fields[3] as bool,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, PatientModel obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.name)
//       ..writeByte(2)
//       ..write(obj.detail)
//       ..writeByte(3)
//       ..write(obj.archived);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is PatientModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
