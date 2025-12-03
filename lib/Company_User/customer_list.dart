import 'package:flutter/material.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  Color get _backgroundColor => const Color(0xFFFFF7EB);
  Color get _cardBackgroundColor => Colors.white;
  Color get _primaryOrange => const Color(0xFFFF5A1F);
  Color get _exportPurple => const Color(0xFF635BFF);
  Color get _inactiveRed => const Color(0xFFEF4444);
  Color get _pendingOrange => const Color(0xFFF97316);
  Color get _activeGreen => const Color(0xFF22C55E);
  Color get _textDark => const Color(0xFF111827);
  Color get _textGray => const Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: _backgroundColor,
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
                  'assets/Company_User/image/referable_logo.png',
                  height: 24,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  'assets/Company_User/icon/menu.png',
                  height: 22,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _buildCustomersHeader(),
          const SizedBox(height: 16),
          _buildCustomersTableCard(),
          const SizedBox(height: 24),
          _buildAddNewCustomerButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildCustomersHeader() {
    return Row(
      children: [
        Text(
          'Customers',
          style: TextStyle(
            color: _textDark,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: Image.asset(
            'assets/Company_User/icon/filter.png',
            height: 22,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: _exportPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Export',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomersTableCard() {
    return Container(
      decoration: BoxDecoration(
        color: _cardBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTableHeaderRow(),
          const Divider(height: 1),
          _buildCustomerRow(
            avatarPath: 'assets/Company_User/image/sarah.png',
            name: 'Sarah Johnson',
            statusLabel: 'Active',
            statusColor: _activeGreen,
            activity: '24',
            payouts: '\$2,500',
          ),
          const Divider(height: 1),
          _buildCustomerRow(
            avatarPath: 'assets/Company_User/image/michael.png',
            name: 'Michael Chen',
            statusLabel: 'Pending',
            statusColor: _pendingOrange,
            outlined: true,
            activity: '8',
            payouts: '\$1,500',
          ),
          const Divider(height: 1),
          _buildCustomerRow(
            avatarPath: 'assets/Company_User/image/david.png',
            name: 'David Wilson',
            statusLabel: 'Inactive',
            statusColor: _inactiveRed,
            activity: '33',
            payouts: '\$5,500',
          ),
          const Divider(height: 1),
          _buildCustomerRow(
            avatarPath: 'assets/Company_User/image/aisha.png',
            name: 'Aisha Patel',
            statusLabel: 'Active',
            statusColor: _activeGreen,
            activity: '7',
            payouts: '\$1,500',
          ),
          const Divider(height: 1),
          _buildTableFooter(),
        ],
      ),
    );
  }

  Widget _buildTableHeaderRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              'Customer',
              style: TextStyle(
                color: _textGray,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Status',
              style: TextStyle(
                color: _textGray,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Activity',
              style: TextStyle(
                color: _textGray,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Payouts',
              style: TextStyle(
                color: _textGray,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerRow({
    required String avatarPath,
    required String name,
    required String statusLabel,
    required Color statusColor,
    required String activity,
    required String payouts,
    bool outlined = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(avatarPath),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: _textDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: outlined
                      ? Colors.transparent
                      : statusColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(18),
                  border: outlined
                      ? Border.all(color: statusColor, width: 1)
                      : Border.all(color: Colors.transparent),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              activity,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _textDark,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              payouts,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: _textDark,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Showing 5 of 28 customers',
              style: TextStyle(
                color: _textGray,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Left arrow
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: Colors.black87,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewCustomerButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryOrange,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Add New Customer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2, 
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: const Color(0xFFF97316),
        unselectedItemColor: const Color(0xFF4B5563),
        onTap: (_) {},
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/Company_User/icon/home.png', height: 22),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Company_User/icon/pipeline.png',
              height: 22,
            ),
            label: 'Pipeline',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Company_User/icon/customers.png',
              height: 22,
            ),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Company_User/icon/payments.png',
              height: 22,
            ),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Company_User/icon/profile.png',
              height: 22,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CustomerListPage extends CustomerListScreen {
  const CustomerListPage({Key? key}) : super(key: key);
}

class CustomerList extends CustomerListScreen {
  const CustomerList({Key? key}) : super(key: key);
}

class CustomerListView extends CustomerListScreen {
  const CustomerListView({Key? key}) : super(key: key);
}
