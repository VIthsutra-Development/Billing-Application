import 'package:flutter/material.dart';
import 'package:new_billing/features/logistic/presentation/widgets/logistic_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LogisticLoadingWidget extends StatelessWidget {
  const LogisticLoadingWidget({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    "Logistic's",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    "Already Exesting Logistic's",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return LogisticTile(
                    logisticName: "Demo Name",
                    logisticPhoneNumber: "DemoPhones",
                    onDeletePressed: () {},
                    logisticAddress: "DemoAddressLoading",
                    logisticGstNumber: "DemoGstNumber",
                    logisticState: "DemoState",
                  );
                },
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
