import '../models/cart_item_model.dart';

class CartManager {
  static final List<CartItem> _items = [];

  static List<CartItem> get items => [..._items];

  static int get itemCount => _items.length;

  static double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  static void addItem(CartItem item) {
    final existingIndex = _items.indexWhere(
      (cartItem) => cartItem.id == item.id,
    );

    if (existingIndex >= 0) {
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(item);
    }
  }

  static void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
  }

  static void updateQuantity(String itemId, int quantity) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      if (quantity <= 0) {
        removeItem(itemId);
      } else {
        _items[index] = _items[index].copyWith(quantity: quantity);
      }
    }
  }

  static void clearCart() {
    _items.clear();
  }

  static bool isInCart(String itemId) {
    return _items.any((item) => item.id == itemId);
  }

  static CartItem? getItem(String itemId) {
    try {
      return _items.firstWhere((item) => item.id == itemId);
    } catch (e) {
      return null;
    }
  }
}
