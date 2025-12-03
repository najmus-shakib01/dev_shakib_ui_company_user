import 'package:dev_shakib_ui_customer/Company_User/customer_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ReferableApp());
}

class ReferableApp extends StatelessWidget {
  const ReferableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Company User Referral App',
      home: const CustomerListPage(),
    );
  }
}
