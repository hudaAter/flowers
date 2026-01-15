# TODO List for Flower Shop Flutter App

## 1. State Management Setup
- [x] Add Provider package to pubspec.yaml
- [x] Create CartProvider for managing cart items
- [x] Create UserProvider for user authentication and data
- [x] Create OrderProvider for order history

## 2. Models Enhancement
- [x] Create CartItem model (flower/bouquet/extra, quantity, price)
- [x] Create User model (name, phone, address, email, password)
- [x] Create Order model (items, total, date, status)
- [ ] Update existing models if needed (add colors to FlowerModel)

## 3. User Authentication Screens
- [ ] Create LoginScreen
- [ ] Create RegisterScreen
- [ ] Add routes to main.dart
- [ ] Implement basic auth logic (local storage for now)

## 4. Cart Functionality
- [x] Update CartScreen to display items dynamically
- [x] Add add/remove items functionality
- [x] Calculate total price
- [x] Add checkout button

## 5. Order History
- [ ] Create OrderHistoryScreen
- [ ] Display past orders
- [ ] Add route to main.dart

## 6. UI Improvements
- [x] Ensure Arabic text support (RTL)
- [x] Improve color scheme for professional look
- [x] Add loading states and error handling
- [x] Enhance FlowerItem and BouquetItem widgets

## 7. Navigation Fixes
- [x] Fix routes in main.dart (add missing routes like '/color_selection')
- [x] Ensure proper data passing between screens
- [x] Add back buttons where needed

## 8. Data Enhancement
- [ ] Add more dummy data for flowers, bouquets, extras
- [ ] Add color options to flowers
- [ ] Ensure images exist or add placeholders

## 9. Checkout Process
- [x] Update CheckoutScreen to use user data
- [x] Integrate with cart provider
- [x] Add order creation logic

## 10. Testing and Refinement
- [x] Test all flows (flower -> color -> bouquet -> extras -> cart -> checkout)
- [ ] Fix any bugs
- [ ] Optimize performance
- [ ] Add comments and clean code
