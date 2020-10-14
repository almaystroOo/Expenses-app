import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTrx;
  TransactionList({Key key, this.transactions, this.deleteTrx})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                Center(
                    child: Text(
                  'The List is Empty !',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    height: 200.0,
                    child: Image.asset(
                      'assets/waiting.png',
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 6,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text('${transactions[index].title}'),
                      subtitle: Text(
                          DateFormat.yMMMMd().format(transactions[index].date)),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            deleteTrx(index);
                          }),
                    ));
              }
//
              // children: transactions.map((tx) {
              //  ).toList(),
              ),
    );
  }
}
// //Row(
//                   children: [
//                     Container(
//                       margin:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.purple, width: 2)),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Text(
//                           "\$" + transactions[index].amount.toStringAsFixed(2),
//                           overflow: TextOverflow.ellipsis,
//                           style: Theme.of(context).textTheme.headline6,
//                           // style: TextStyle(color: Colors.redAccent, fontSize: 15.0
//                           //     //  decorationStyle: TextDecorationStyle.dotted,

//                           //     // decoration: TextDecoration.lineThrough
//                           //     ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 18.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             transactions[index].title,
//                             style: Theme.of(context).textTheme.headline6,
//                           ),
//                           Divider(color: Colors.pink),
//                           Text(
//                             DateFormat().format(transactions[index].date),
//                             // style: TextStyle(fontSize: 0.5),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
