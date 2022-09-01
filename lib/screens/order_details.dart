import 'package:flutter/material.dart';
import 'package:order_app/provider/order_provider.dart';
import 'package:order_app/services/audio_player.dart';
import 'package:order_app/services/local_notification.dart';
import 'package:order_app/widgets/location_of_order.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/order_model.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel orderModel;
  const OrderDetails({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // double total=0.0;
  initalizeNotification()async{
    await LocalNotification.initialize();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeNotification();
    // widget.orderModel.items?.forEach((element) {
    //   total+=double.parse(element.price??"0.0");
    // });
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context).size;
    final orderProvider=Provider.of<OrderProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Details",style: Theme.of(context).textTheme.titleMedium),
          foregroundColor: Color(0xff00241b),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: mediaQuery.height * 0.4,
                child: LocationOfOrder(
                  latitude: double.parse(widget.orderModel.address?.lat??"0.0"),
                  longitude: double.parse(widget.orderModel.address?.lng??"0.0"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Details",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold
                    )),
                    InkWell(
                        onTap: ()async {
                          if( orderProvider.favoriteList.contains(widget.orderModel.id)){
                            orderProvider.removeFromFavorite(widget.orderModel.id??"0");
                            Audio_PLayer().playAudio();
                          }else{
                            orderProvider.addToFavorite(widget.orderModel.id??"0");
                            await LocalNotification.showNotification(
                              title: "Favorite",
                              body: "Added to favorite",
                            );
                          }
                        },
                        child: Icon(orderProvider.favoriteList.contains(widget.orderModel.id) ?Icons.favorite:Icons.favorite_border,))
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("${widget.orderModel.items?[index].name}",style: TextStyle(
                   color: Color(0xff00241b)
                  ),),
                  subtitle: Text("${widget.orderModel.items?[index].price} ${widget.orderModel.currency}",style: TextStyle(
                      color: Color(0xff00241b)
                  ),),
                );
              },itemCount: widget.orderModel.items?.length,),
              // Text("${total} ${widget.orderModel.currency}"),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "Total: ",style: TextStyle(
                      color: Color(0xff00241b),
                    fontWeight: FontWeight.bold
                  ),
                  ) ,TextSpan(
                    text: "${widget.orderModel.total} ${widget.orderModel.currency}",style: TextStyle(
                      color: Color(0xff00241b)
                  ),
                  )
                ]
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
