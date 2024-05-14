import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constraints/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({Key? key, this.showAddRemoveButtons = true})
      : super(key: key);

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          ///add remove row buttons with price
          if(showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///extra space
                  SizedBox(width: 70),

                  ///add remove button
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: '256')
            ],
          ),
        ],
      ),
    );
  }
}
