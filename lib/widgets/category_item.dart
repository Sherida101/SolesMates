import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solesmates/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final bool isActive;
  final Function onTap;

  const CategoryItem({
    Key key,
    @required this.category,
    @required this.isActive,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(category),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          // color: Theme.of(context).scaffoldBackgroundColor,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 10,
              offset: Offset(isActive ? 4 : 0, isActive ? 6 : -1),
              spreadRadius: isActive ? 3 : 1,
              color: isActive ? Colors.black12 : Colors.grey.shade200,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset(
              category.categoryIconPath,
              height: 20,
              width: 20,
              color: Colors.blueGrey,
            ),
            const SizedBox(width: 10),
            Text(
              category.categoryName,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
