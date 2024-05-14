import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constraints/image_strings.dart';
import 'package:t_store/utils/constraints/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({Key? key, required this.category}) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///--brands
            const TBrandShowcase(images: [TImages.productImage3, TImages.productImage2, TImages.productImage1],),
            const TBrandShowcase(images: [TImages.productImage3, TImages.productImage2, TImages.productImage1],),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///--products
            TSectionHeading(title: 'You might like', showActionButton: true, onPressed: (){},),
            const SizedBox(height: TSizes.spaceBtwItems),

            TGridLayout(itemCount: 4, itemBuilder: (_, index) =>  TProductCardVertical(product: ProductModel.empty())),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),]
    );
  }
}
