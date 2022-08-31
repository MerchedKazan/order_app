import 'package:hive/hive.dart';
import 'package:order_app/services/hive/order_hive.dart';


class Boxes{
  static Box<OrderSaved> getOrdersSaved()=> Hive.box<OrderSaved>('order_saved');
}