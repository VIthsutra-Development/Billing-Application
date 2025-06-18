import 'package:flutter/material.dart';
import 'package:new_billing/features/bank/presentation/widgets/bank_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BankLoadingWidget extends StatelessWidget {
  const BankLoadingWidget({super.key});

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
                    "Bank's",
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
                    "Already Exesting Bank's",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return BankTile(
                    bankName: "DemoBank",
                    bankAccountNumber: "DemoAccountNumber",
                    onDeletePressed: () {
                      
                    },
                    bankBranch: "DemoBranch",
                    bankHolderName: "DemoHolder",
                    bankIfscCode: "DemoIFSCCode",
                  );
                },
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
