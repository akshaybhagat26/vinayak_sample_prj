// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fintech.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionDataAdapter extends TypeAdapter<TransactionData> {
  @override
  final int typeId = 0;

  @override
  TransactionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionData(
      transactionId: fields[0] as String,
      transactionDate: fields[1] as DateTime,
      transactionAmount: fields[2] as double,
      transactionType: fields[3] as String,
      transactionCategory: fields[4] as String,
      transactionNote: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.transactionId)
      ..writeByte(1)
      ..write(obj.transactionDate)
      ..writeByte(2)
      ..write(obj.transactionAmount)
      ..writeByte(3)
      ..write(obj.transactionType)
      ..writeByte(4)
      ..write(obj.transactionCategory)
      ..writeByte(5)
      ..write(obj.transactionNote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 1;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      userId: fields[0] as String,
      userName: fields[1] as String,
      userEmail: fields[2] as String,
      userPassword: fields[3] as String,
      userTransactions: (fields[4] as List).cast<TransactionData>(),
      userCurrency: fields[5] as String,
      monthlyLimit: fields[6] as double,
      userBalance: fields[7] as double,
      userIncome: fields[8] as double,
      userExpense: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userEmail)
      ..writeByte(3)
      ..write(obj.userPassword)
      ..writeByte(4)
      ..write(obj.userTransactions)
      ..writeByte(5)
      ..write(obj.userCurrency)
      ..writeByte(6)
      ..write(obj.monthlyLimit)
      ..writeByte(7)
      ..write(obj.userBalance)
      ..writeByte(8)
      ..write(obj.userIncome)
      ..writeByte(9)
      ..write(obj.userExpense);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
