import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solesmates/data/app_repository.dart';
import 'package:solesmates/models/category_model.dart';
import 'package:solesmates/utils/app_providers.dart';
import 'package:solesmates/widgets/category_item.dart';
import 'package:solesmates/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  Category _currentCategory = AppRepository.productCategories[0];

  final _scrollController = ScrollController();

  void _onTapCategory(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),
          _getHeader,
          _getCategories,
          const SizedBox(height: 15),
          _getProducts,
        ],
      ),
    );
  }

  Widget get _getHeader => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Soles Mates\' Products',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget get _getCategories => SizedBox(
        height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: AppRepository.productCategories
              .map((item) => CategoryItem(
                    category: item,
                    onTap: _onTapCategory,
                    isActive: item == _currentCategory,
                  ))
              .toList(),
        ),
      );

  Widget get _getProducts =>
      Consumer<ProvProducts>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            controller: _scrollController,
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: (150 / 200),
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 4.0,
            children: provider.getProducts
                .map((item) => WProductCard(product: item))
                .toList(),
          ),
        );
      });
}
