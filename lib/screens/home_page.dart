import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:order_app/provider/order_provider.dart';
import 'package:order_app/services/hive/boxes.dart';
import 'package:order_app/services/hive/order_hive.dart';
import 'package:order_app/services/order_service.dart';
import 'package:order_app/widgets/order_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ScrollController _controller;

  getData()async{
final orderProvider=Provider.of<OrderProvider>(context,listen:false);
await orderProvider.getData();
await orderProvider.getFavoriteList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _controller=ScrollController()..addListener(() {
      if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
        getData();
      }
    });
  }

  // loadMore()async{
  //
  //   final orderProvider=Provider.of<OrderProvider>(context,listen:false);
  //   await orderProvider.getData();
  // }


  @override
  void dispose() {
    _controller.removeListener(getData);
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final orderProvider=Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Orders",style: Theme.of(context).textTheme.titleMedium,),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(30),
      )),
      centerTitle: true,
      ),
      body: ListView.builder(
        controller: _controller,
        padding:const EdgeInsets.all(10),
        itemBuilder: (context, index) {
       return OrderCard(orderModel: orderProvider.listOfOrderModel[index]);
      },itemCount: orderProvider.listOfOrderModel.length,));
  }
}
