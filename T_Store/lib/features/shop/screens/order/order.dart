import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/order/widgets/orders_list.dart';
import 'package:t_store/utils/constraints/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--Appbar
      appBar: TAppBar(title: Text('My orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

        ///--Orders
        child: TOrderListItems(),
      ),
    );
  }
}
