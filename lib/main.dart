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

class CashbackMerchantScreen extends StatelessWidget {
  const CashbackMerchantScreen({super.key});

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
              top: 200,
              child: Container(color: pageBackground),
            ),
            Column(
              children: [
                // Status bar
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
                // Main content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button and title
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'Cashback & Merchants',
                                style: TextStyle(
                                  color: Color(0xFF151712),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                'assets/images/search.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF151712),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Cashback to receive card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE2FAF1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/images/money-pounds.svg',
                                        width: 20,
                                        height: 20,
                                        colorFilter: const ColorFilter.mode(
                                          Color(0xFF151712),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Expanded(
                                    child: Text(
                                      'Cashback to receive',
                                      style: TextStyle(
                                        color: Color(0xFF8F928C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                '£13.21',
                                style: TextStyle(
                                  color: Color(0xFF151712),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Payment on 1st October',
                                style: TextStyle(
                                  color: Color(0xFF8F928C),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6C7200),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'View history',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Nearby merchants section
                        const Text(
                          'Nearby merchants',
                          style: TextStyle(
                            color: Color(0xFF151712),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Map placeholder
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E7EB),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFD1D5DB),
                              width: 1,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Grid pattern to simulate map
                              ...List.generate(20, (index) {
                                return Positioned(
                                  left: (index % 4) * 90.0 + 20,
                                  top: (index ~/ 4) * 50.0 + 20,
                                  child: Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                );
                              }),
                              // Map pins
                              Positioned(
                                left: 50,
                                top: 60,
                                child: _MapPin(color: const Color(0xFF10B981)),
                              ),
                              Positioned(
                                left: 200,
                                top: 40,
                                child: _MapPin(color: const Color(0xFF3B82F6)),
                              ),
                              Positioned(
                                left: 280,
                                top: 120,
                                child: _MapPin(color: const Color(0xFFF59E0B)),
                              ),
                              Positioned(
                                left: 120,
                                top: 140,
                                child: _MapPin(color: const Color(0xFF8B5CF6)),
                              ),
                              // Center location indicator
                              Center(
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF7C3AED),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Merchant list
                        _MerchantListItem(
                          name: 'Coffee Corner',
                          distance: '0.2 km',
                          cashback: '5% cashback',
                          category: 'Cafe',
                          iconPath: 'assets/images/cookie.svg',
                          color: const Color(0xFF10B981),
                        ),
                        const SizedBox(height: 12),
                        _MerchantListItem(
                          name: 'Tech Store',
                          distance: '0.5 km',
                          cashback: '3% cashback',
                          category: 'Electronics',
                          iconPath: 'assets/images/store.svg',
                          color: const Color(0xFF3B82F6),
                        ),
                        const SizedBox(height: 12),
                        _MerchantListItem(
                          name: 'Local Grocery',
                          distance: '0.8 km',
                          cashback: '2% cashback',
                          category: 'Food',
                          iconPath: 'assets/images/gift.svg',
                          color: const Color(0xFFF59E0B),
                        ),
                        const SizedBox(height: 12),
                        _MerchantListItem(
                          name: 'Fashion Boutique',
                          distance: '1.1 km',
                          cashback: '8% cashback',
                          category: 'Clothing',
                          iconPath: 'assets/images/heart.svg',
                          color: const Color(0xFF8B5CF6),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
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

class _MapPin extends StatelessWidget {
  final Color color;

  const _MapPin({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.store,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}

class _MerchantListItem extends StatelessWidget {
  final String name;
  final String distance;
  final String cashback;
  final String category;
  final String iconPath;
  final Color color;

  const _MerchantListItem({
    required this.name,
    required this.distance,
    required this.cashback,
    required this.category,
    required this.iconPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xFF151712);
    const subtleText = Color(0xFF8F928C);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: primaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: subtleText,
                        fontSize: 13,
                      ),
                    ),
                    const Text(
                      ' • ',
                      style: TextStyle(
                        color: subtleText,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      distance,
                      style: const TextStyle(
                        color: subtleText,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE2FAF1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              cashback,
              style: const TextStyle(
                color: Color(0xFF10B981),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

