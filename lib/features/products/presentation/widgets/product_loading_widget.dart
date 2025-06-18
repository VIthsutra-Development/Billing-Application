import 'package:flutter/material.dart';
import 'package:new_billing/features/products/presentation/widgets/product_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    "Product's",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    "Add Products To Invoice",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductTile(
                    productName: "Shampoo",
                    productQuantity: "10.00",
                    onDeletePressed: () {},
                    productPrice: "\$200",
                  );
                },
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
