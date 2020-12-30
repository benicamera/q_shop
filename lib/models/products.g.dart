//Erst automatisch generiert, dann modifiziert

part of 'products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopListAdapter extends TypeAdapter<ShopList> {
  @override
  final int typeId = 100;

  @override
  ShopList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopList(
      name: fields[0] as String,
      products: (fields[1] as List)?.cast<ListProduct>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShopList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 101;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    print("Field 2 " + fields[2] + " name: " + fields[0]);
    return Product(
      name: fields[0] as String,
      cat: fields[1] as String,
      icon: stringToIconData(fields[2] as String),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.cat)
      ..writeByte(2)
      ..write(obj.icon.toString());
  }

  //NICHT AUTOGENERTIERT
  IconData stringToIconData(String string){
    //*****************************************************************************************
    // String sieht so aus (kopiert aus api.flutter.dev/flutter/widgets/IconData/toString.html):
    // 'IconData(U+${codePoint.toRadixString(16).toUpperCase().padLeft(5, '0')})'
    // Also: IconData(hex Unicode) U+ gibt an Unicode, codepoint ist Iconwert,
    // .toRadixString() macht aus int Radixstring (Hexadecimal), toUpperCase() selbsterklärend,
    // padLeft(5, '0') setzt links vor den String 5 nullen
    // BSP: 'IconData(U+00000E6237)'
    //******************************************************************************************
    print(string);
    if(string == null || string == "null")
      return null;
    String sCodePoint = string;
    sCodePoint = string.substring(10, string.length - 1); //entfernt 'IconData(' und ')'
    //sCodePoint = 'U+00000E6237' mit BSP.
    int codePoint = int.parse(sCodePoint, radix: 16);
    print(codePoint);
    print(IconData(codePoint).toString());
    return Appicons.CodePointIcons[codePoint];
  }

  //AUTOGENERIERT
  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListProductAdapter extends TypeAdapter<ListProduct> {
  @override
  final int typeId = 102;

  @override
  ListProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    print("Field 2 " + fields[2] + " name: " + fields[0]);
    return ListProduct(
      name: fields[0] as String,
      cat: fields[1] as String,
      icon: stringToIconData(fields[2] as String),
      amount: fields[3] as String,
      note: fields[4] as String,
    );
  }

  //NICHT AUTOGENERTIERT
  IconData stringToIconData(String string){
    //*****************************************************************************************
    // String sieht so aus (kopiert aus api.flutter.dev/flutter/widgets/IconData/toString.html):
    // 'IconData(U+${codePoint.toRadixString(16).toUpperCase().padLeft(5, '0')})'
    // Also: IconData(hex Unicode) U+ gibt an Unicode, codepoint ist Iconwert,
    // .toRadixString() macht aus int Radixstring (Hexadecimal), toUpperCase() selbsterklärend,
    // padLeft(5, '0') setzt links vor den String 5 Nullen
    // BSP: 'IconData(U+00000E6237)'
    //******************************************************************************************
    print(string);
    if(string == null || string == "null")
      return null;
    String sCodePoint = string;
    print("Stringlength " + string.length.toString() + " -> " + string);
    sCodePoint = string.substring(10, string.length - 1); //entfernt 'IconData(' und ')'
    //sCodePoint = '+00000E6237' mit BSP.
    int codePoint = int.parse(sCodePoint, radix: 16);
    print("codepoint: " + codePoint.toString());
    return IconData(codePoint, fontFamily: 'appicons');
  }

  @override
  void write(BinaryWriter writer, ListProduct obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.cat)
      ..writeByte(2)
      ..write(obj.icon.toString())
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
