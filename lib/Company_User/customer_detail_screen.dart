import 'package:flutter/material.dart';

class CustomerDetailApp extends StatelessWidget {
  const CustomerDetailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Details',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: false,
      ),
      home: const CustomerDetailsPage(),
    );
  }
}

class AppColors {
  static const background = Color(0xFFFFF7EC);
  static const cardBackground = Colors.white;
  static const primaryText = Color(0xFF2F2F2F);
  static const secondaryText = Color(0xFF8A8A8A);
  static const accentBlue = Color(0xFF1A73E8);
  static const accentGreen = Color(0xFF2E9B4D);
  static const primaryOrange = Color(0xFFFF6B1A);
  static const lightOrange = Color(0xFFFFF1E0);
  static const borderColor = Color(0xFFE0E0E0);
  static const iconMuted = Color(0xFFB0B0B0);
  static const badgeBorderProcessing = Color(0xFFB0B0B0);
  static const purple = Color(0xFF7A36C9);
}

class Insets {
  static const double pageHorizontal = 16;
  static const double cardPadding = 16;
  static const double sectionSpacing = 16;
}

class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // -------------------------
      //   🔥 EXACT TOP BAR
      // -------------------------
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.07),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Customer_Detail_Screen/image/referable_logo.png',
                  height: 26,
                ),
                Image.asset(
                  'assets/Customer_Detail_Screen/icon/menu.png',
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),

      // -------------------------
      //          BODY
      // -------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Insets.pageHorizontal,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PageTitle(),
              SizedBox(height: 16),
              CustomerHeaderCard(),
              SizedBox(height: Insets.sectionSpacing),
              ReferralHistoryCard(),
              SizedBox(height: Insets.sectionSpacing),
              ReferralStatsCard(),
              SizedBox(height: Insets.sectionSpacing),
              ManualPayoutCard(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),

      // -------------------------
      //  🔥 EXACT BOTTOM NAV BAR
      // -------------------------
      bottomNavigationBar: Container(
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
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: 2,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: const Color(0xFFF97316),
          unselectedItemColor: const Color(0xFF4B5563),
          onTap: (_) {},

          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Customer_Detail_Screen/icon/home.png',
                height: 22,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Customer_Detail_Screen/icon/pipeline.png',
                height: 22,
              ),
              label: 'Pipeline',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Customer_Detail_Screen/icon/customers.png',
                height: 22,
              ),
              label: 'Customers',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Customer_Detail_Screen/icon/payments.png',
                height: 22,
              ),
              label: 'Payments',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Customer_Detail_Screen/icon/profile.png',
                height: 22,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Customer Details',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
      ),
    );
  }
}

// ---------------------------------------------------------
//                 ALL OTHER UI (UNCHANGED)
// ---------------------------------------------------------

class CustomerHeaderCard extends StatelessWidget {
  const CustomerHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(Insets.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomerMainInfo(),
          const SizedBox(height: 16),
          const _CustomerMetaInfo(),
        ],
      ),
    );
  }
}

class _CustomerMainInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _Avatar(),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sarah Johnson',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 4),

              Row(
                children: [
                  Icon(Icons.verified, size: 16, color: AppColors.accentBlue),
                  const SizedBox(width: 6),
                  const Text(
                    'Premium Customer',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(
        'assets/Customer_Detail_Screen/image/sarah.png',
      ),
    );
  }
}

class _CustomerMetaInfo extends StatelessWidget {
  const _CustomerMetaInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _MetaColumn(title: 'Email', value: 's.json@example.com'),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _MetaColumn(
            title: 'Phone',
            value: '(555) 123-4567',
            valueColor: AppColors.accentBlue,
          ),
        ),
      ],
    );
  }
}

class _MetaColumn extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;

  const _MetaColumn({
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13, color: AppColors.secondaryText),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: valueColor ?? AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 12),

        if (title == 'Email') ...[
          const Text(
            'Joined',
            style: TextStyle(fontSize: 13, color: AppColors.secondaryText),
          ),
          const SizedBox(height: 4),
          const Text(
            'Mar 15, 2025',
            style: TextStyle(fontSize: 14, color: AppColors.primaryText),
          ),
        ] else ...[
          const Text(
            'Status',
            style: TextStyle(fontSize: 13, color: AppColors.secondaryText),
          ),
          const SizedBox(height: 4),
          const Text(
            'Active',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.accentGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

class ReferralHistoryCard extends StatelessWidget {
  const ReferralHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Referral History',
      child: Column(
        children: const [
          ReferralHistoryItem(
            name: 'Referred Michael',
            timeLabel: 'Yesterday, 10:30 AM',
            badgeLabel: '\$50.00 earned',
            badgeType: ReferralBadgeType.earned,
          ),
          SizedBox(height: 10),
          ReferralHistoryItem(
            name: 'Referred David',
            timeLabel: '13 Aug, 9:30 AM',
            badgeLabel: '\$150.00 earned',
            badgeType: ReferralBadgeType.earned,
          ),
          SizedBox(height: 10),
          ReferralHistoryItem(
            name: 'Referred Tylor',
            timeLabel: '10 Aug, 12:30 PM',
            badgeLabel: 'Processing',
            badgeType: ReferralBadgeType.processing,
          ),
        ],
      ),
    );
  }
}

