import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Figtree',
      ),
      home: const PhoneFrame(),
    );
  }
}

// Phone Frame Wrapper
class PhoneFrame extends StatelessWidget {
  const PhoneFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),
      body: Center(
        child: Container(
          width: 400,
          height: 844,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 5,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Navigator(
                      onGenerateRoute: (settings) {
                        return MaterialPageRoute(
                          builder: (context) => const BusinessAccountHome(),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 4,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//        BUSINESS ACCOUNT HOME SCREEN
// ─────────────────────────────────────────────

class BusinessAccountHome extends StatelessWidget {
  const BusinessAccountHome({super.key});

  @override
  Widget build(BuildContext context) {
    const headerColor = Color(0xFFE1E456);
    const pageBackground = Color(0xFFF7F8F2);

    return Scaffold(
      backgroundColor: headerColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              top: 160,
              child: Container(color: pageBackground),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '9:41',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF151712),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_4_bar, size: 16, color: Color(0xFF151712)),
                          SizedBox(width: 4),
                          Icon(Icons.wifi, size: 16, color: Color(0xFF151712)),
                          SizedBox(width: 4),
                          Icon(Icons.battery_full, size: 20, color: Color(0xFF151712)),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _TopBar(),
                        SizedBox(height: 24),
                        _BalanceCard(),
                        SizedBox(height: 24),
                        _BuyLocalSection(),
                        SizedBox(height: 24),
                        _ActivitySection(),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);

    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/brand-teya-symbol.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Row(
            children: [
              Text(
                'Perk Up Cafe',
                style: TextStyle(
                  color: primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 18, color: primaryText),
            ],
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.settings_outlined, color: primaryText, size: 20),
        ),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    const subtleText = Color(0xFF8F928C);
    const primaryText = Color(0xFF151712);
    const cardBackground = Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Total balance',
              style: TextStyle(
                color: subtleText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              '£18,865.94',
              style: TextStyle(
                color: primaryText,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: _QuickActionButton(
                  label: 'Add',
                  iconPath: 'assets/images/plus.svg',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _QuickActionButton(
                  label: 'Transfer',
                  iconPath: 'assets/images/arrows-exchange.svg',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _QuickActionButton(
                  label: 'Wallet',
                  iconPath: 'assets/images/wallet.svg',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CashbackMerchantScreen(),
                ),
              );
            },
            child: const _InsightRow(
              title: 'Cashback',
              subtitle: 'To be paid on 1st October',
              amountText: '+ £13.21',
              amountColor: primaryText,
              leadingColor: Color(0xFFE2FAF1),
              iconPath: 'assets/images/money-pounds.svg',
            ),
          ),
          const SizedBox(height: 12),
          const _InsightRow(
            title: 'Schedule transfers',
            subtitle: 'Due in 7 days',
            amountText: '- £158.21',
            amountColor: Color(0xFFCA2B2B),
            leadingColor: Color(0xFFFDE9E6),
            iconPath: 'assets/images/calendar.svg',
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final String label;
  final String iconPath;

  const _QuickActionButton({
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);
    const pillBackground = Color(0xFFF2F3ED);

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: pillBackground,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(primaryText, BlendMode.srcIn),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: primaryText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InsightRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amountText;
  final Color amountColor;
  final Color leadingColor;
  final String iconPath;

  const _InsightRow({
    required this.title,
    required this.subtitle,
    required this.amountText,
    required this.amountColor,
    required this.leadingColor,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);
    const subtleText = Color(0xFF8F928C);

    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: leadingColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(primaryText, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: primaryText,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: subtleText,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            Text(
              amountText,
              style: TextStyle(
                color: amountColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, size: 16, color: subtleText),
          ],
        ),
      ],
    );
  }
}

class _BuyLocalSection extends StatelessWidget {
  const _BuyLocalSection();

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);
    const subtleText = Color(0xFF8F928C);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Buy local',
                style: TextStyle(
                  color: primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashbackMerchantScreen(),
                  ),
                );
              },
              child: const Text(
                'View all',
                style: TextStyle(
                  color: subtleText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _CircleIconBadge(iconPath: 'assets/images/cookie.svg'),
            _CircleIconBadge(iconPath: 'assets/images/car.svg'),
            _CircleIconBadge(iconPath: 'assets/images/airplane.svg'),
            _CircleIconBadge(iconPath: 'assets/images/gift.svg'),
            _CircleIconBadge(iconPath: 'assets/images/store.svg'),
            _CircleIconBadge(iconPath: 'assets/images/heart.svg'),
          ],
        ),
      ],
    );
  }
}

class _CircleIconBadge extends StatelessWidget {
  final String iconPath;

