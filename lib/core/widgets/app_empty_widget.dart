import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class AppEmptyWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  const AppEmptyWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.data_array_rounded,
            size: 60,
            color: AppColors.blue,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          Text(
            "You can try again",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.refresh_rounded,
              size: 30,
              color: AppColors.blue,
            ),
          )
        ],
      ),
    );
  }
}
