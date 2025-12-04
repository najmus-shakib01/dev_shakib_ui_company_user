import 'package:flutter/material.dart';

class CreateUserAdminPage extends StatelessWidget {
  const CreateUserAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create User',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: false,
      ),
      home: const CreateUserPage(),
    );
  }
}

class AppColors {
  static const Color background = Color(0xFFFFFDF5);
  static const Color cardBackground = Colors.white;
  static const Color primaryOrange = Color(0xFFFC5C1B);
  static const Color cancelButtonBackground = Color(0xFFFEF3E4);
  static const Color cancelButtonBorder = Color(0xFFFEC795);
  static const Color textMain = Colors.black;
  static const Color textSecondary = Color(0xFF6F6F6F);
  static const Color textHint = Color(0xFFB3B8C5);
  static const Color inputBorder = Color(0xFFE4E4E8);
  static const Color noteBackground = Color(0xFFF0EDED);
}

class AppTextStyles {
  static const TextStyle headerTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textMain,
  );

  static const TextStyle headerSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textMain,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textMain,
  );

  static const TextStyle helperText = TextStyle(
    fontSize: 11,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  static const TextStyle buttonPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryOrange,
  );
}

InputDecoration buildInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      color: AppColors.textHint,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primaryOrange, width: 1.2),
    ),
  );
}

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

enum AccountStatus { pending, active }

class _CreateUserPageState extends State<CreateUserPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _notes = TextEditingController();

  String? _role;
  String _createdBy = 'Sarah Johnson (Admin)';
  AccountStatus _status = AccountStatus.pending;
  bool _confirm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.08),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Create_User_Admin/image/referable_logo.png',
                  height: 26,
                ),
                Image.asset(
                  'assets/Create_User_Admin/icon/menu.png',
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Create User", style: AppTextStyles.headerTitle),
              const SizedBox(height: 4),
              const Text(
                "Admin portal for creating new user accounts",
                style: AppTextStyles.headerSubtitle,
              ),
              const SizedBox(height: 24),

              _FormCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email Address", style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _email,
                      decoration: buildInputDecoration("Enter user's email"),
                    ),
                    const SizedBox(height: 20),

                    const Text("Password", style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: buildInputDecoration("Create password"),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Must be at least 8 characters with 1 number and 1\nspecial character',
                      style: AppTextStyles.helperText,
                    ),
                    const SizedBox(height: 20),

                    const Text("Confirm Password", style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _confirmPass,
                      obscureText: true,
                      decoration: buildInputDecoration("Confirm password"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              _FormCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Account Settings",
                      style: AppTextStyles.sectionTitle,
                    ),
                    const SizedBox(height: 20),

                    const Text("User Role", style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _role,
                      decoration: buildInputDecoration("Select User Role"),
                      items: const [
                        DropdownMenuItem(value: "Admin", child: Text("Admin")),
                        DropdownMenuItem(
                          value: "Manager",
                          child: Text("Manager"),
                        ),
                        DropdownMenuItem(
                          value: "Viewer",
                          child: Text("Viewer"),
                        ),
                      ],
                      onChanged: (v) => setState(() => _role = v),
                    ),
                    const SizedBox(height: 20),

                    const Text("Created By", style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _createdBy,
                      decoration: buildInputDecoration(""),
                      items: const [
                        DropdownMenuItem(
                          value: "Sarah Johnson (Admin)",
                          child: Text("Sarah Johnson (Admin)"),
                        ),
                        DropdownMenuItem(
                          value: "Michael Smith (Admin)",
                          child: Text("Michael Smith (Admin)"),
                        ),
                      ],
                      onChanged: (v) => setState(() => _createdBy = v!),
                    ),
                    const SizedBox(height: 20),

                    const Text("Account Status", style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio<AccountStatus>(
                              value: AccountStatus.pending,
                              groupValue: _status,
                              activeColor: AppColors.primaryOrange,
                              onChanged: (v) => setState(() => _status = v!),
                            ),
                            const Text("Pending Activation"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<AccountStatus>(
                              value: AccountStatus.active,
                              groupValue: _status,
                              activeColor: AppColors.primaryOrange,
                              onChanged: (v) => setState(() => _status = v!),
                            ),
                            const Text("Active"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              _FormCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Notes', style: AppTextStyles.sectionTitle),
                        const SizedBox(width: 4),
                        const Text(
                          '(Optional)',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textHint,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),

                        Image.asset(
                          'assets/Create_User_Admin/icon/edit.png',
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.noteBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(14),
                      child: TextField(
                        controller: _notes,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'Add any additional information about\nthis user',
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _confirm = !_confirm;
                      });
                    },
                    child: Image.asset(
                      'assets/Create_User_Admin/icon/confirm.png',
                      height: 26,
                      width: 26,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I confirm all information is correct and I have\npermission to create this account',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textMain,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Create User Account",
                    style: AppTextStyles.buttonPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 52,
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.cancelButtonBackground,
                    side: const BorderSide(
                      color: AppColors.cancelButtonBorder,
                      width: 1.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Cancel",
                    style: AppTextStyles.buttonSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          selectedItemColor: const Color(0xFFF97316),
          unselectedItemColor: const Color(0xFF4B5563),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (_) {},
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Create_User_Admin/icon/home.png',
                height: 22,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Create_User_Admin/icon/pipeline.png',
                height: 22,
              ),
              label: "Pipeline",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Create_User_Admin/icon/customers.png',
                height: 22,
              ),
              label: "Customers",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Create_User_Admin/icon/payments.png',
                height: 22,
              ),
              label: "Payments",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Create_User_Admin/icon/profile.png',
                height: 22,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final Widget child;
  const _FormCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
