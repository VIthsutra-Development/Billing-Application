import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class ProductTile extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final String productName;
  final String productQuantity;
  final String productPrice;

  const ProductTile({
    super.key,
    required this.productName,
    required this.productQuantity,
    required this.onDeletePressed,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      isThreeLine: true,
      minVerticalPadding: 6,
      leading: Container(
        decoration: BoxDecoration(
          color: AppColors.opacBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 50,
        height: 50,
        child: Center(
          child: Icon(
            Icons.shopping_bag_rounded,
            color: AppColors.blue,
          ),
        ),
      ),
      title: Text(
        productName,
        style: Theme.of(context).textTheme.titleSmall,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Price Per Unit: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  productPrice,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Quantity: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  productQuantity,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
      trailing: IconButton(
        onPressed: onDeletePressed,
        icon: Icon(
          Icons.delete,
          color: AppColors.red,
        ),
      ),
    );
  }
}
