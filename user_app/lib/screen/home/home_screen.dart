import 'package:flutter/material.dart';
import 'package:user_app/screen/create_order/create_order_screen.dart';

import '../list_order/orders_screen.dart';
import 'component/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  void _onItemTapped(int index) {
    _tabController?.animateTo(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomBar(
        handleTapIndex: _onItemTapped,
      ),
      endDrawer: Container(),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Navigator(
            onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => const CreateOrderScreen()),
            observers: [HeroController()],
          ),
          Navigator(
            onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => const OrdersScreen()),
            observers: [HeroController()],
          ),
        ],
      ),
    );
  }
}
