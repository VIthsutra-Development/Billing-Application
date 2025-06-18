import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class GridCard extends StatelessWidget {
  final IconData icon;
  final String cardName;
  final VoidCallback onPressed;
  const GridCard({
    super.key,
    required this.icon,
    required this.cardName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.blue,
                size: 50,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                cardName,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