enum ReferralBadgeType { earned, processing }

class ReferralHistoryItem extends StatelessWidget {
  final String name;
  final String timeLabel;
  final String badgeLabel;
  final ReferralBadgeType badgeType;

  const ReferralHistoryItem({
    super.key,
    required this.name,
    required this.timeLabel,
    required this.badgeLabel,
    required this.badgeType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6EB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: AppColors.iconMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      timeLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _ReferralBadge(label: badgeLabel, type: badgeType),
        ],
      ),
    );
  }
}

class _ReferralBadge extends StatelessWidget {
  final String label;
  final ReferralBadgeType type;

  const _ReferralBadge({required this.label, required this.type});

  @override
  Widget build(BuildContext context) {
    final bool isEarned = type == ReferralBadgeType.earned;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isEarned ? const Color(0xFFFFF0E0) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isEarned
              ? Colors.transparent
              : AppColors.badgeBorderProcessing,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            isEarned
                ? 'assets/Customer_Detail_Screen/image/right.png'
                : 'assets/Customer_Detail_Screen/image/process.png',
            height: 16,
            width: 16,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isEarned
                  ? AppColors.primaryOrange
                  : AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class ReferralStatsCard extends StatelessWidget {
  const ReferralStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Referral Stats',
      child: Column(
        children: const [
          ReferralStatsRow(
            leftLabel: 'Total Referred',
            leftValue: '4',
            rightLabel: 'Success Rate',
            rightValue: '75%',
            rightColor: AppColors.primaryOrange,
          ),
          SizedBox(height: 12),
          ReferralStatsRow(
            leftLabel: 'Total Referrals',
            leftValue: '\$150.00',
            leftColor: AppColors.primaryOrange,
            rightLabel: 'Pending',
            rightValue: '\$50',
            rightColor: AppColors.purple,
          ),
        ],
      ),
    );
  }
}

class ReferralStatsRow extends StatelessWidget {
  final String leftLabel;
  final String leftValue;
  final String rightLabel;
  final String rightValue;
  final Color? leftColor;
  final Color? rightColor;

  const ReferralStatsRow({
    super.key,
    required this.leftLabel,
    required this.leftValue,
    required this.rightLabel,
    required this.rightValue,
    this.leftColor,
    this.rightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  leftLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  leftValue,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: leftColor ?? AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const _LineDivider(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Text(
                  rightLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  rightValue,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: rightColor ?? AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LineDivider extends StatelessWidget {
  const _LineDivider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (_) {
        return Container(
          width: 2,
          height: 8,
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: Color(0xFFDEBCA5),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(Insets.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class ManualPayoutCard extends StatelessWidget {
  const ManualPayoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Manual Payout',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Process a manual payout for this customer\'s referrals',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.secondaryText,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _OutlinedCircleCheckbox(),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Amount',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 8),
          const _AmountField(),
          const SizedBox(height: 16),
          const _ProceedButton(),
          const SizedBox(height: 14),
          const _ContactButtonsRow(),
        ],
      ),
    );
  }
}

class _OutlinedCircleCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Customer_Detail_Screen/image/manual_payment_icon.png',
      height: 26,
      width: 26,
      fit: BoxFit.contain,
    );
  }
}

class _AmountField extends StatelessWidget {
  const _AmountField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: '50',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: AppColors.secondaryText,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '\$',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _ProceedButton extends StatelessWidget {
  const _ProceedButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
        ),
        child: const Text(
          'Proceed Payout',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _ContactButtonsRow extends StatelessWidget {
  const _ContactButtonsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _ContactButton(label: 'Email')),
        SizedBox(width: 10),
        Expanded(child: _ContactButton(label: 'Call')),
        SizedBox(width: 10),
        Expanded(child: _ContactButton(label: 'Text')),
      ],
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String label;

  const _ContactButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primaryOrange, width: 1.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.primaryOrange),
        ),
      ),
    );
  }
}
