import 'package:flutter/material.dart';
import 'package:solesmates/data/app_repository.dart';
import 'package:solesmates/routes/routes.dart';
import 'package:solesmates/screens/account_screen.dart';
import 'package:solesmates/screens/home/clearance_sale_list_item_view.dart';
import 'package:solesmates/screens/home_screen.dart';
import 'package:solesmates/screens/orders/orders_screen.dart';
import 'package:solesmates/screens/search_screen.dart';
import 'package:solesmates/utils/constants.dart';
import 'package:solesmates/widgets/badge.dart';
import 'package:solesmates/widgets/title_appbarwidget.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHomeScreen> {
  int _currentTab = 0;

  final List<Widget> _bottomNavMenuTabs = [
    const HomeScreen(),
    const SearchScreen(),
    const OrdersScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onChangeBottomNavTab(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  Stack _buildClearanceSaleHeaderView() {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/clearanceSale/clearanceSaleBanner.png',
          height: MediaQuery.of(context).size.height / 2.1,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40.0,
          left: 0.4,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 28.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }

  Widget _buildClearanceSaleListView(title) {
    final restaurants = AppRepository.getClearanceSaleItems();

    final headerStyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontWeight: FontWeight.w500, fontSize: 13.0);

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: headerStyle,
              ),
              const Spacer(),
              const Icon(Icons.filter_list),
              Constants.horizontalSpaceSmall(),
              Text('SORT/FILTER', style: headerStyle)
            ],
          ),
          Constants.verticalSpaceSmall(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) => ClearanceSaleListItemView(
              productInfo: restaurants[index],
            ),
          )
        ],
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildClearanceSaleHeaderView(),
            Constants.verticalSpaceMedium(),
            _buildClearanceSaleListView(
              '156 RESTAURANTS NEARBY',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(), //const Drawer(),
      appBar: _buildAppBar(_scaffoldKey),
      body: _bottomNavMenuTabs[_currentTab],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: _onChangeBottomNavTab,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
      floatingActionButton: WBadge(
        value: '1',
        color: Colors.blue,
        child: FloatingActionButton(
          // backgroundColor: const Color(0XFF4e55af),
          onPressed: () {
            Navigator.of(context).pushNamed(cartScreenRoute);
          },
          child: const Icon(
            Icons.shopping_cart,
          ),
          elevation: 2.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => scaffoldKey.currentState.openDrawer(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ],
      title: const TitleAppBar(),
    );
  }
}
