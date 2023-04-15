
import 'package:flutter/material.dart';
import 'package:pollen_meter/core_ui/pollen_concentration_gauge.dart';
import 'package:pollen_meter/pollen_statistics/widgets/statistic_pollen_tile_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 70),
            const PollenConcentrationGauge(
                concentration: 20, progressBarColor: Colors.cyan, text: "OK"),
            SizedBox(
              height: 125,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    PollenConcentrationGauge(
                        concentration: 20,
                        progressBarColor: Colors.cyan,
                        text: index.toString()),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
              ),
            ),
            StatisticPollenTileWidget(
                pathImage: 'asdf', title: "L", levelOfConcentration: "High"),
            StatisticPollenTileWidget(
                pathImage: 'asdf', title: "L", levelOfConcentration: "Low"),
            StatisticPollenTileWidget(
                pathImage: 'asdf',
                title: "L",
                levelOfConcentration: "Moderate"),
            StatisticPollenTileWidget(
                pathImage: 'asdf',
                title: "L",
                levelOfConcentration: "Very High"),
            StatisticPollenTileWidget(
                pathImage: 'asdf', title: "L", levelOfConcentration: "High"),
            StatisticPollenTileWidget(
                pathImage: 'asdf', title: "L", levelOfConcentration: "High"),
            StatisticPollenTileWidget(
                pathImage: 'asdf', title: "L", levelOfConcentration: "Low"),
            StatisticPollenTileWidget(
                pathImage: 'asdf',
                title: "L",
                levelOfConcentration: "Moderate"),
            StatisticPollenTileWidget(
                pathImage: 'asdf',
                title: "L",
                levelOfConcentration: "Very High"),
            StatisticPollenTileWidget(
                pathImage: 'asdf', title: "L", levelOfConcentration: "High"),
          ],
        ),
      ),
    );
  }
}
