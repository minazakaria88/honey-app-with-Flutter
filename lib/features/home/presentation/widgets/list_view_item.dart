import 'package:flutter/material.dart';
import 'package:mind/features/home/data/models/home_model.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.productsModel,
  });

  final Products productsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
              child: Image.network(
                productsModel.image,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        productsModel.name,
                        maxLines: 4,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        productsModel.shortDesc,
                        style: const TextStyle(
                          color: Colors.black,

                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${productsModel.salePrice}درهم اماراتي',
                        style: const TextStyle(
                          color: Colors.orange,
                          //fontWeight: FontWeight.bold,
                          //fontSize: 20,
                        ),
                      ),
                      Text(
                        '${productsModel.listPrice}درهم اماراتي',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black,
                          //fontSize: 20,
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        child: Text(
                          '%${productsModel.discount}خصم ',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}