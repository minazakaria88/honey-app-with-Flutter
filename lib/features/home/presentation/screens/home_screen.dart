import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind/features/home/presentation/cubit/home_cubit.dart';
import 'package:mind/features/home/presentation/cubit/home_state.dart';
import '../../../../core/routes.dart';
import '../../../login/presentation/widgets/new_text_filed.dart';

import '../widgets/category_item.dart';
import '../widgets/image_slider.dart';
import '../widgets/list_item_widget.dart';
import '../widgets/more_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {},
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                    ),
                    label: ' '),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: ' '),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ' '),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NewTextFiled(
                          controller: cubit.search,
                          function: (String value) {
                              if(value.isEmpty)
                                {
                                  return 'required';
                                }
                          },
                          iconData: Icons.search,
                          label: 'ابحث عن المنتج',
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: (){
                             cubit.getSearchData(value: cubit.search.text).then((value) {
                               Navigator.pushNamed(context, Routes.allProducts);
                               cubit.search.clear();
                             });

                          },
                          icon: const Icon(Icons.search_sharp,size: 30,)
                      ),
                    ],
                  ),
                  if (cubit.homeModel != null) ...[
                    ImageSlider(cubit: cubit),
                    CategoryItems(cubit: cubit),
                    MoreItems(
                      text: 'المنتجات',
                      function: () {
                        products=[];
                        products=cubit.homeModel!.products;
                        print(products.length);
                        Navigator.pushNamed(context, Routes.allProducts);
                      },
                    ),
                    ListItemWidget(length:4,products: cubit.homeModel!.products),
                    MoreItems(
                      text:'منتجات مختاره لك ',
                      function: () {
                        products=[];
                        products=cubit.homeModel!.selectedProducts;
                        Navigator.pushNamed(context, Routes.allProducts);
                      },
                    ),
                    ListItemWidget(length:4,products: cubit.homeModel!.selectedProducts),
                    MoreItems(
                      text: 'المنتجات جديده',
                      function: () {
                        products=[];
                        products=cubit.homeModel!.newProducts;
                        Navigator.pushNamed(context, Routes.allProducts);
                      },
                    ),
                    ListItemWidget(length:4,products: cubit.homeModel!.newProducts),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


