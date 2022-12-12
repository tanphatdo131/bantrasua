import 'package:flutter/material.dart';

import '../../models/cart_item.dart';
import '../../models/order_item.dart';
import 'package:flutter/foundation.dart';


class OrdersManager with ChangeNotifier{ 
  final List<OrderItem> _orders = [
  OrderItem(
    id: '01',
    amount: 1, 
    products: [
        CartItem(
        id: 'c1',
        title: 'Trà Sữa Truyền Thống',
        price: 1,
        quantity: 1,
        )
      ],
      dateTime: DateTime.now(),
    )
  ];


  int get orderCount {
    return _orders.length;
    }
    List<OrderItem> get orders {
    return [..._orders];
    }
     void addOrder (List<CartItem> cartProducts, double total) async { 
    _orders.insert(
      0,
      OrderItem(
        id: 'o${DateTime.now().toIso8601String()}',
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
      notifyListeners();   
  }
}
