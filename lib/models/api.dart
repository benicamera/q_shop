import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:q_shop/models/defaultJsons.dart';
import 'package:q_shop/models/products.dart';

//MAKE CALL
//@requires: url String 'http://127.0.0.1:5000/api?Query='
//@returns: Response jsonform
Future makeCall(String url) async{
  http.Response Response = await http.get(url);
  return Response.body;
}

//INIT KNN JSON
//@requires: NONE
//@returns: Future<void>
//tries to call 0001 (first call) max. 50 times
Future<void> initKNNJson() async {
  String url = 'http://127.0.0.1:5000/api?Query=0001';
  String prodList = prodListHttp(DefaultPrefs.defProducts);
  url += prodList;
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['QUERY'];
  int count = 0;
  //wait for ok
  while(QueryString != '200' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['QUERY'];
    count++;
  }
  return;
}

//WRITE POSITIVE
//@requires: String itemname
//@returns: Future<void>
//tries to call 0002 (write positve) with itemname max. 50 times
//call, when item bought
Future<void> writePositiveKNN(String itemname) async{
  String url = 'http://127.0.0.1:5000/api?Query=0002 ' + itemname;
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['Query'];
  int count = 0;
  //wait for ok
  while(QueryString != '200' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['Query'];
    count++;
  }
  return;
}

//WRITE NEGATIVE
//@requires: NONE
//@returns: Future<void>
//tries to call 0003 (write negative) max. 50 times
//call every 25h
Future<void> writeNegative() async{
  String url = 'http://127.0.0.1:5000/api?Query=0003';
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['Query'];
  int count = 0;
  //wait for ok
  while(QueryString != '200' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['Query'];
    count++;
  }
  return;
}

//GET PREDICTION
//@requires: NONE
//@returns: Future<void>
//tries to call 0003 (write negative) max. 50 times
//call every day at the first app activation
Future<List<Product>> getPrediction(List<Product> allProds) async{
  String url = 'http://127.0.0.1:5000/api?Query=0003';
  List<Product> list = [];
  List<String> nameList = [];
  var Data = await makeCall(url);
  String QueryString = jsonDecode(Data)['Query'];
  int count = 0;
  //wait for ok
  while(QueryString == '500' && count < 50){
    print(QueryString);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['Query'];
    count++;
  }
  //if failed
  if(count > 50)
    return [];
  //if successful
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