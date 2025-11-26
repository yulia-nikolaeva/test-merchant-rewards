import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
    mcc: "7832",
    merchantName: "Centro de Lazer do Campo Pequeno",
    zipCode: "1000-082",
    streetAddress: "Campo Pequeno",
    city: "Lisboa",
    countryCode: "PT",
    location: LatLng(38.7436, -9.1453),
  ),
  MerchantData(
    id: 2,
    mcc: "5813",
    merchantName: "P-Va Pincszet",
    zipCode: "2364",
    streetAddress: "77P4+H3",
    city: "Ocsa",
    countryCode: "HU",
    location: LatLng(47.2990, 19.2269),
  ),
  MerchantData(
    id: 3,
    mcc: "5812",
    merchantName: "Palace Cafe Pavilon",
    zipCode: "1013",
    streetAddress: "Budai vr hrsz:6452/4",
    city: "Budapest",
    countryCode: "HU",
    location: LatLng(47.4979, 19.0380),
  ),
  MerchantData(
    id: 4,
    mcc: "7538",
    merchantName: "Pam's mot centre",
    zipCode: "MK12 6JU",
    streetAddress: "Pams M O T Centrer",
    city: "Milton Keynes",
    countryCode: "GB",
    location: LatLng(52.0521, -0.7673),
  ),
  MerchantData(
    id: 5,
    mcc: "5814",
    merchantName: "Pammies Snack Bar",
    zipCode: "PE38 9PY",
    streetAddress: "A134 Lorry Stop",
    city: "Downham Market",
    countryCode: "GB",
    location: LatLng(52.6077, 0.3898),
  ),
  MerchantData(
    id: 6,
    mcc: "7230",
    merchantName: "Par Barber Machine 2",
    zipCode: "B3 1LL",
    streetAddress: "Par Hair Club Brindley House",
    city: "Birmingham",
    countryCode: "GB",
    location: LatLng(52.4796, -1.8995),
  ),
  MerchantData(
    id: 7,
    mcc: "7230",
    merchantName: "Par Hair Club",
    zipCode: "B3 1LL",
    streetAddress: "Par Hair Club Brindley House",
    city: "Birmingham",
    countryCode: "GB",
    location: LatLng(52.4796, -1.8995),
  ),
  MerchantData(
    id: 8,
    mcc: "5813",
    merchantName: "Park Bar Deck",
    zipCode: "2750-353",
    streetAddress: "Calada do Combro, 58-74",
    city: "Cascais",
    countryCode: "PT",
    location: LatLng(38.6979, -9.4189),
  ),
  MerchantData(
    id: 9,
    mcc: "7523",
    merchantName: "ParkolMester",
    zipCode: "4032",
    streetAddress: "Klterlet/Kltelek 148/46 hrsz",
    city: "Debrecen",
    countryCode: "HU",
    location: LatLng(47.5316, 21.6394),
  ),
  MerchantData(
    id: 10,
    mcc: "5812",
    merchantName: "Parti Bf",
    zipCode: "8272",
    streetAddress: "klterlet 030/13 hrsz.",
    city: "Obudavar",
    countryCode: "HU",
    location: LatLng(46.8547, 18.0522),
  ),
  // New merchants from subset_store_addresses.txt
  MerchantData(
    id: 11,
    mcc: "5812",
    merchantName: "Market Ács büfé",
    zipCode: "1065",
    streetAddress: "0421/71.hrsz",
    city: "Budapest",
    countryCode: "HU",
    location: LatLng(47.5049, 19.0619),
  ),
  MerchantData(
    id: 12,
    mcc: "5812",
    merchantName: "MANAL JEWELERY HOUSE",
    zipCode: "B25 8UJ",
    streetAddress: "The Swan Shopping Centre",
    city: "Birmingham",
    countryCode: "GB",
    location: LatLng(52.4488, -1.8296),
  ),
  MerchantData(
    id: 13,
    mcc: "5814",
    merchantName: "Mo's Baguettes",
    zipCode: "CF14 3BH",
    streetAddress: "Mo's Baguettes Ltd",
    city: "Cardiff",
    countryCode: "GB",
    location: LatLng(51.5016, -3.2009),
  ),
  MerchantData(
    id: 14,
    mcc: "5814",
    merchantName: "MO's Kebab",
    zipCode: "N22 8HF",
    streetAddress: "Castle Royal Golf Club",
    city: "London",
    countryCode: "GB",
    location: LatLng(51.6024, -0.1090),
  ),
  MerchantData(
    id: 15,
    mcc: "5812",
    merchantName: "Múlakaffi",
    zipCode: "105",
    streetAddress: "Hallarmúla",
    city: "Reykjavík",
    countryCode: "IS",
    location: LatLng(64.1326, -21.8953),
  ),
  MerchantData(
    id: 16,
    mcc: "5812",
    merchantName: "Oliver Büfé",
    zipCode: "1086",
    streetAddress: "JÓZSEF KÖRÚT 69",
    city: "Budapest",
    countryCode: "HU",
    location: LatLng(47.4851, 19.0703),
  ),
  MerchantData(
    id: 17,
    mcc: "5812",
    merchantName: "Pastelaria Vieira",
    zipCode: "9200-157",
    streetAddress: "Estrada do Santo 497",
    city: "Santo Antonio da Serra",
    countryCode: "PT",
    location: LatLng(32.7186, -16.7916),
  ),
  MerchantData(
    id: 18,
    mcc: "5814",
    merchantName: "pho yum",
    zipCode: "b54td",
    streetAddress: "The Arcadian Centre",
    city: "Birmingham",
    countryCode: "GB",
    location: LatLng(52.4774, -1.8985),
  ),
  MerchantData(
    id: 19,
    mcc: "5812",
    merchantName: "Piroska Presszó",
    zipCode: "7400",
    streetAddress: "Füredi utca 5381/76 hrsz",
    city: "Kaposvar",
    countryCode: "HU",
    location: LatLng(46.3594, 17.7918),
  ),
  MerchantData(
    id: 20,
    mcc: "5814",
    merchantName: "Punto Corvin",
    zipCode: "2040",
    streetAddress: "Corvin sétány 2a",
    city: "Budaors",
    countryCode: "HU",
    location: LatLng(47.4591, 18.9559),
  ),
  MerchantData(
    id: 21,
    mcc: "5812",
    merchantName: "Royal Indian Cuisine",
    zipCode: "8400-450",
    streetAddress: "Urbanização Conjunto Turístico",
    city: "Porches",
    countryCode: "PT",
    location: LatLng(37.1317, -8.3876),
  ),
  MerchantData(
    id: 22,
    mcc: "5814",
    merchantName: "Sancos",
    zipCode: "S5 8AU",
    streetAddress: "Buchanan Road 281",
    city: "Sheffield",
    countryCode: "GB",
    location: LatLng(53.4080, -1.4657),
  ),
  MerchantData(
    id: 23,
    mcc: "5812",
    merchantName: "Restaurante Sal",
    zipCode: "7570-7",
    streetAddress: "Praia Do Pêgo",
    city: "Carvalhal",
    countryCode: "PT",
    location: LatLng(38.1817, -8.7925),
  ),
  MerchantData(
    id: 24,
    mcc: "5812",
    merchantName: "Queres?",
    zipCode: "4800-134",
    streetAddress: "Travessa Belmiro Mendes De Oliveira, 78",
    city: "Guimaraes",
    countryCode: "PT",
    location: LatLng(41.4450, -8.2917),
  ),
  MerchantData(
    id: 25,
    mcc: "5812",
    merchantName: "Mira Tapas e Wines",
    zipCode: "8950-4",
    streetAddress: "Rua Dr Marcelino Franco N 29",
    city: "Vale Da Velha",
    countryCode: "PT",
    location: LatLng(37.1098, -7.6383),
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
        child: Row(
          children: [
            // Left side - Phone prototype
            Expanded(
              flex: 1,
              child: Center(
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
              ),
            ),
            // Right side - Branded text
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 60.0, 60.0, 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Buy local.\nGrow together.',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                        letterSpacing: -2,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'When Teya merchants buy from other\nTeya merchants, everyone wins with\nincreased cashback.',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF666666),
                        height: 1.5,
                        letterSpacing: -0.3,
                      ),
                    ),
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
  bool _isMapView = false;
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

  void _scrollToItem(int merchantId) {
    final key = _itemKeys[merchantId];
    if (key != null && key.currentContext != null) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: 0.2,
        );
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
                            border: Border.all(
                              color: const Color(0xFFD1D5DB),
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FlutterMap(
                              options: MapOptions(
                                initialCenter: LatLng(51.5, 0.0),
                                initialZoom: 5.5,
                                minZoom: 3.0,
                                maxZoom: 18.0,
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
                                      width: 36,
                                      height: 36,
                                      child: GestureDetector(
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
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: isSelected ? const Color(0xFF6C7200) : const Color(0xFFF6F8C7),
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
                                              colorFilter: ColorFilter.mode(
                                                isSelected ? Colors.white : const Color(0xFF151712),
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                // User location marker (UK)
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: LatLng(51.5, 0.0),
                                      width: 20,
                                      height: 20,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF6C7200),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 3),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.3),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/store.svg',
                  width: 24,
                  height: 24,
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


