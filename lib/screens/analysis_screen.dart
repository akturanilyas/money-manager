import 'package:bloctest/models/money_exchange_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  final List<SalesData> chartData = [
    SalesData(2010, 35, 23),
    SalesData(2011, 38, 49),
    SalesData(2012, 34, 12),
    SalesData(2013, 52, 33),
    SalesData(2014, 40, 30)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Wrap(children: [
      //Initialize the chart widget
      SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
      Padding(
        padding: const EdgeInsets.all(8.0),
        //Initialize the spark charts widget
        child: SfSparkLineChart.custom(
          //Enable the trackball
          trackball:
              SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
          //Enable marker
          marker:
              SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
          //Enable data label
          labelDisplayMode: SparkChartLabelDisplayMode.all,
          xValueMapper: (int index) => data[index].year,
          yValueMapper: (int index) => data[index].sales,
          dataCount: 5,
        ),
      ),
      SfCartesianChart(series: <ChartSeries>[
        // Renders column chart
        ColumnSeries<SalesData, double>(
            dataSource: chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales)
      ])
    ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class SalesData {
  SalesData(this.year, this.sales, this.i);

  final double year;
  final double sales;
  final double i;
}
