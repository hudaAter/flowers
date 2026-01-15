import 'package:flutter/material.dart';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => [..._orders];

  void addOrder(OrderModel order) {
    _orders.add(order);
    notifyListeners();
  }

  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }
}
