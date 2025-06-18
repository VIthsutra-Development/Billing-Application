import 'package:flutter/material.dart';
import 'package:new_billing/features/history/presentation/widgets/history_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryLoadingWidget extends StatelessWidget {
  const HistoryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment(-1, 0),
                child: Text(
                  "Invoice History",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment(-1, 0),
                child: Text(
                  "List of the Invoices Generated.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return HistoryTile(
                    invoiceName: "Invoice Name",
                    invoiceId: "Invoice-Id-Number",
                    onDeletePressed: () {},
                    onTilePressed: () {},
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
