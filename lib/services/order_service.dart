import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:order_app/helper.dart';
class OrderService{
  getData({
    int? pageNum
})async{
    Map data={};
    try{
      Map<String,String> headers={
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      Uri uri=Uri.parse("${ConstantValues.serverUrl}/api/v1/orders?page=$pageNum&limit=15");
      Future<http.Response> request=http.get(uri,headers: headers);
      http.Response response=await request;
      if(response.statusCode==200){
         data=jsonDecode(response.body);
        return data;
      }else{
        return data;
      }
    }
    catch(e){
      print(e);
return data;
    }
  }

}