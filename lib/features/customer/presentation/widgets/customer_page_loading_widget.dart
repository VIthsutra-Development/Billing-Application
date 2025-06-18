import 'package:flutter/material.dart';
import 'package:new_billing/features/customer/presentation/widgets/customer_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerPageLoadingWidget extends StatelessWidget {
  const CustomerPageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
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
                    "Customer's",
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
                    "Already Exesting Customer's",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomerTile(
                    customerName: "DemoName",
                    customerAddress: "DemoAddressForLoading",
                    customerGstNumber: "DemoGstNumber",
                    customerState: "DemoState",
                    onDeletePressed: () {},
                  );
                },
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
