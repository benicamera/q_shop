import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:q_shop/models/defaultJsons.dart';
import 'package:q_shop/models/products.dart';

Future makeCall(url) async{
  http.Response Response = await http.get(url);
  return Response.body;
}

Future<void> initKNNJson() async {
  String url = 'http://127.0.0.1:5000/api?Query=0001';
  String prodList = prodListHttp(DefaultPrefs.defProducts);
  url += prodList;
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['QUERY'];
  int count = 0;
  while(QueryString != '200' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['QUERY'];
    count++;
  }
  return;
}

Future<void> writePositiveKNN(String itemname) async{
  String url = 'http://127.0.0.1:5000/api?Query=0002 ' + itemname;
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['Query'];
  int count = 0;
  while(QueryString != '200' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['Query'];
    count++;
  }
  return;
}

Future<void> writeNegative() async{
  String url = 'http://127.0.0.1:5000/api?Query=0003';
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['Query'];
  int count = 0;
  while(QueryString != '200' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['Query'];
    count++;
  }
  return;
}

Future<List<Product>> getPrediction(List<Product> allProds) async{
  String url = 'http://127.0.0.1:5000/api?Query=0003';
  List<Product> list = [];
  List<String> nameList = [];
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['Query'];
  int count = 0;
  while(QueryString == '500' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['Query'];
    count++;
  }
  if(count > 50)
    return [];
  nameList = jsonToPredList(Data);
  for(String s in nameList){
    Product p = nameToProduct(s);
    if(p != null)
      list.add(p);
  }
  return list;
}

List<String> jsonToPredList(var data){
  List<String> strings = [];
  strings = jsonDecode(data)['Query'];
  return strings;
}

Product nameToProduct(String s){
  final box = Hive.box('allProducts');
  for(int i=0; i<box.length; i++){
    Product p = box.getAt(i);
    if(p.name == s)
      return p;
  }
  return null;
}

String prodListHttp(List<Product> prods){
  String list = " ";
  for(Product p in prods){
    list += p.name;
    list += ',';
  }
  return list;
}