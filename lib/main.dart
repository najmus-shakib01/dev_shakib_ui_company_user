// import 'package:dev_shakib_ui_customer/Company_User/customer_list.dart';
import 'package:dev_shakib_ui_customer/Company_User/crm_pipeline.dart';
// import 'package:dev_shakib_ui_customer/Company_User/customer_detail_screen.dart';
// import 'package:dev_shakib_ui_customer/Company_User/profile_and_setting.dart';
// import 'package:dev_shakib_ui_customer/Company_User/referral_management_dashboard.dart';
// import 'package:dev_shakib_ui_customer/Company_User/create_user_admin.dart';
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
      // home: const CustomerListPage(),
      home: const CrmPipelineApp(),
      // home: const CustomerDetailApp(),
      // home: const ProfileAndSettingApp(),
      // home: const ReferableManagementDashboard(),
      // home: const CreateUserAdminPage(),
    );
  }
}
