
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:order_app/model/order_model.dart';
import 'package:order_app/services/hive/order_hive.dart';
import 'package:order_app/services/order_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/hive/boxes.dart';


class OrderProvider extends ChangeNotifier{
  OrderService _orderService=OrderService();
List<OrderModel> listOfOrderModel=[];
int pageNum=1;
getPageNum(){
  if(listOfOrderModel.isEmpty){
    pageNum=1;
  }else{
   pageNum= ((listOfOrderModel.length/15) + 1).truncate();
  }
}
getData()async{
  if(await InternetConnectionChecker().hasConnection){
    getPageNum();
    List<OrderModel> newListOfOrderModel=[];
    Map data=await _orderService.getData(pageNum: pageNum);
    if(listOfOrderModel.length!=data['paginate']['total']){
      if(pageNum==1){
        listOfOrderModel = List<OrderModel>.from(data['data'].map((model)=>OrderModel.fromJson(model)));
        addToDatabase();
      }else{
        newListOfOrderModel=List<OrderModel>.from(data['data'].map((model)=>OrderModel.fromJson(model)));
        listOfOrderModel+=newListOfOrderModel;
        addToDatabase();
      }
    }
  }else{
    getLocalData();
  }
 notifyListeners();
}
List<String> favoriteList=[];
getFavoriteList()async{
  SharedPreferences shared=await SharedPreferences.getInstance();
  favoriteList = shared.getStringList("favorite")??[];
  notifyListeners();
}
addToFavorite(String id)async{
  favoriteList.add(id);
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setStringList("favorite", favoriteList);
  notifyListeners();
}

removeFromFavorite(String id)async{
  favoriteList.remove(id);
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setStringList("favorite", favoriteList);
  notifyListeners();
}

addToDatabase(){
List<OrderModelHive> orderSavedList=[];
listOfOrderModel.forEach((element) {
  AddressHive address=AddressHive()..lng=element.address?.lng
    ..lat=element.address?.lat;
  List<ItemsHive> listItems=[];
  element.items?.forEach((item) {
    listItems.add(ItemsHive()
    ..id=item.id
    ..price=item.price
    ..name=item.name);
  });
  orderSavedList.add(

  OrderModelHive()
    ..id=element.id
      ..total=element.total
      ..address=address
      ..currency=element.currency
      ..items=listItems
      ..image=element.image
      ..createdAt=element.createdAt

);

});
final orderSaved=OrderSaved()
  ..orderSaved=orderSavedList;
final box=Boxes.getOrdersSaved();
box.put("saved",orderSaved);
}

getLocalData()async{
await Future.delayed(Duration(seconds: 1));
listOfOrderModel=[];
  Hive.box<OrderSaved>("order_saved").values.firstWhere((element) =>
  element.key=="saved"
  ).orderSaved?.forEach((element){
    Address address=Address()..lat=element.address?.lat
    ..lng=element.address?.lng;
    List<Items> listItems=[];
    element.items?.forEach((item) {
      listItems.add(Items()
      ..id=item.id
          ..name=item.name
          ..price=item.price
      );
    });
    listOfOrderModel.add(
      OrderModel()..id=element.id
          ..createdAt=element.createdAt
          ..image=element.image
          ..currency=element.currency
          ..total=element.total
          ..address=address
          ..items=listItems
    );
  });
  notifyListeners();
}
}