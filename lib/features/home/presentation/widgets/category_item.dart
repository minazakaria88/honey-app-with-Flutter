import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15),
      child: SizedBox(
        height: 120,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange,
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(cubit.homeModel!.categories[index].icon,fit: BoxFit.fill,),
                  ),
                ),
                Text(
                  cubit.homeModel!.categories[index].catName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 15,),
            itemCount: cubit.homeModel!.categories.length
        ),
      ),
    );
  }
}