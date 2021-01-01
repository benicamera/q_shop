import 'package:hive/hive.dart';
import 'package:q_shop/models/products.dart';

class PublicFunctions{
  static void checkItem(String itemName, String boxName, int index){
    Box allLists = Hive.box(boxName);
    ShopList list = allLists.getAt(index);
    List<ListProduct> prodList = list.products;
    List<ListProduct> checkList = list.checked;
    print("CheckList: " + checkList.toString() + " Length: " + checkList.length.toString());
    int productIndex = getProductIndex(list.products, itemName);
    ListProduct product = prodList[productIndex];
    checkList = addToChecked(product, checkList);
    list.products.removeAt(productIndex);
    list.checked = checkList;
    Hive.box(boxName).putAt(index, list);
    print("CheckList: " + checkList.toString());
  }

  static List<ListProduct> addToChecked(ListProduct product, List<ListProduct> _list){
    int index = getProductIndex(_list, product.name);
    if(index < 0){
      List<ListProduct> list = List(_list.length + 1);
      for(int i=0; i<_list.length; i++){
        list[i] = _list[i];
      }
      list[list.length-1] = product;
      return list;
    }
    List<ListProduct> list = List(_list.length);
    for(int i=0; i<_list.length; i++){
      list[i] = _list[i];
    }
    list[index] = product;
    return list;
  }

  static int getProductIndex(List<ListProduct> list, String itemName){
    for(int i=0; i<list.length; i++){
      if(list[i].name == itemName)
        return i;
    }
    return -1;
  }

  static void restoreChecked(String boxName, int index){
    Box box = Hive.box(boxName);
    ShopList list = box.getAt(index);
    List<ListProduct> prodList = list.products;
    List<ListProduct> checkList = list.checked;
    //TODO vielleicht doch liste anzeigen
  }
}