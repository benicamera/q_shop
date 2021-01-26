import 'dart:convert';
import 'package:flutter/foundation.dart';
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
Future<void> initKNNJson() async{
  Map<String, Map<String, List>> map = new Map();
  //Fülle Map für KNN
  for (int i=0; i<(DefaultPrefs.defProducts.length / 8).round(); i++) {
    Map<String, List<int>> posNeg = new Map();
    List<int> pos = [];
    List<int> neg = [];

    posNeg["positive"] = new List.from(pos.reversed);
    posNeg["negative"] = new List.from(neg.reversed);
    map[DefaultPrefs.defProducts[i].name] = posNeg;
    }
  //Speichern
    Box box = await Hive.openBox("KNNJson");
    String json = jsonEncode(map);
    if(box.length < 2){
      box.add(null);
      box.add(null);
    }
    box.putAt(0, json);
}

Future<String> helloWorld() async{
  var Data = await makeCall("http://benicamera.pythonanywhere.com/api?Query=hello world");
  print(Data.toString());
  return jsonDecode(Data.toString())['Query'];
}

//WRITE POSITIVE
//@requires: String itemname
//@returns: Future<void>
//call, when item bought
Future<void> writePositiveKNN(String itemname) async{
  //Json bekommen
  Box box = await Hive.openBox("KNNJson");
  String json = box.getAt(0);
  Map<String, Map<String, List<int>>> map = jsonDecode(json);

  int currDay = getCurrDay(0);
  for(String key in map.keys){
    if(!inList(map[key]['positive'], currDay) && !inList(map[key]['negative'], currDay)){
      map[key]['positive'].add(currDay);
    }
  }
  box.putAt(0, jsonEncode(map));
  return;
}

/*
String reorderJson(String jsonMapS){
  Map<String, dynamic> jsonMap = json.decode(jsonMapS);
  print("JSON MAAAAPPP: " + jsonMap.toString());
  List<Map<String, dynamic>> list = [];
  List<String> keys = jsonMap.keys.toList();
  keys.forEach((key) {
    Map<String, dynamic> _map = new Map();
    _map['name'] = key;
    _map['positive'] = jsonMap[key]['positive'];
    _map['negative'] = jsonMap[key]['negative'];

    list.add(_map);
  });
  return jsonEncode(list);
}
*/
//WRITE NEGATIVE
//@requires: NONE
//@returns: Future<void>
//call every 25h
Future<void> writeNegative() async{
  //JSON bekommen
  Box box = await Hive.openBox("KNNJson");
  String json = box.getAt(0);
  int lastDayCalled = box.getAt(2);
  print("JSON: " + json);
  Map<String, dynamic> map = jsonDecode(json);
  int currDay = getCurrDay(0) - 1;
  int daysToCheck = currDay - lastDayCalled;
  for(int i = 1; i < daysToCheck +1; i++){
    int _day = lastDayCalled + i;
    print("Day " + _day.toString());
    for(String key in map.keys){
      if(!inList(map[key]['positive'].cast<int>(), _day) && !inList(map[key]['negative'].cast<int>(), _day)){
        List<int> negList = map[key]['negative'].cast<int>();
        if(negList.length > 9){
          for(int j = 1; i<negList.length; i++){
            negList[i-1] = negList[j];
            negList.removeLast();
          }
        }
        negList.add(_day);
      }
    }
  }
  box.putAt(0, jsonEncode(map));
  box.putAt(2, currDay);
  return;
}

bool inList(List<int> list, int i){
  if(binarySearch(list, i) < 0)
    return false;
  return true;
}

int getCurrDay(int negativeDays){
  var ms = (new DateTime.now()).millisecondsSinceEpoch;
  var secs = ms/1000;
  var hours = secs / 3600;
  var days = hours / 24;
  return (days - (365 * 50 + 12)).round() - negativeDays;
}

//GET PREDICTION
//@requires: NONE
//@returns: Future<void>
//tries to call 0003 (write negative) max. 50 times
//call every day at the first app activation
Future<List<Product>> getPrediction() async{
  print("IN PREDICTION");
  //JSON holen
  Box box = await Hive.openBox("KNNJson");
  String json = box.getAt(0);
  print(json);
  //Call machen
  String url = 'http://benicamera.pythonanywhere.com/api?Query=0004 ' + json;
  var Data = await makeCall(url);
  //Daten sichern
  print(0);
  Map<String, dynamic> map = jsonDecode(Data);
  print("MAP: " + map.toString());
  List<dynamic> QueryString = map['Query']['Query'];
  String feedback = jsonDecode(Data)['Query']['Code'];
  print("Feedback " + feedback);
  int count = 0;
  //wait for ok
  print(1);
  while(feedback != '200' && count < 50){
    print(feedback);
    Data = await makeCall(url);
    QueryString = jsonDecode(Data)['Query']['Query'];
    feedback = jsonDecode(Data)['Query']['Code'];
    if(feedback == "200"){
      print("Code 200");
      break;
    }
    count++;
  }
  print(2);
  //Liste erstellen
  List<Product> prods = [];
  //wenn ok, Liste füllen
  if(feedback == '200'){
    for(var n in QueryString) {
      prods.add(nameToProduct(n));
      print("PRODS: " + prods.toString());
    }
  }
  print("ProdType: " + prods.runtimeType.toString());
  return prods;
}

Future<List<Product>> getProposals() async{
  print("getProposals()");
  Box box = await Hive.openBox("KNNJson");
  Map<dynamic, dynamic> map = box.getAt(1);
  print("Saved map: " + map.toString());
  final now = DateTime.now();
  if(map != null) {
    if (map['date'] == DateTime(now.year, now.month, now.day)) {
      print("Same day");
      return dynamicListToProductList(map['list']);
    }
  }else{
    map = new Map<String, dynamic>();
  }
  map['date'] = DateTime(now.year, now.month, now.day);
  List<Product> list = await getPrediction();
  map['list'] = list;
  box.putAt(1, map);
  return list;
}

List<Product> dynamicListToProductList(List<dynamic> dyna){
  List<Product> prods = [];
  Product bsp = new Product(name: "", cat: "", icon: null);
  if(dyna.length < 1)
    return prods;
  for(var d in dyna){
    if(d.runtimeType == bsp.runtimeType){
      prods.add(d as Product);
    }
  }
}

List<String> jsonToPredList(var data){
  List<String> strings = [];
  strings = jsonDecode(data)['Query'];
  return strings;
}

Product nameToProduct(var s){
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