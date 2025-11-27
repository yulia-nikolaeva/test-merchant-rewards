import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';

const qrPrototypeUrl = 'https://yulia-nikolaeva.github.io/test-merchant-rewards/';
const LatLng _startingPoint = LatLng(51.508030, -0.122710); // Victoria Embankment
const Color _pinColor = Color(0xFF2F343C);
const Color _pinSelectedColor = Color(0xFF8DBF1F); // bright green similar to reference point

void main() {
  runApp(const MyApp());
}

// ═══════════════════════════════════════════════════════════════════════
//                    MERCHANT DATA MODEL
// ═══════════════════════════════════════════════════════════════════════

class MerchantData {
  final int id;
  final String mcc;
  final String merchantName;
  final String zipCode;
  final String streetAddress;
  final String city;
  final String countryCode;
  final LatLng location;

  MerchantData({
    required this.id,
    required this.mcc,
    required this.merchantName,
    required this.zipCode,
    required this.streetAddress,
    required this.city,
    required this.countryCode,
    required this.location,
  });
}

// Hardcoded merchant data from merchant-map repository
final List<MerchantData> merchantsData = [
  MerchantData(
    id: 1,
    mcc: "7230",
    merchantName: "S333yda Beauty / Barber",
    zipCode: "EC1M 5RD",
    streetAddress: "23 Clerkenwell Road",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.522784, -0.100984),
  ),
  MerchantData(
    id: 2,
    mcc: "7230",
    merchantName: "GRAYS INN BARBERS",
    zipCode: "WC1X 8PP",
    streetAddress: "47 Grays Inn Road",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.521963, -0.113834),
  ),
  MerchantData(
    id: 3,
    mcc: "5712",
    merchantName: "Zargos Furniture",
    zipCode: "EC1V 2NX",
    streetAddress: "2 New Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.515963, -0.107465),
  ),
  MerchantData(
    id: 4,
    mcc: "5699",
    merchantName: "KST Fashion",
    zipCode: "N15 4QL",
    streetAddress: "34 East Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.583950, -0.062440),
  ),
  MerchantData(
    id: 5,
    mcc: "5814",
    merchantName: "Indochine",
    zipCode: "EC4Y 1JU",
    streetAddress: "62 Fleet Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.514216, -0.107957),
  ),
  MerchantData(
    id: 6,
    mcc: "7230",
    merchantName: "Luxury Wax Bar-Fleet Street",
    zipCode: "W2 2HU",
    streetAddress: "33 Fleet Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.517310, -0.166670),
  ),
  MerchantData(
    id: 7,
    mcc: "5812",
    merchantName: "The Glean Restaurant",
    zipCode: "EC4V 6ER",
    streetAddress: "15 Black Friars Lane",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.512906, -0.103391),
  ),
  MerchantData(
    id: 8,
    mcc: "5814",
    merchantName: "Jim's Fish Bar",
    zipCode: "N7 8GR",
    streetAddress: "5 Frances Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.544261, -0.113599),
  ),
  MerchantData(
    id: 9,
    mcc: "5812",
    merchantName: "High Timber Restaurant",
    zipCode: "EC1R 0BP",
    streetAddress: "Broken Wharf House",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.510753, -0.096764),
  ),
  MerchantData(
    id: 10,
    mcc: "5999",
    merchantName: "Soho Vape City",
    zipCode: "EC4N 4SF",
    streetAddress: "41 Queen Victoria Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.512464, -0.092800),
  ),
  MerchantData(
    id: 11,
    mcc: "5814",
    merchantName: "Taste of Nepal",
    zipCode: "SE1 8NN",
    streetAddress: "200 Blackfriars Road",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.504094, -0.104508),
  ),
  MerchantData(
    id: 12,
    mcc: "5812",
    merchantName: "Cafe56",
    zipCode: "SE1 9LX",
    streetAddress: "56 Stamford Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.507038, -0.107584),
  ),
  MerchantData(
    id: 13,
    mcc: "5814",
    merchantName: "Panda Cup",
    zipCode: "SE14 5XE",
    streetAddress: "27 Blackfriars Road",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.506262, -0.105055),
  ),
  MerchantData(
    id: 14,
    mcc: "5812",
    merchantName: "ALL THAT FALAFEL & MORE",
    zipCode: "SE1 4PH",
    streetAddress: "132 Southwark Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.506413, -0.101831),
  ),
  MerchantData(
    id: 15,
    mcc: "5814",
    merchantName: "Baba Ali Lebanese Food",
    zipCode: "SE1 8NJ",
    streetAddress: "200 Blackfriars Road",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.504094, -0.104508),
  ),
  MerchantData(
    id: 16,
    mcc: "5999",
    merchantName: "JSK News",
    zipCode: "SE1 9EZ",
    streetAddress: "23 Great Guildford Street",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.504691, -0.096964),
  ),
  MerchantData(
    id: 17,
    mcc: "5992",
    merchantName: "Bobbys Flowers",
    zipCode: "EC2V 6AU",
    streetAddress: "1 St Mary Le Bow Church",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.513784, -0.093602),
  ),
  MerchantData(
    id: 18,
    mcc: "7997",
    merchantName: "Mars Karate Academy Limited",
    zipCode: "WC2A 2JR",
    streetAddress: "7 Bell Yard",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.514258, -0.111796),
  ),
];

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
    // Teya brand tertiary colors - subtle, toned-down palette
    const offWhite = Color(0xFFF5F5F5);      // #F5F5F5
    const lightestLime = Color(0xFFF1F3B6);  // #F1F3B6
    const lighterLime = Color(0xFFEBEC91);   // #EBEC91

    final qrCard = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: QrImageView(
              data: qrPrototypeUrl,
              version: QrVersions.auto,
              size: 120,
              gapless: true,
              eyeStyle: QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: const Color(0xFF151712),
              ),
              dataModuleStyle: QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: const Color(0xFF151712),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Open the prototype',
                  style: TextStyle(
                    color: Color(0xFF151712),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Scan to view the web demo on your device.',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              offWhite,
              lightestLime,
              lighterLime,
              lightestLime,
              offWhite,
            ],
            stops: [0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 900;
              final phoneWidth = math.min(constraints.maxWidth * (isNarrow ? 0.9 : 0.45), 420.0);
              final phoneHeight = (phoneWidth * 2.1).clamp(680.0, 844.0).toDouble();

              final phoneWidget = Center(
                child: Container(
                  width: phoneWidth,
                  height: phoneHeight,
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
                    child: Container(
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
                  ),
                ),
              );

              final textColumn = Padding(
                padding: EdgeInsets.fromLTRB(
                  isNarrow ? 24.0 : 40.0,
                  isNarrow ? 28.0 : 60.0,
                  isNarrow ? 24.0 : 60.0,
                  isNarrow ? 36.0 : 60.0,
                ),
                child: Column(
                  mainAxisAlignment: isNarrow ? MainAxisAlignment.start : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buy local.\nGrow together.',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontSize: isNarrow ? 42 : 72,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                        letterSpacing: isNarrow ? -1.2 : -2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'When Teya merchants buy from other\nTeya merchants, everyone wins with\nincreased cashback.',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontSize: isNarrow ? 16 : 20,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF666666),
                        height: 1.5,
                        letterSpacing: isNarrow ? -0.2 : -0.3,
                      ),
                    ),
                    const SizedBox(height: 24),
                    qrCard,
                  ],
                ),
              );

              if (isNarrow) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 24),
                      phoneWidget,
                      const SizedBox(height: 28),
                      textColumn,
                    ],
                  ),
                );
              }

              return Row(
                children: [
                  Expanded(flex: 1, child: phoneWidget),
                  Expanded(flex: 1, child: textColumn),
                ],
              );
            },
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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '9:41',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF151712),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.signal_cellular_4_bar, size: 16, color: Color(0xFF151712)),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/images/wifi.svg',
                            width: 16,
                            height: 16,
                            colorFilter: const ColorFilter.mode(Color(0xFF151712), BlendMode.srcIn),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.battery_full, size: 20, color: Color(0xFF151712)),
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
                  iconPath: 'assets/images/money-arrow-up.svg',
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
            onTap: () => _presentCashbackSheet(context),
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
            const Text(
              'Buy local',
              style: TextStyle(
                color: primaryText,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE1E456),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.monetization_on,
                    size: 14,
                    color: primaryText,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Earn cashback',
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
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
          children: [
            _CircleIconBadge(
              iconPath: 'assets/images/shopping-cart.svg',
              category: 'Retail',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashbackMerchantScreen(initialCategory: 'Retail'),
                  ),
                );
              },
            ),
            _CircleIconBadge(
              iconPath: 'assets/images/coffee-cup.svg',
              category: 'Cafe',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashbackMerchantScreen(initialCategory: 'Cafe'),
                  ),
                );
              },
            ),
            _CircleIconBadge(
              iconPath: 'assets/images/gift.svg',
              category: 'Gifts',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashbackMerchantScreen(initialCategory: 'Gifts'),
                  ),
                );
              },
            ),
            _CircleIconBadge(
              iconPath: 'assets/images/plant.svg',
              category: 'Services',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashbackMerchantScreen(initialCategory: 'Services'),
                  ),
                );
              },
            ),
            _CircleIconBadge(
              iconPath: 'assets/images/utensils.svg',
              category: 'Restaurant',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashbackMerchantScreen(initialCategory: 'Restaurant'),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _CircleIconBadge extends StatelessWidget {
  final String iconPath;
  final String? category;
  final VoidCallback? onTap;

  const _CircleIconBadge({
    required this.iconPath,
    this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const badgeBg = Color(0xFFF6F8C7);
    const primaryText = Color(0xFF151712);

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
  final String? initialCategory;

  const CashbackMerchantScreen({super.key, this.initialCategory});

  @override
  State<CashbackMerchantScreen> createState() => _CashbackMerchantScreenState();
}

class _CashbackMerchantScreenState extends State<CashbackMerchantScreen> {
  bool _isMapView = true;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  String? _selectedCategory;
  int? _selectedMerchantId;
  final Map<int, GlobalKey> _itemKeys = {};

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _openFullScreenMap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FullscreenMapPage(
          merchants: filteredMerchants,
          startingPoint: _startingPoint,
          initialSelectedMerchantId: _selectedMerchantId,
        ),
      ),
    );
  }

  void _scrollToItem(int merchantId) {
    final key = _itemKeys[merchantId];
    if (key != null && key.currentContext != null && _scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final renderObject = key.currentContext!.findRenderObject();
        final viewport = RenderAbstractViewport.of(renderObject);
        if (renderObject != null && viewport != null) {
          final targetOffset = viewport.getOffsetToReveal(renderObject, 0.2).offset;
          _scrollController.animateTo(
            targetOffset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  List<MerchantData> get filteredMerchants {
    var filtered = merchantsData;

    // Filter by category
    if (_selectedCategory != null && _selectedCategory!.isNotEmpty) {
      filtered = filtered.where((merchant) {
        final category = _getMccCategory(merchant.mcc);
        return category == _selectedCategory;
      }).toList();
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((merchant) {
        return merchant.merchantName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               merchant.city.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               merchant.streetAddress.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    const pageBackground = Color(0xFFF7F8F2);
    const totalStreakDays = 5;
    const completedStreakDays = 3;

    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Status bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF151712),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.signal_cellular_4_bar, size: 16, color: Color(0xFF151712)),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/images/wifi.svg',
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(Color(0xFF151712), BlendMode.srcIn),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.battery_full, size: 20, color: Color(0xFF151712)),
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
            // Main content - all scrollable together
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
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
                          GestureDetector(
                            onTap: () => _presentCashbackSheet(context),
                            behavior: HitTestBehavior.opaque,
                            child: Column(
                              children: [
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
                                    color: const Color(0xFFF6F6F6),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/fire.png',
                                            width: 24,
                                            height: 24,
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
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          for (var index = 0; index < totalStreakDays; index++) ...[
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: index < completedStreakDays ? const Color(0xFFF97316) : const Color(0xFFD1D5DB),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/images/fire_icon.svg',
                                                  width: 16,
                                                  height: 16,
                                                  colorFilter: ColorFilter.mode(
                                                    index < completedStreakDays ? Colors.white : const Color(0xFF6B7280),
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (index < totalStreakDays - 1)
                                              Expanded(
                                                child: Container(
                                                  height: 3,
                                                  color: (index + 1) < completedStreakDays ? const Color(0xFFF97316) : const Color(0xFFD1D5DB),
                                                ),
                                              ),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Category filter section with title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Categories',
                            style: TextStyle(
                              color: Color(0xFF151712),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategory = null;
                              });
                            },
                            child: const Text(
                              'View all',
                              style: TextStyle(
                                color: Color(0xFF8F928C),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _CategoryIconFilter(
                            iconPath: 'assets/images/shopping-cart.svg',
                            category: 'Retail',
                            selected: _selectedCategory == 'Retail',
                            onTap: () {
                              setState(() {
                                _selectedCategory = _selectedCategory == 'Retail' ? null : 'Retail';
                              });
                            },
                          ),
                          _CategoryIconFilter(
                            iconPath: 'assets/images/coffee-cup.svg',
                            category: 'Cafe',
                            selected: _selectedCategory == 'Cafe',
                            onTap: () {
                              setState(() {
                                _selectedCategory = _selectedCategory == 'Cafe' ? null : 'Cafe';
                              });
                            },
                          ),
                          _CategoryIconFilter(
                            iconPath: 'assets/images/gift.svg',
                            category: 'Gifts',
                            selected: _selectedCategory == 'Gifts',
                            onTap: () {
                              setState(() {
                                _selectedCategory = _selectedCategory == 'Gifts' ? null : 'Gifts';
                              });
                            },
                          ),
                          _CategoryIconFilter(
                            iconPath: 'assets/images/plant.svg',
                            category: 'Services',
                            selected: _selectedCategory == 'Services',
                            onTap: () {
                              setState(() {
                                _selectedCategory = _selectedCategory == 'Services' ? null : 'Services';
                              });
                            },
                          ),
                          _CategoryIconFilter(
                            iconPath: 'assets/images/utensils.svg',
                            category: 'Restaurant',
                            selected: _selectedCategory == 'Restaurant',
                            onTap: () {
                              setState(() {
                                _selectedCategory = _selectedCategory == 'Restaurant' ? null : 'Restaurant';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Map view (only shown when map view is selected)
                    if (_isMapView) ...[
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: double.infinity,
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: _openFullScreenMap,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FlutterMap(
                                options: MapOptions(
                                  initialCenter: _startingPoint,
                                  initialZoom: 13,
                                  minZoom: 10.0,
                                  maxZoom: 18.0,
                                  onTap: (tapPosition, point) => _openFullScreenMap(),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName: 'com.teya.merchant_rewards',
                                    subdomains: const ['a', 'b', 'c'],
                                    additionalOptions: const {
                                      'attribution': '© OpenStreetMap contributors',
                                    },
                                  ),
                                  MarkerLayer(
                                    markers: filteredMerchants.map((merchant) {
                                      final isSelected = _selectedMerchantId == merchant.id;
                                      return Marker(
                                        point: merchant.location,
                                        width: 38,
                                        height: 48,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (_selectedMerchantId == merchant.id) {
                                                _selectedMerchantId = null;
                                              } else {
                                                _selectedMerchantId = merchant.id;
                                              }
                                            });
                                          },
                                            child: Image.asset(
                                              isSelected ? 'assets/images/selected-pin.png' : 'assets/images/not-selected-pin.png',
                                              width: 38,
                                              height: 48,
                                            ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        point: _startingPoint,
                                        width: 26,
                                        height: 26,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF8DBF1F),
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 3),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.25),
                                                blurRadius: 8,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    // Places near you section with toggle buttons
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
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(999),
                                  border: Border.all(color: const Color(0xFFE5E7EB)),
                                ),
                                child: SizedBox(
                                  height: 34,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isMapView = false;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: !_isMapView ? const Color(0xFF6C7200) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(999),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/list.svg',
                                          width: 16,
                                          height: 16,
                                          colorFilter: ColorFilter.mode(
                                            !_isMapView ? Colors.white : const Color(0xFF6B7280),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isMapView = true;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: _isMapView ? const Color(0xFF6C7200) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(999),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/map-pin.svg',
                                          width: 16,
                                          height: 16,
                                          colorFilter: ColorFilter.mode(
                                            _isMapView ? Colors.white : const Color(0xFF6B7280),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onChanged: (value) {
                                  setState(() {
                                    _searchQuery = value;
                                  });
                                },
                                style: const TextStyle(
                                  color: Color(0xFF151712),
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Search places',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9CA3AF),
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                            if (_searchQuery.isNotEmpty)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _searchController.clear();
                                    _searchQuery = '';
                                  });
                                },
                                child: const Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: Color(0xFF9CA3AF),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Merchant list - using filtered data
                    if (filteredMerchants.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Center(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.search_off,
                                size: 48,
                                color: Color(0xFF9CA3AF),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No merchants found',
                                style: TextStyle(
                                  color: Color(0xFF8F928C),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Try adjusting your search',
                                style: TextStyle(
                                  color: Color(0xFF9CA3AF),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      ...filteredMerchants.map((merchant) {
                        // Create or reuse GlobalKey for each merchant
                        _itemKeys.putIfAbsent(merchant.id, () => GlobalKey());

                        return _PlaceListItem(
                          key: _itemKeys[merchant.id],
                          merchant: merchant,
                          category: _getMccCategory(merchant.mcc),
                          name: merchant.merchantName,
                          address: '${merchant.streetAddress} ${merchant.city} ${merchant.zipCode}',
                          isSelected: _selectedMerchantId == merchant.id,
                          onTap: () {
                            setState(() {
                              // Toggle selection: deselect if already selected
                              if (_selectedMerchantId == merchant.id) {
                                _selectedMerchantId = null;
                              } else {
                                _selectedMerchantId = merchant.id;
                              }
                            });
                          },
                        );
                      }).toList(),
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

// Helper function to get category from MCC code
String _getMccCategory(String mcc) {
  // Assign categories based on merchant ID for variety across the 5 categories
  final merchantId = int.tryParse(mcc) ?? 0;
  final categories = ['Retail', 'Cafe', 'Gifts', 'Services', 'Restaurant'];

  // Use a simple hash-like distribution based on MCC
  switch (mcc) {
    case '5812': // Restaurants
    case '5814': // Fast Food
      return merchantId % 2 == 0 ? 'Restaurant' : 'Cafe';
    case '5813': // Bars
      return 'Cafe';
    case '7230': // Beauty
      return 'Services';
    case '7523': // Parking
    case '7538': // Auto service
      return 'Services';
    case '7832': // Entertainment
      return 'Services';
    default:
      // Distribute remaining between Retail and Gifts
      return merchantId % 3 == 0 ? 'Gifts' : 'Retail';
  }
}

String _categoryIconPath(String category) {
  switch (category) {
    case 'Retail':
      return 'assets/images/shopping-cart.svg';
    case 'Cafe':
      return 'assets/images/coffee-cup.svg';
    case 'Gifts':
      return 'assets/images/gift.svg';
    case 'Services':
      return 'assets/images/plant.svg';
    case 'Restaurant':
      return 'assets/images/utensils.svg';
    default:
      return 'assets/images/store.svg';
  }
}

double _categoryIconSize(String category) {
  switch (category) {
    case 'Gifts':
      return 26; // slightly larger to match stroke weight visually
    default:
      return 24;
  }
}

class FullscreenMapPage extends StatefulWidget {
  final List<MerchantData> merchants;
  final LatLng startingPoint;
  final int? initialSelectedMerchantId;

  const FullscreenMapPage({
    super.key,
    required this.merchants,
    required this.startingPoint,
    this.initialSelectedMerchantId,
  });

  @override
  State<FullscreenMapPage> createState() => _FullscreenMapPageState();
}

class _FullscreenMapPageState extends State<FullscreenMapPage> {
  late int? _selectedMerchantId;
  late final MapController _mapController;
  final Distance _distance = const Distance();
  late final PageController _cardController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _selectedMerchantId = widget.initialSelectedMerchantId;
    final initialIndex = _selectedMerchantId != null
        ? widget.merchants.indexWhere((m) => m.id == _selectedMerchantId)
        : 0;
    _cardController = PageController(
      viewportFraction: 0.85,
      initialPage: initialIndex < 0 ? 0 : initialIndex,
    );
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  void _selectMerchant(int merchantId, LatLng location, {bool animatePage = true, bool animateMap = true}) {
    setState(() {
      _selectedMerchantId = merchantId;
    });
    if (animateMap) {
      _mapController.move(location, 14.5);
    }
    if (animatePage) {
      final targetIndex = widget.merchants.indexWhere((m) => m.id == merchantId);
      if (targetIndex >= 0) {
        _cardController.animateToPage(
          targetIndex,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _toggleMerchant(MerchantData merchant) {
    if (_selectedMerchantId == merchant.id) {
      setState(() {
        _selectedMerchantId = null;
      });
    } else {
      _selectMerchant(merchant.id, merchant.location);
    }
  }

  String _formatDistance(LatLng target) {
    final meters = _distance.as(LengthUnit.Meter, widget.startingPoint, target);
    if (meters >= 1000) {
      return '${(meters / 1000).toStringAsFixed(1)}km';
    }
    return '${meters.round()}m';
  }

  @override
  Widget build(BuildContext context) {
    final merchants = widget.merchants;
    final selectedMerchant = _selectedMerchantId != null
        ? merchants.where((m) => m.id == _selectedMerchantId).toList()
        : <MerchantData>[];
    final initialCenter = selectedMerchant.isNotEmpty
        ? selectedMerchant.first.location
        : (merchants.isNotEmpty ? merchants.first.location : widget.startingPoint);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: initialCenter,
                initialZoom: 15,
                minZoom: 10,
                maxZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.teya.merchant_rewards',
                  additionalOptions: const {
                    'attribution': '© OpenStreetMap contributors',
                  },
                ),
                MarkerLayer(
                  markers: [
                    for (final merchant in merchants)
                      Marker(
                        point: merchant.location,
                        width: 38,
                        height: 48,
                        child: GestureDetector(
                          onTap: () => _toggleMerchant(merchant),
                          child: Image.asset(
                            _selectedMerchantId == merchant.id ? 'assets/images/selected-pin.png' : 'assets/images/not-selected-pin.png',
                            width: 38,
                            height: 48,
                          ),
                        ),
                      ),
                    Marker(
                      point: widget.startingPoint,
                      width: 28,
                      height: 28,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF8DBF1F),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 8,
              left: 12,
              right: 12,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      children: const [
                        Text(
                          '9:41',
                          style: TextStyle(
                            color: Color(0xFF151712),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.signal_cellular_4_bar, size: 18, color: Color(0xFF151712)),
                        SizedBox(width: 6),
                        Icon(Icons.wifi, size: 18, color: Color(0xFF151712)),
                        SizedBox(width: 6),
                        Icon(Icons.battery_full, size: 20, color: Color(0xFF151712)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back, color: Color(0xFF151712)),
                        ),
                        const Text(
                          'Places',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF151712),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (_selectedMerchantId != null && merchants.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: SizedBox(
                  height: 110,
                  child: PageView.builder(
                    controller: _cardController,
                    onPageChanged: (page) {
                      if (page >= 0 && page < merchants.length) {
                        final merchant = merchants[page];
                        _selectMerchant(merchant.id, merchant.location, animatePage: false);
                      }
                    },
                    itemCount: merchants.length,
                    itemBuilder: (context, index) {
                      final merchant = merchants[index];
                      final category = _getMccCategory(merchant.mcc);

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () => _selectMerchant(merchant.id, merchant.location),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF6F8C7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      _categoryIconPath(category),
                                      width: _categoryIconSize(category),
                                      height: _categoryIconSize(category),
                                      colorFilter: const ColorFilter.mode(Color(0xFF151712), BlendMode.srcIn),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            category,
                                            style: const TextStyle(
                                              color: Color(0xFF8F928C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            _formatDistance(merchant.location),
                                            style: const TextStyle(
                                              color: Color(0xFF8F928C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      merchant.merchantName,
                                      style: const TextStyle(
                                          color: Color(0xFF151712),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${merchant.streetAddress} ${merchant.city} ${merchant.zipCode}',
                                        style: const TextStyle(
                                          color: Color(0xFF8F928C),
                                          fontSize: 13,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


class _CategoryIconFilter extends StatelessWidget {
  final String iconPath;
  final String category;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryIconFilter({
    required this.iconPath,
    required this.category,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF6C7200) : const Color(0xFFF6F8C7),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(
              selected ? Colors.white : const Color(0xFF151712),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceListItem extends StatelessWidget {
  final MerchantData merchant;
  final String category;
  final String name;
  final String address;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlaceListItem({
    super.key,
    required this.merchant,
    required this.category,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = _categoryIconSize(category);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF6C7200) : const Color(0xFFF6F8C7),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  _categoryIconPath(category),
                  width: iconSize,
                  height: iconSize,
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.white : const Color(0xFF151712),
                    BlendMode.srcIn,
                  ),
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
      ),
    );
  }
}

class _CashbackPayment {
  final String label;
  final String time;
  final String merchant;
  final String amount;

  const _CashbackPayment({
    required this.label,
    required this.time,
    required this.merchant,
    required this.amount,
  });
}

class _CashbackPaymentRow extends StatelessWidget {
  final _CashbackPayment payment;

  const _CashbackPaymentRow({required this.payment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3F4),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/money-pounds.svg',
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(Color(0xFF6B7280), BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.label,
                  style: const TextStyle(
                    color: Color(0xFF151712),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${payment.time} • ${payment.merchant}',
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            payment.amount,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

void _presentCashbackSheet(BuildContext context) {
  const payments = [
    _CashbackPayment(
      label: 'Cashback 🔥',
      time: '20:11',
      merchant: 'Grays Inn Barbers',
      amount: '+£0.20',
    ),
    _CashbackPayment(
      label: 'Cashback 🔥🔥',
      time: '10:05',
      merchant: 'Zargos Furniture',
      amount: '+£1.30',
    ),
    _CashbackPayment(
      label: 'Cashback 🔥🔥🔥',
      time: '14:30',
      merchant: 'KST Fashion',
      amount: '+£0.50',
    ),
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cashback',
                    style: TextStyle(
                      color: Color(0xFF151712),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/images/circle-x.svg',
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(Color(0xFF151712), BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '£13.21',
                    style: TextStyle(
                      color: Color(0xFF151712),
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC8EB6B),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/money-pounds.svg',
                          width: 14,
                          height: 14,
                          colorFilter: const ColorFilter.mode(Color(0xFF6C7200), BlendMode.srcIn),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          '1% Cashback boost',
                          style: TextStyle(
                            color: Color(0xFF6C7200),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'next payment on 1st March',
                style: TextStyle(
                  color: Color(0xFF8F928C),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFE5E7EB), height: 1),
              const SizedBox(height: 14),
              const Text(
                'Last cashback payments',
                style: TextStyle(
                  color: Color(0xFF151712),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              ...payments.map((p) => _CashbackPaymentRow(payment: p)),
            ],
          ),
        ),
      );
    },
  );
}
