import 'package:flutter/material.dart';
import 'package:new_billing/features/firm/presentation/widgets/firm_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FirmLoadingWidget extends StatelessWidget {
  const FirmLoadingWidget({super.key});

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
                    "Firm's",
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
                    "Already Exesting Firm's",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return FirmTile(
                    firmEmail: "DemoPerson",
                    firmPanNumber: "DemoPanNumber",
                    firmName: "DemoPersonName",
                    firmPhoneNumber: "DemoPhoneNumber",
                    onDeletePressed: () {},
                    firmAddress: "DemoFirmAddress",
                    firmGstNumber: "DemoFirmGstNumber",
                  );
                },
                itemCount: 10,
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
