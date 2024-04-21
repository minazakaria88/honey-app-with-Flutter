import 'package:flutter/material.dart';

import '../../data/models/home_model.dart';
import 'list_view_item.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.products, required this.length,
  });

  final List<Products> products;
  final int length;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: GridView.count(
        shrinkWrap: true,
        physics: length==4? const NeverScrollableScrollPhysics():const ScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio:.58 ,
        children: List.generate(
          length,
              (index) => ListViewItem(
              productsModel:
              products[index]),),

      ),
    );
  }
}