  const _CircleIconBadge({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    const badgeBg = Color(0xFFF6F8C7);
    const primaryText = Color(0xFF151712);

    return Container(
      width: 46,
      height: 46,
      decoration: const BoxDecoration(
        color: badgeBg,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 22,
          height: 22,
          colorFilter: const ColorFilter.mode(primaryText, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class _ActivitySection extends StatelessWidget {
  const _ActivitySection();

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);
    const subtleText = Color(0xFF8F928C);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Activity',
                style: TextStyle(
                  color: primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/images/download.svg',
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(subtleText, BlendMode.srcIn),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: const [
            _SegmentedControlChip(label: 'List', selected: true),
            SizedBox(width: 8),
            _SegmentedControlChip(label: 'Group', selected: false),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Today, Friday 29 Aug',
              style: TextStyle(
                color: subtleText,
                fontSize: 13,
              ),
            ),
            Text(
              '+£125.83',
              style: TextStyle(
                color: primaryText,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const _TransactionRow(
          title: 'Refund',
          subtitle: 'Sample payment',
          amount: '+£5.00',
          iconPath: 'assets/images/arrow-rotate-ccw.svg',
        ),
      ],
    );
  }
}

class _SegmentedControlChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _SegmentedControlChip({
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    const selectedBg = Color(0xFF6C7200);
    const unselectedBg = Color(0xFFF2F3ED);
    const selectedText = Colors.white;
    const unselectedText = Color(0xFF151712);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? selectedBg : unselectedBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? selectedText : unselectedText,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _TransactionRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String iconPath;

  const _TransactionRow({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);
    const subtleText = Color(0xFF8F928C);
    const iconBg = Color(0xFFF2F3ED);

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(primaryText, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: primaryText,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: subtleText,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          amount,
          style: const TextStyle(
            color: primaryText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
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
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _BottomNavItem(
            iconPath: 'assets/images/home.svg',
            label: 'Home',
            selected: false,
          ),
          _BottomNavItem(
            iconPath: 'assets/images/clock.svg',
            label: 'Sales',
            selected: false,
          ),
          _BottomNavItem(
            iconPath: 'assets/images/bank.svg',
            label: 'Account',
            selected: true,
            showNewBadge: true,
          ),
          _BottomNavItem(
            label: 'Explore',
            selected: false,
            showDot: true,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String? iconPath;
  final String label;
  final bool selected;
  final bool showNewBadge;
  final bool showDot;

  const _BottomNavItem({
    this.iconPath,
    required this.label,
    required this.selected,
    this.showNewBadge = false,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);
    const subtleText = Color(0xFF8F928C);
    const highlight = Color(0xFFE1E456);

    final color = selected ? primaryText : subtleText;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            iconPath != null
                ? SvgPicture.asset(
                    iconPath!,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  )
                : const Icon(Icons.menu, color: primaryText, size: 24),
            if (showNewBadge)
              Positioned(
                top: -10,
                right: -18,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: highlight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: primaryText,
                    ),
                  ),
                ),
              ),
            if (showDot)
              const Positioned(
                top: -2,
                right: -2,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: highlight,
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
//                    CASHBACK MERCHANT SCREEN
// ═══════════════════════════════════════════════════════════════════════

class CashbackMerchantScreen extends StatefulWidget {
  const CashbackMerchantScreen({super.key});

  @override
  State<CashbackMerchantScreen> createState() => _CashbackMerchantScreenState();
}

class _CashbackMerchantScreenState extends State<CashbackMerchantScreen> {
  bool _isMapView = false;

  @override
  Widget build(BuildContext context) {
    const pageBackground = Color(0xFFF7F8F2);

    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Status bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF151712),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_4_bar, size: 16, color: Color(0xFF151712)),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16, color: Color(0xFF151712)),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 20, color: Color(0xFF151712)),
                    ],
                  ),
                ],
              ),
            ),
            // Header with back button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF151712),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cashback amount card
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Buy local cashback',
                            style: TextStyle(
                              color: Color(0xFF8F928C),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '£13.21',
                            style: TextStyle(
                              color: Color(0xFF151712),
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Streak section
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF8F0),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      '🔥',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '3 days streak!',
                                            style: TextStyle(
                                              color: Color(0xFF151712),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'You have unlocked a cashback boost',
                                            style: TextStyle(
                                              color: Color(0xFF8F928C),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // Progress dots
                                Row(
                                  children: List.generate(5, (index) {
                                    final isCompleted = index < 3;
                                    return Expanded(
                                      child: Row(
                                        children: [
                                          if (index > 0)
                                            Expanded(
                                              child: Container(
                                                height: 3,
                                                color: isCompleted ? const Color(0xFFF97316) : const Color(0xFFD1D5DB),
                                              ),
                                            ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: isCompleted ? const Color(0xFFF97316) : const Color(0xFFD1D5DB),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '🔥',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          if (index < 4)
                                            Expanded(
                                              child: Container(
                                                height: 3,
                                                color: isCompleted ? const Color(0xFFF97316) : const Color(0xFFD1D5DB),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Categories section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: Color(0xFF151712),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'View all',
                            style: TextStyle(
                              color: Color(0xFF8F928C),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Category icons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _CategoryIcon(iconPath: 'assets/images/cookie.svg'),
                          _CategoryIcon(iconPath: 'assets/images/car.svg'),
                          _CategoryIcon(iconPath: 'assets/images/airplane.svg'),
                          _CategoryIcon(iconPath: 'assets/images/gift.svg'),
                          _CategoryIcon(iconPath: 'assets/images/store.svg'),
                          _CategoryIcon(iconPath: 'assets/images/heart.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Places near you section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Places near you',
                            style: TextStyle(
                              color: Color(0xFF151712),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isMapView = false;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: !_isMapView ? const Color(0xFF6C7200) : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: _isMapView ? Border.all(color: const Color(0xFFE5E7EB)) : null,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/list.svg',
                                    width: 16,
                                    height: 16,
                                    colorFilter: ColorFilter.mode(
                                      !_isMapView ? Colors.white : const Color(0xFF151712),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isMapView = true;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: _isMapView ? const Color(0xFF6C7200) : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: !_isMapView ? Border.all(color: const Color(0xFFE5E7EB)) : null,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/map-pin.svg',
                                    width: 16,
                                    height: 16,
                                    colorFilter: ColorFilter.mode(
                                      _isMapView ? Colors.white : const Color(0xFF151712),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Search bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/search.svg',
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(Color(0xFF9CA3AF), BlendMode.srcIn),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Search places',
                              style: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Map view (only shown when map view is selected)
                    if (_isMapView) ...[
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: double.infinity,
                          height: 220,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E7EB),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFD1D5DB),
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                // Subtle grid pattern
                                ...List.generate(28, (index) {
                                  return Positioned(
                                    left: (index % 4) * 90.0 + 10,
                                    top: (index ~/ 4) * 35.0 + 10,
                                    child: Container(
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD1D5DB).withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  );
                                }),
                                // Map pins with yellow-green backgrounds
                                Positioned(
                                  left: 60,
                                  top: 50,
                                  child: _MapPinMarker(),
                                ),
                                Positioned(
                                  left: 220,
                                  top: 70,
                                  child: _MapPinMarker(),
                                ),
                                Positioned(
                                  left: 150,
                                  top: 130,
                                  child: _MapPinMarker(),
                                ),
                                Positioned(
                                  left: 280,
                                  top: 100,
                                  child: _MapPinMarker(),
                                ),
                                Positioned(
                                  left: 100,
                                  top: 170,
                                  child: _MapPinMarker(),
                                ),
                                // Center location indicator (user location)
                                Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6C7200),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    // Merchant list
                    const _PlaceListItem(
                      category: 'Retail',
                      name: 'JSK News',
                      address: '23 Great Guildford Stret London SE1 9EZ',
                    ),
                    const _PlaceListItem(
                      category: 'Retail',
                      name: 'Tech Haven',
                      address: '45 Silicon Avenue San Francisco CA 94107',
                    ),
                    const _PlaceListItem(
                      category: 'Retail',
                      name: 'Book Nook',
                      address: '76 Elm Street Springfield IL 62701',
                    ),
                    const _PlaceListItem(
                      category: 'Retail',
                      name: 'Gourmet Eats',
                      address: '12 Market Square Chicago IL 60601',
                    ),
                    const _PlaceListItem(
                      category: 'Retail',
                      name: 'Fashion Fusion',
                      address: '88 Style Boulevard New York NY 10001',
                    ),
                    const _PlaceListItem(
                      category: 'Retail',
                      name: 'Home Comforts',
                      address: '34 Cozy Lane Denver CO 80202',
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  final String iconPath;

  const _CategoryIcon({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8C7),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(Color(0xFF151712), BlendMode.srcIn),
        ),
      ),
    );
  }
}

class _PlaceListItem extends StatelessWidget {
  final String category;
  final String name;
  final String address;

  const _PlaceListItem({
    required this.category,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F8C7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/store.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(Color(0xFF151712), BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    color: Color(0xFF8F928C),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF151712),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: const TextStyle(
                    color: Color(0xFF8F928C),
                    fontSize: 13,
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

class _MapPinMarker extends StatelessWidget {
  const _MapPinMarker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8C7),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/store.svg',
          width: 18,
          height: 18,
          colorFilter: const ColorFilter.mode(Color(0xFF151712), BlendMode.srcIn),
        ),
      ),
    );
  }
}

