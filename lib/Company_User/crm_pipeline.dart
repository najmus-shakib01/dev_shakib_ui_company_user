import 'package:flutter/material.dart';

void main() {
  runApp(const CrmPipelineApp());
}

class AppColors {
  static const Color background = Color(0xFFFFFDF6);
  static const Color primary = Color(0xFFF6AA23);
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF8B8B8B);

  static const Color followUpBorder = Color(0xFFE5A8EC);
  static const Color followUpBackground = Color(0xFFFFF4FF);
}

class CrmPipelineApp extends StatelessWidget {
  const CrmPipelineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Referable',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: false,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      home: const CrmHomeScreen(),
    );
  }
}

enum PipelineStage { pending, accepted, won, lost }

enum LeadStatus { newLead, followUp }

class Lead {
  final String name;
  final String referredBy;
  final String addedDateLabel;
  final String valueLabel;
  final LeadStatus status;

  const Lead({
    required this.name,
    required this.referredBy,
    required this.addedDateLabel,
    required this.valueLabel,
    required this.status,
  });
}

class CrmHomeScreen extends StatefulWidget {
  const CrmHomeScreen({super.key});

  @override
  State<CrmHomeScreen> createState() => _CrmHomeScreenState();
}

class _CrmHomeScreenState extends State<CrmHomeScreen> {
  PipelineStage _selectedStage = PipelineStage.won;

  final List<Lead> _wonLeads = const [
    Lead(
      name: 'Sarah Johnson',
      referredBy: 'Michael Thompson',
      addedDateLabel: 'Added: Oct 12, 2025',
      valueLabel: 'Value: \$2,500',
      status: LeadStatus.newLead,
    ),
    Lead(
      name: 'Robert Chen',
      referredBy: 'Jessica Wu',
      addedDateLabel: 'Added: Oct 10, 2025',
      valueLabel: 'Value: \$4,200',
      status: LeadStatus.newLead,
    ),
    Lead(
      name: 'Emily Rodriguez',
      referredBy: 'David Martinez',
      addedDateLabel: 'Added: Oct 5, 2025',
      valueLabel: 'Value: \$1,800',
      status: LeadStatus.followUp,
    ),
    Lead(
      name: 'Thomas Wilson',
      referredBy: 'Amanda Clark',
      addedDateLabel: 'Added: Oct 3, 2025',
      valueLabel: 'Value: \$3,750',
      status: LeadStatus.followUp,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth > 430
                ? 430
                : constraints.maxWidth;

            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
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
                            'assets/Crm_Pipeline/image/referable_logo.png',
                            height: 26,
                          ),
                          Image.asset(
                            'assets/Crm_Pipeline/icon/menu.png',
                            height: 22,
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: [
                          const SizedBox(height: 24),

                          Text(
                            'CRM Pipeline',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),

                          const SizedBox(height: 24),

                          _StageTabBar(
                            selectedStage: _selectedStage,
                            onStageSelected: (stage) {
                              setState(() {
                                _selectedStage = stage;
                              });
                            },
                          ),

                          const SizedBox(height: 24),

                          ..._wonLeads.map(
                            (lead) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: LeadCard(lead: lead),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StageTabBar extends StatelessWidget {
  final PipelineStage selectedStage;
  final ValueChanged<PipelineStage> onStageSelected;

  const _StageTabBar({
    required this.selectedStage,
    required this.onStageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 237, 232, 221), 
          width: 2, 
        ),
        borderRadius: BorderRadius.circular(12), 
      ),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: _StageTabButton(
                label: 'Pending',
                isSelected: selectedStage == PipelineStage.pending,
                onTap: () => onStageSelected(PipelineStage.pending),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StageTabButton(
                label: 'Accepted',
                isSelected: selectedStage == PipelineStage.accepted,
                onTap: () => onStageSelected(PipelineStage.accepted),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StageTabButton(
                label: 'Won',
                isSelected: selectedStage == PipelineStage.won,
                onTap: () => onStageSelected(PipelineStage.won),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StageTabButton(
                label: 'Lost',
                isSelected: selectedStage == PipelineStage.lost,
                onTap: () => onStageSelected(PipelineStage.lost),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StageTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _StageTabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: isSelected ? Colors.white : AppColors.primary,
    );

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.primary,
            width: isSelected ? 0 : 1.4,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(label, style: textStyle),
      ),
    );
  }
}

class LeadCard extends StatelessWidget {
  final Lead lead;

  const LeadCard({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _LeadTitleSection(lead: lead)),
                StatusChip(status: lead.status),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Text(
                  lead.addedDateLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: 'Value: ',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      TextSpan(
                        text: lead.valueLabel.replaceFirst('Value: ', ''),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LeadTitleSection extends StatelessWidget {
  final Lead lead;

  const _LeadTitleSection({required this.lead});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lead.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            text: 'Referred by: ',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
            children: [
              TextSpan(
                text: lead.referredBy,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatusChip extends StatelessWidget {
  final LeadStatus status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final bool isNew = status == LeadStatus.newLead;
    final String label = isNew ? 'New' : 'Follow-up';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isNew ? const Color(0xFFFFF7E6) : AppColors.followUpBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isNew ? AppColors.primary : AppColors.followUpBorder,
          width: 1.4,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: isNew ? AppColors.primary : AppColors.followUpBorder,
        ),
      ),
    );
  }
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
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/Crm_Pipeline/icon/home.png', height: 22),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Crm_Pipeline/icon/pipeline.png',
            height: 22,
          ),
          label: 'Pipeline',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Crm_Pipeline/icon/customers.png',
            height: 22,
          ),
          label: 'Customers',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Crm_Pipeline/icon/payments.png',
            height: 22,
          ),
          label: 'Payments',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Crm_Pipeline/icon/profile.png', height: 22),
          label: 'Profile',
        ),
      ],
    ),
  );
}
