import 'package:flutter/material.dart';
import 'package:solesmates/screens/cart/widgets/custom_divider_view.dart';
import 'package:solesmates/themes/colours.dart';
import 'package:solesmates/utils/constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> accountSectionTitles = [
      'Profile',
      'Addresses',
      'Wish list',
      'Message Centre',
      'Payments',
      'Help',
    ];
    final List<String> sectionOverview = [
      'Edit login, name and mobile number',
      'Edit addresses and delivery preferences for orders',
      'View products marked as a favourite',
      'View previous messages with a customer service operator',
      'Manage payment methods and settings, view balances and offers',
      'Browse frequently asked questions (FAQ)',
    ];

    Container _buildAppBar(context) {
      final subtitleStyle = Theme.of(context).textTheme.bodyText1;

      return Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Jane Doe',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                IconButton(
                  iconSize: 17,
                  color: AppColours.darkOrange,
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                )
              ],
            ),
            Constants.verticalSpaceSmall(),
            Row(
              children: <Widget>[
                Text('+44 7901 409235 ', style: subtitleStyle),
                Constants.horizontalSpaceSmall(),
                ClipOval(
                  child: Container(
                    height: 3.0,
                    width: 3.0,
                    color: Colors.grey[700],
                  ),
                ),
                Constants.horizontalSpaceSmall(),
                Text('janedoe@example.com', style: subtitleStyle)
              ],
            ),
            Constants.verticalSpaceLarge(),
            const CustomDividerView(
              dividerHeight: 1.8,
              color: Colors.black,
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildAppBar(context),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: accountSectionTitles.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AccountScreenSection(
                    title: accountSectionTitles[index],
                    sectionOverview: sectionOverview[index],
                    isLastItem: (accountSectionTitles.length - 1) == index,
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

class AccountScreenSection extends StatelessWidget {
  const AccountScreenSection({
    Key key,
    @required this.title,
    @required this.sectionOverview,
    this.isLastItem = false,
  })  : assert(title != '', sectionOverview != ''),
        super(key: key);

  final String title;
  final String sectionOverview;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 15.0),
                    ),
                    Constants.verticalSpaceExtraSmall(),
                    Text(
                      sectionOverview,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 13.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Constants.horizontalSpaceSmall(),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
          Constants.verticalSpaceLarge(),
          isLastItem
              ? const SizedBox()
              : const CustomDividerView(
                  dividerHeight: 0.8,
                  color: Colors.black26,
                ),
        ],
      ),
    );
  }
}
