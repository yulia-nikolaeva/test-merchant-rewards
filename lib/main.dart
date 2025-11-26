import 'package:flutter/material.dart';
import 'dart:async';
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
      home: Scaffold(
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
                  // Phone screen content
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: const BusinessAccountHome(),
                    ),
                  ),
                  // Notch
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

// ───────────────── Top Bar ─────────────────

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
          child: const Icon(Icons.play_arrow, size: 18, color: Colors.white),
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

// ───────────────── Balance Card ─────────────────

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
          const _InsightRow(
            title: 'Cashback',
            subtitle: 'To be paid on 1st October',
            amountText: '+ £13.21',
            amountColor: primaryText,
            leadingColor: Color(0xFFE2FAF1),
            iconPath: 'assets/images/money-pounds.svg',
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
        Text(
          amountText,
          style: TextStyle(
            color: amountColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ───────────────── Buy Local Section ─────────────────

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
          children: const [
            Expanded(
              child: Text(
                'Buy local',
                style: TextStyle(
                  color: primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'View all',
              style: TextStyle(
                color: subtleText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
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

// ───────────────── Activity Section ─────────────────

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

// ───────────────── Bottom Navigation ─────────────────

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

