import 'bouquet_model.dart';

List<BouquetModel> bouquetsData = [
  BouquetModel(
    id: "1",
    name: "Red Roses Bouquet",
    image: "assets/images/bouquet1.jpeg",
    price: 25.0,
    occasion: "عيد ميلاد", // 👈 لازم يكون موجود
    count: 12,            // 👈 لازم يكون موجود
  ),
  BouquetModel(
    id: "2",
    name: "White Flowers",
    image: "assets/images/bouquet2.jpeg",
    price: 30.0,
    occasion: "زواج",
    count: 24,
  ),
  BouquetModel(
    id: "3",
    name: "Mixed Flowers",
    image: "assets/images/bouquet3.jpeg",
    price: 40.0,
    occasion: "خطوبة",
    count: 18,
  ),
  BouquetModel(
    id: "4",
    name: "Pink Flowers",
    image: "assets/images/bouquet4.jpeg",
    price: 18.0,
    occasion: "زيارة",
    count: 9,
  ),
];
