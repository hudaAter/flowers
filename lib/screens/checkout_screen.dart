import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  final double totalPrice;

  const CheckoutScreen({super.key, required this.totalPrice});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String phone = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تسجيل الطلب"),
        backgroundColor: AppColors.primaryPink,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              /// الاسم
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "الاسم الكامل",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "الرجاء إدخال الاسم";
                  }
                  return null;
                },
                onSaved: (value) => name = value ?? '',
              ),

              const SizedBox(height: 12),

              /// رقم الهاتف
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "رقم الهاتف",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "الرجاء إدخال رقم الهاتف";
                  }
                  return null;
                },
                onSaved: (value) => phone = value ?? '',
              ),

              const SizedBox(height: 12),

              /// عنوان التسليم
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "عنوان التسليم",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "الرجاء إدخال عنوان التسليم";
                  }
                  return null;
                },
                onSaved: (value) => address = value ?? '',
              ),

              const SizedBox(height: 20),

              /// السعر الإجمالي
              Text(
                "السعر الإجمالي: \$${widget.totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              /// زر تأكيد الطلب
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPink,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // عرض رسالة تأكيد الطلب
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("تم تسجيل الطلب"),
                            content: Text(
                                "شكرًا $name! سيتم توصيل طلبك إلى $address.\nالسعر الإجمالي: \$${widget.totalPrice.toStringAsFixed(2)}"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.popUntil(
                                      context,
                                      (route) => route.isFirst);
                                },
                                child: const Text("موافق"),
                              )
                            ],
                          );
                        });
                  }
                },
                child: const Text(
                  "تأكيد الطلب والدفع يدوي",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
