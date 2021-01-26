/*  products.dart
*   @author: Benjamin Dangl
*   @version: 17.11.2020
 */

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/appicons_icons.dart';

part 'products.g.dart';

@HiveType(typeId: 100)
class ShopList {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<ListProduct> products = List();
  @HiveField(2)
  List<ListProduct> checked = List();

  ShopList({this.name, this.products, this.checked});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'products': productsToString(),
      'checked': productsToString(),
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
  IconData icon;

  Product({this.name, this.cat, this.icon});


  Map<String, dynamic> toMap() {
    return {
      'name':     name,
      'category': cat,
      'icon': icon
    };
  }

  String getName()   => name;

  String getCat()    => cat;

  IconData getIcon() => icon;

  void setName(String name){
    this.name = name;
  }

  void setCat(String cat){
    this.cat = cat;
  }

  void setIcon(IconData icon){
    this.icon = icon;
  }
}

@HiveType(typeId: 102)
class ListProduct {
  @HiveField(0)
  String name;
  @HiveField(1)
  String cat;
  @HiveField(2)
  IconData icon;
  @HiveField(3)
  String amount;
  @HiveField(4)
  String note;

  ListProduct({this.name, this.cat, this.icon, this.amount, this.note});


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': cat,
      'icon': icon,
      'amount': amount,
      'note': note
    };
  }

  @override
  String toString() => name;

  String getName()   => name;

  String getCat()    => cat;

  IconData getIcon() => icon;

  String getAmount() => amount;

  String getNote()   => note;

  void setName(String name){
    this.name = name;
  }

  void setCat(String cat){
    this.cat = cat;
  }

  void setIcon(IconData icon){
    this.icon = icon;
  }

  void setAmount(String amount){
    this.amount = amount;
  }

  void setNote(String note){
    this.note = note;
  }
}
