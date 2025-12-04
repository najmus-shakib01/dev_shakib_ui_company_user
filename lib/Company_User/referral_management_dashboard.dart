import 'package:flutter/material.dart';

class ReferableManagementDashboard extends StatelessWidget {
  const ReferableManagementDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Referable UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFBF2)),
      home: const ProspectScreen(),
    );
  }
}

class ProspectScreen extends StatelessWidget {
  const ProspectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF2),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Container(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 14,
            bottom: 14,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBF2),
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
                'assets/Referral_Management_Dashboard/image/referable_logo.png',
                height: 28,
              ),
              Image.asset(
                'assets/Referral_Management_Dashboard/icon/menu.png',
                height: 26,
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: const [
              ProspectInfoCard(),
              SizedBox(height: 18),
              ReferrerInfoCard(),
              SizedBox(height: 18),
              ReferralMessagesCard(),
              SizedBox(height: 18),
              NotesCard(),
              SizedBox(height: 18),
              ActionsCard(),
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
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          selectedItemColor: const Color(0xFFF97316),
          unselectedItemColor: const Color(0xFF4B5563),
          onTap: (_) {},
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Referral_Management_Dashboard/icon/home.png',
                height: 22,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Referral_Management_Dashboard/icon/pipeline.png',
                height: 22,
              ),
              label: 'Pipeline',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Referral_Management_Dashboard/icon/customers.png',
                height: 22,
              ),
              label: 'Customers',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Referral_Management_Dashboard/icon/payments.png',
                height: 22,
              ),
              label: 'Payments',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Referral_Management_Dashboard/icon/profile.png',
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

class AppColors {
  static const card = Colors.white;
  static const label = Color(0xFF7F7F7F);
  static const textDark = Color(0xFF1E1E1E);
  static const bulletGrey = Color(0xFFBFBFBF);
  static const softShadow = Color(0x1A000000);
}

class AppText {
  static const title = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.label,
  );
  static const value = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);
  static const small = TextStyle(fontSize: 13, color: Color(0xFF444444));
}

class ShadowCard extends StatelessWidget {
  final Widget child;
  const ShadowCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class ProspectInfoCard extends StatelessWidget {
  const ProspectInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("Prospect Info", style: AppText.title),
                  const SizedBox(width: 6),
                  Image.asset(
                    "assets/Referral_Management_Dashboard/icon/edit.png",
                    height: 18,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/Referral_Management_Dashboard/icon/star.png",
                    height: 18,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "New Lead",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E6C2F),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 18),

          infoField("FULL NAME", "Michael Rodriguez"),
          infoField("EMAIL", "michael.rodriguez@example.com"),
          infoField("PHONE", "(555) 123-4567"),
          infoField("COMPANY", "Acme Corporation"),

          const SizedBox(height: 8),

          infoField("POTENTIAL VALUE", "\$12,500"),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("REFERRAL DATE", style: AppText.label),
                    SizedBox(height: 3),
                    Text("Oct 15, 2025", style: AppText.value),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.label),
          const SizedBox(height: 3),
          Text(value, style: AppText.value),
        ],
      ),
    );
  }
}

class ReferrerInfoCard extends StatelessWidget {
  const ReferrerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Referrer Info", style: AppText.title),
              const SizedBox(width: 6),
              Image.asset(
                "assets/Referral_Management_Dashboard/icon/info.png",
                height: 20,
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                  "assets/Referral_Management_Dashboard/image/sarah.png",
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sarah Thompson",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset(
                        "assets/Referral_Management_Dashboard/icon/medal.png",
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Loyal Customer (3+ years)",
                        style: AppText.small,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),

          infoField("EMAIL", "sarah.t@example.com"),
          infoField("PHONE", "(555) 987-6543"),
        ],
      ),
    );
  }

  Widget infoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.label),
          const SizedBox(height: 3),
          Text(value, style: AppText.value),
        ],
      ),
    );
  }
}

class ReferralMessagesCard extends StatelessWidget {
  const ReferralMessagesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Referable Messages",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            height: 1,
            color: Colors.grey.withOpacity(
              0.25,
            ), 
          ),

          const SizedBox(height: 12),
          const Text(
            "Sarah",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 2),

          const Text(
            "Referral Messages",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),

          const SizedBox(height: 16),

          timeMeta("Sent message to Michael", "Yesterday, 10:30 AM"),

          const SizedBox(height: 10),

          messageBar(
            Colors.orange,
            "Hey Michael! I just had this amazing solar system installed "
            "on my home by Convert Solar! My power bill is now literally \$0. "
            "I thought you might be interested getting some more info.",
          ),

          const SizedBox(height: 20),

          calendarMeta("Sarah", "Oct 15, 10:34 AM"),

          const SizedBox(height: 10),

          messageBar(
            Colors.purpleAccent,
            "I've known Michael for years. He's been looking for a solution "
            "like ours for his company's expansion plans. Definitely worth prioritizing!",
          ),
        ],
      ),
    );
  }

  Widget timeMeta(String name, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppText.small),
        Row(
          children: [
            Image.asset(
              "assets/Referral_Management_Dashboard/icon/clock.png",
              height: 14,
            ),
            const SizedBox(width: 6),
            Text(time, style: AppText.small),
          ],
        ),
      ],
    );
  }

  Widget calendarMeta(String name, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppText.small),
        Row(
          children: [
            Image.asset(
              "assets/Referral_Management_Dashboard/icon/calendar.png",
              height: 14,
            ),
            const SizedBox(width: 6),
            Text(time, style: AppText.small),
          ],
        ),
      ],
    );
  }

  Widget messageBar(Color color, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 5,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class NotesCard extends StatelessWidget {
  const NotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Notes", style: AppText.title),
              const SizedBox(width: 6),
              Image.asset(
                "assets/Referral_Management_Dashboard/icon/edit.png",
                height: 16,
              ),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F3EB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Michael is interested in our enterprise solution. "
              "He needs a proposal by end of month. Sarah mentioned he has budget approval for Q4.",
              style: AppText.small,
            ),
          ),

          const SizedBox(height: 18),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              onPressed: () {},
              child: const Text("Add Note", style: TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionsCard extends StatelessWidget {
  const ActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Actions", style: AppText.title),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: actionBtn("Accept", Colors.amber.shade500)),
              const SizedBox(width: 12),
              Expanded(
                child: actionBtn(
                  "Spam",
                  const Color(0xFF0D2240),
                  textWhite: true,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: actionBtn(
                  "Won",
                  const Color(0xFFFF7043),
                  textWhite: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: actionBtn(
                  "Lost",
                  const Color(0xFFC62828),
                  textWhite: true,
                ),
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(top: 16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange.shade600, width: 1.4),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Back to Pipeline",
                  style: TextStyle(
                    color: Colors.orange.shade600,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget actionBtn(String label, Color bg, {bool textWhite = false}) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: textWhite ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
