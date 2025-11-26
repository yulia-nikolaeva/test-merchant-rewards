import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merchant Rewards',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MerchantRewardsHomePage(),
    );
  }
}

class MerchantRewardsHomePage extends StatefulWidget {
  const MerchantRewardsHomePage({super.key});

  @override
  State<MerchantRewardsHomePage> createState() => _MerchantRewardsHomePageState();
}

class _MerchantRewardsHomePageState extends State<MerchantRewardsHomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _merchants = [
    {
      'name': 'Coffee House',
      'category': 'Food & Beverage',
      'reward': '10% cashback',
      'icon': Icons.local_cafe,
    },
    {
      'name': 'Tech Store',
      'category': 'Electronics',
      'reward': '5% cashback',
      'icon': Icons.devices,
    },
    {
      'name': 'Fashion Boutique',
      'category': 'Clothing',
      'reward': '15% cashback',
      'icon': Icons.shopping_bag,
    },
    {
      'name': 'Grocery Mart',
      'category': 'Groceries',
      'reward': '3% cashback',
      'icon': Icons.shopping_cart,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Merchant Rewards'),
        centerTitle: true,
      ),
      body: _selectedIndex == 0 ? _buildMerchantList() : _buildRewardsPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Merchants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'My Rewards',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildMerchantList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Merchants',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: _merchants.length,
              itemBuilder: (context, index) {
                final merchant = _merchants[index];
                return Card(
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      _showMerchantDetails(merchant);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            merchant['icon'] as IconData,
                            size: 48,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            merchant['name'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            merchant['category'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              merchant['reward'] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                              ),
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
        ],
      ),
    );
  }

  Widget _buildRewardsPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events,
            size: 120,
            color: Colors.amber[600],
          ),
          const SizedBox(height: 24),
          Text(
            'Total Rewards Earned',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            '\$125.50',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 32),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildRewardRow('Coffee House', '\$25.00'),
                  const Divider(),
                  _buildRewardRow('Tech Store', '\$50.00'),
                  const Divider(),
                  _buildRewardRow('Fashion Boutique', '\$45.00'),
                  const Divider(),
                  _buildRewardRow('Grocery Mart', '\$5.50'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardRow(String merchant, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(merchant),
        Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  void _showMerchantDetails(Map<String, dynamic> merchant) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(merchant['name'] as String),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${merchant['category']}'),
            const SizedBox(height: 8),
            Text('Reward: ${merchant['reward']}'),
            const SizedBox(height: 16),
            const Text(
              'Shop at this merchant to earn rewards on your purchases!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

