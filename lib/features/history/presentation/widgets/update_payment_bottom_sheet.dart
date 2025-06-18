import 'package:flutter/material.dart';
import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/themes/colors.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/features/pdf_viev/page/pdf_view_page.dart';

class UpdatePaymentBottomSheet extends StatelessWidget {
  final String invoiceId;
  final String invoiceName;
  final bool isPaid;
  final bool isLoading;
  final VoidCallback onPaymentDone;
  const UpdatePaymentBottomSheet({
    super.key,
    required this.invoiceId,
    required this.invoiceName,
    required this.isPaid,
    this.isLoading = false,
    required this.onPaymentDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment(-1, 0),
            child: Text(
              "Invoice",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    invoiceName,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    invoiceId,
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Icon(
                    Icons.insert_drive_file,
                    color: AppColors.blue,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AppFilledButton(
            isLoading: isLoading,
            onPressed: isPaid ? null : onPaymentDone,
            buttonText: "Mark as Done",
          ),
          SizedBox(
            height: 10,
          ),
          AppFilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFScreen(
                    pdfUrl: "${AppUrls.downloadInvoice}/$invoiceId",
                  ),
                ),
              );
            },
            buttonText: "View Invoice",
          ),
        ],
      ),
    );
  }
}
