/*  products.dart
*   @author: Benjamin Dangl
*   @version: 17.11.2020
 */

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'products.g.dart';

@HiveType(typeId: 100)
class ShopList{
  @HiveField(0)
  String name;
  @HiveField(1)
  List<ListProduct> products = List();

  ShopList({this.name, this.products});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'products': productsToString(),
    };
  }

  String productsToString(){
    String build;
    build += "[";
    for(int i = 0; i < products.length; i++){
      if(i > 0){
        build += ",";
      }
      build += jsonEncode(products[i]);
    }
    build += "]";
    return build;
  }

  String getName() => name;

  List<ListProduct> getProducts() => products;

  void setName(String name){
    this.name = name;
  }

  void setProducts(var products){
    this.products = products;
  }

  void addProducts(ListProduct product){
    products.add(product);
  }

  void removeProduct(String name){
    for(ListProduct product in products){
      if(product.name == name){
        products.remove(product);
        break;
      }
    }
  }

}

@HiveType(typeId: 101)
class Product {
  @HiveField(0)
  String name;
  @HiveField(1)
  String cat;
  @HiveField(2)
  int iconCode;

  Product({this.name, this.cat, this.iconCode});

  Map<String, dynamic> toMap() {
    return {
      'name':     name,
      'category': cat,
      'iconCode': iconCode
    };
  }

  String getName()   => name;

  String getCat()    => cat;

  IconData getIcon() => IconData(iconCode as int, fontFamily: 'ItemsIcons');

  void setName(String name){
    this.name = name;
  }

  void setCat(String cat){
    this.cat = cat;
  }

  void setIcon(String icon){
    this.iconCode = icon;
  }
}

@HiveType(typeId: 102)
class ListProduct {
  @HiveField(0)
  String name;
  @HiveField(1)
  String cat;
  @HiveField(2)
  int iconCode;
  @HiveField(3)
  String amount;
  @HiveField(4)
  String note;

  ListProduct({this.name, this.cat, this.iconCode, this.amount, this.note});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': cat,
      'iconCode': iconCode,
      'amount': amount,
      'note': note
    };
  }

  Map toJson() => {
    'name': name,
    'category': cat,
    'iconCode': iconCode,
    'amount': amount,
    'note': note
  };

  String getName()   => name;

  String getCat()    => cat;

  IconData getIcon() => IconData(int.parse(iconCode), fontFamily: 'ItemsIcons'); //TODO: richtiges icon zurück geben.

  String getAmount() => amount;

  String getNote()   => note;

  void setName(String name){
    this.name = name;
  }

  void setCat(String cat){
    this.cat = cat;
  }

  void setIcon(String icon){
    this.iconCode = icon;
  }

  void setAmount(String amount){
    this.amount = amount;
  }

  void setNote(String note){
    this.note = note;
  }
}
