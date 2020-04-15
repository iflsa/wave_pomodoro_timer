import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  Chart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: charts.ConstCornerStrategy(30),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<List, String>> _createSampleData() {
    return [
      charts.Series<List, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (obj, _) => obj[0],
        measureFn: (obj, _) => obj[1],
        data: [
          ["Monday", 15],
          ["Tuesday", 15],
          ["Wednesday", 15],
          ["Thursday", 15],
          ["Friday", 15],
          ["Saturday", 15],
          ["Sunday", 15],
        ],
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
