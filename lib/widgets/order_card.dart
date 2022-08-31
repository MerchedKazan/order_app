import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_app/model/order_model.dart';
import 'package:order_app/provider/order_provider.dart';
import 'package:order_app/screens/order_details.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatefulWidget {
  final OrderModel orderModel;
  const OrderCard({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    final orderProvider=Provider.of<OrderProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OrderDetails(orderModel: widget.orderModel)));
      },
      child: Card(

        elevation: 4,
        child:Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Id : ",style: TextStyle(
                            color: Color(0xff00241b),
                            fontWeight: FontWeight.bold
                        ),
                        ) ,TextSpan(
                          text: "${widget.orderModel.id}",style: TextStyle(
                            color: Color(0xff00241b)
                        ),
                        )
                      ]
                  ),
                  ),  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Date : ",style: TextStyle(
                            color: Color(0xff00241b),
                            fontWeight: FontWeight.bold
                        ),
                        ) ,TextSpan(
                          text: "${DateFormat("yyyy-MM-ddTHH:mm:ss").parse(widget.orderModel.createdAt??"")}",style: TextStyle(
                            color: Color(0xff00241b)
                        ),
                        )
                      ]
                  ),
                  ),  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Total : ",style: TextStyle(
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
                  ),
                  // Text("${DateTime.parse(widget.orderModel.createdAt??"").toLocal()}"),

                ],
              ),orderProvider.favoriteList.contains(widget.orderModel.id) ?Icon(Icons.favorite):SizedBox()
            ],
          ),
        ) ,
      ),
    );
  }
}
