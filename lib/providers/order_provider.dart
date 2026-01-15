import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../models/cart_item_model.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  List<Order> get userOrders {
    // In real app, filter by current user
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double totalAmount) {
    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: cartItems,
      totalAmount: totalAmount,
      dateTime: DateTime.now(),
    );

    _orders.add(order);
    notifyListeners();
  }

  Order? getOrderById(String orderId) {
    try {
      return _orders.firstWhere((order) => order.id == orderId);
    } catch (e) {
      return null;
    }
  }

  void updateOrderStatus(String orderId, String status) {
    final index = _orders.indexWhere((order) => order.id == orderId);
    if (index >= 0) {
      // Create new order with updated status
      final updatedOrder = Order(
        id: _orders[index].id,
        items: _orders[index].items,
        totalAmount: _orders[index].totalAmount,
        dateTime: _orders[index].dateTime,
        status: status,
      );
      _orders[index] = updatedOrder;
      notifyListeners();
    }
  }

  int get orderCount => _orders.length;

  double get totalSpent {
    return _orders.fold(0.0, (sum, order) => sum + order.totalAmount);
  }
}
