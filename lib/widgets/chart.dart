import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';
import './chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({Key key, this.recentTransaction}) : super(key: key);

  List<Map<String, Object>> get groupOfTransacrion {
    //....... List.generate(length, (index) => null)
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      print(recentTransaction.length);
      print(weekDay);
      var totSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totSum,
        //'percentage': (totSum / recentTransaction.length) * 100
      };
    }).reversed.toList();
  }

  double get percentageAmount {
    return groupOfTransacrion.fold(
        0.0, (sum, element) => sum + element['amount']);
  }

  // double get percentage {
  //   var amount = groupOfTransacrion.map((e) => print(e['amount']));
  //   return ((amount as double) / percentageAmount) * 100;
  // }
  // double get percentage {
  //   return percentageAmount / groupOfTransacrion.length * 100;
  // }

  @override
  Widget build(BuildContext context) {
    //print(percentage.toString());
    //print(groupOfTransacrion.map((e) => print(e['amount'])));
    return Container(
        child: Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                //  recentTransaction.isNotEmpty
                //     ?
                groupOfTransacrion.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    percentageAmount == 0.0
                        ? 0.0
                        : ((data['amount'] as double) / percentageAmount)),
              );
            }).toList()
            // : [Text(' no charts to be shown !')]
            // Slider(
            //     min: 10,
            //     max: 50,
            //     value: 10.0,
            //     onChanged: (_) {
            //       // print(groupOfTransacrion.toString());
            //     })
            ),
      ),
    ));
  }
}
