class HomeModel
{
   List<Slider> slider=[];
   List<Categories> categories=[];
   List<Products> products=[];
   List<Products> newProducts=[];
   List<Products> selectedProducts=[];
  HomeModel.fromJson(Map<String,dynamic> json)
  {
     json['slider'].forEach((e){
       slider.add(Slider.fromJson(e));
     });

     json['categories'].forEach((e){
       categories.add(Categories.fromJson(e));
     });

     json['products'].forEach((e){
       products.add(Products.fromJson(e));
     });

     json['selected_products'].forEach((e){
       selectedProducts.add(Products.fromJson(e));
     });

     json['new_products'].forEach((e){
       newProducts.add(Products.fromJson(e));
     });
  }
}

class Slider
{
   late final String id;
   late final String productId;
   late final String image;

   Slider.fromJson(Map<String,dynamic> json)
   {
         id=json['id'];
         productId=json['product_id'];
         image=json['image'];
   }
}

class Categories
{
  late final String id;
  late final String catName;
  late final String icon;

  Categories.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    catName=json['cat_name'];
    icon=json['icon'];
  }
}

class Products
{
  late final String id;
  late final String name;
  late final String shortDesc;
  late final String image;
  late final String listPrice;
  late final String salePrice;
  late final String discount;
  late final String ? rating;

  Products.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    shortDesc=json['short_desc'];
    rating=json['rating'];
    discount=json['discount'];
    listPrice=json['list_price'];
    salePrice=json['sale_price'];
    image=json['main_image'];
  }


}