import 'package:flutter/material.dart';
import 'package:solesmates/data/app_repository.dart';
import 'package:solesmates/models/product_model.dart';
import 'package:solesmates/screens/cart/widgets/custom_divider_view.dart';
import 'package:solesmates/screens/home/clearance_sale_list_item_view.dart';
import 'package:solesmates/themes/colours.dart';
import 'package:solesmates/utils/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<ProductModel> bootsSneakersCatalogue = [
    ...AppRepository.getBootsCatalogue(),
    ...AppRepository.getSneakersCatalogue()
  ];

  final List<ProductModel> sandalsSlippersCatalogue = [
    ...AppRepository.getSandalsCatalogue(),
    ...AppRepository.getSlippersCatalogue()
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for shoes',
                          hintStyle:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                    color: Colors.grey,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Constants.horizontalSpaceMedium(),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Constants.verticalSpaceExtraSmall(),
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: _tabController,
                indicatorColor: AppColours.darkOrange,
                labelStyle: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 18.0, color: AppColours.darkOrange),
                unselectedLabelStyle:
                    Theme.of(context).textTheme.subtitle2.copyWith(
                          fontSize: 18.0,
                          color: Colors.grey[200],
                        ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(child: Text('Boots & Sneakers')),
                  Tab(child: Text('Sandals & Slippers')),
                ],
              ),
              Constants.verticalSpaceSmall(),
              const CustomDividerView(dividerHeight: 8.0),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SearchListView(catalogue: bootsSneakersCatalogue),
                    SearchListView(catalogue: sandalsSlippersCatalogue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  final List<ProductModel> catalogue;

  const SearchListView({Key key, this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    catalogue.shuffle();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: catalogue.length,
      itemBuilder: (context, index) => ClearanceSaleListItemView(
        productInfo: catalogue[index],
      ),
    );
  }
}
