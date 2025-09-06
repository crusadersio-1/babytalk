import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/app_export.dart';

import '../widgets/categories_app_bar.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final supabase = Supabase.instance.client;

  List<CategoryModel> categories = [
    CategoryModel(
      image: ImageConstant.imgBabytalkDraft6,
      title: 'Animals',
    ),
    CategoryModel(
      image: ImageConstant.imgBabytalkDraft8,
      title: 'People',
    ),
    CategoryModel(
      image: ImageConstant.imgBabytalkDraft7,
      title: 'Clothes',
    ),
    CategoryModel(
      image: ImageConstant.img102,
      title: 'Shapes',
    ),
    CategoryModel(
      image: ImageConstant.img92,
      title: 'Colors',
    ),
    CategoryModel(
      image: ImageConstant.img16,
      title: 'Activities',
    ),
    CategoryModel(
      image: ImageConstant.img15,
      title: 'Numbers',
    ),
    CategoryModel(
      image: ImageConstant.img14,
      title: 'Alphabets',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final session = supabase.auth.currentSession;
    final bool isLoggedIn = session != null;

    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      appBar: CustomCategoriesAppBar(
        title: 'Categories',
        onTitleTap: () async {
          if (isLoggedIn) {
            await supabase.auth.signOut();

            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        switchLabel: isLoggedIn ? 'Child' : null,
        switchValue: isLoggedIn ? true : null,
        onSwitchChanged: isLoggedIn
            ? (bool value) {
              }
            : null,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.img),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 32.h,
            right: 32.h,
          ),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 28.h,
                    mainAxisSpacing: 19.h,
                    childAspectRatio: 0.84,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCardWidget(
                      category: categories[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryModel {
  String? image;
  String? title;

  CategoryModel({
    this.image,
    this.title,
  });
}