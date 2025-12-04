import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileAndSettingApp());
}

class ProfileAndSettingApp extends StatelessWidget {
  const ProfileAndSettingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileSettingsPage(),
    );
  }
}

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EA),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/Profile_Setting/image/referable_logo.png",
                    height: 26,
                  ),
                  Image.asset(
                    "assets/Profile_Setting/icon/menu.png",
                    height: 24,
                  ),
                ],
              ),
            ),

            Container(height: 1, color: Colors.black.withOpacity(0.12)),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProfileHeader(),

                    SizedBox(height: 24),
                    CompanyInformationCard(),

                    SizedBox(height: 20),
                    CompanyLogoCard(),

                    SizedBox(height: 20),
                    SupportHelpCard(),

                    SizedBox(height: 20),
                    FooterButtons(),

                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Profile & Settings",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Manage your company information and app\nsettings",
          style: TextStyle(
            fontSize: 15,
            height: 1.3,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

class AppCard extends StatelessWidget {
  final Widget child;

  const AppCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }
}

class CompanyInformationCard extends StatelessWidget {
  const CompanyInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Company Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),

          LabeledTextField(label: "Company Name", value: "Acme Corporation"),

          SizedBox(height: 16),
          LabeledTextField(
            label: "Business Email",
            value: "contact@acmecorp.com",
          ),

          SizedBox(height: 16),
          LabeledTextField(label: "Business Phone", value: "(555) 123-4567"),

          SizedBox(height: 16),
          LabeledTextField(
            label: "Business Address",
            value: "123 Business Ave, Suite 101, San\nFrancisco, CA 94107",
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  final String label;
  final String value;
  final int maxLines;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.value,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.85),
          ),
        ),
        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1.3),
          ),
          child: Text(
            value,
            maxLines: maxLines,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}

class CompanyLogoCard extends StatelessWidget {
  const CompanyLogoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Company Logo",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 18),

          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/Profile_Setting/image/acme_logo.png",
                  height: 84,
                  width: 84,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Upload a square logo for best results",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 14),

                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6A1A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Upload New Logo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),
          Text(
            "Recommended size: 512x512 pixels",
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          const Text(
            "Max file size: 2MB",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SupportHelpCard extends StatelessWidget {
  const SupportHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Support & Help",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),

          SupportItem(
            title: "Documentation",
            iconPath: "assets/Profile_Setting/icon/document_icon.png",
          ),

          const _DashedDivider(),

          SupportItem(
            title: "FAQs",
            iconPath: "assets/Profile_Setting/icon/faq_icon.png",
          ),

          const _DashedDivider(),

          SupportItem(
            title: "Contact Support",
            iconPath: "assets/Profile_Setting/icon/support_icon.png",
          ),

          const _DashedDivider(),

          SupportItem(
            title: "Tutorial Videos",
            iconPath: "assets/Profile_Setting/icon/video_icon.png",
          ),
        ],
      ),
    );
  }
}

class SupportItem extends StatelessWidget {
  final String title;
  final String iconPath;

  const SupportItem({super.key, required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          Image.asset(iconPath, height: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final dashWidth = 6.0;
        final dashSpace = 6.0;
        final count = (c.maxWidth / (dashWidth + dashSpace)).floor();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: List.generate(count, (_) {
              return Container(
                width: dashWidth,
                height: 1,
                color: Colors.grey.shade300,
                margin: EdgeInsets.only(right: dashSpace),
              );
            }),
          ),
        );
      },
    );
  }
}

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: BorderSide(color: Colors.grey.shade400),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.grey.shade800),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6A1A),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              "Save Changes",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 4,
      unselectedItemColor: const Color(0xFF4B5563),
      type: BottomNavigationBarType.fixed,

      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/Profile_Setting/icon/home.png", height: 22),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Profile_Setting/icon/pipeline.png",
            height: 22,
          ),
          label: "Pipeline",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Profile_Setting/icon/customers.png",
            height: 22,
          ),
          label: "Customers",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Profile_Setting/icon/payments.png",
            height: 22,
          ),
          label: "Payments",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Profile_Setting/icon/profile.png",
            height: 22,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
