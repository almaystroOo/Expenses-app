import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({Key key, this.transactions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "\$" + transactions[index].amount.toStringAsFixed(2),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.redAccent, fontSize: 15.0
                          //  decorationStyle: TextDecorationStyle.dotted,

                          // decoration: TextDecoration.lineThrough
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    children: [
                      Text(
                        transactions[index].title,
                        //    style: TextStyle(fontSize: 10.0),
                      ),
                      Divider(color: Colors.pink),
                      Text(
                        DateFormat().format(transactions[index].date),
                        // style: TextStyle(fontSize: 0.5),
                      ),
                    ],
                  ),
                )
              ],
            ));
          }

          // children: transactions.map((tx) {
          //  ).toList(),
          ),
    );
  }
}
