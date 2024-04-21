import 'package:flutter/material.dart';
import 'package:mind/features/home/presentation/widgets/list_item_widget.dart';


import '../../data/models/home_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.products});
 final List<Products> products;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(child: ListItemWidget(products: products,length:products.length,),)
          ],
        ),
      ),
    );
  }
}
