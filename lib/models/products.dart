/*  products.dart
*   @author: Benjamin Dangl
*   @version: 17.11.2020
 */

import 'package:flutter/material.dart';

class ShopList{
  String name;
  List<ListProduct> products = List();

  ShopList({this.name, this.products});

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

class Product {
  String name;
  String cat;
  IconData icon;

  Product({this.name, this.cat, this.icon});

  String getName() => name;

  String getCat() => cat;

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

class ListProduct extends Product{
  String name;
  String cat;
  IconData icon;
  String amount;
  String note;

  ListProduct({this.name, this.cat, this.icon, this.amount, this.note});

  String getAmount() => amount;

  String getNote() => note;

  void setAmount(String amount){
    this.amount = amount;
  }

  void setNote(String note){
    this.note = note;
  }
}