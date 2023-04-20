import 'package:flutter/material.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import '../../core_ui/pollen/models/pollen_ui_model.dart';

class StatisticPollenTileWidget extends StatelessWidget {
  const StatisticPollenTileWidget({
    Key? key,
    required this.statisticModel,
  }) : super(key: key);

  final PollenUIModel statisticModel;
  // final Map<String, Color> _mapColor = {
  //   'Low': Colors.green.shade200,
  //   'Moderate': Colors.orange.shade200,
  //   'High': Colors.red.shade200,
  //   'Very High': Colors.purple.shade300,
  // };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.secondary,
        leading: SizedBox(
          width: 60,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: statisticModel.color.withOpacity(0.4),
                ),
                height: 28,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: statisticModel.color,
                ),
                height: 14,
              ),
            ],
          ),
        ), //Image.asset(pathImage),  //replace with Image.asset when we add assets, uses default IconData for now
        title: Text(statisticModel.title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        trailing: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${statisticModel.value.toStringAsFixed(0)} ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: context.loc.unit,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
