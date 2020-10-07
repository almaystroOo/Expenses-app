import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../lib/widgets/transactionsList.dart';
import '../lib/widgets/new_transaction.dart';
import '../lib/models/transactions.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
            //newTrx: newTrx,
            ),
        TransactionList(
            // transactions: _transactions,
            )
      ],
    );
  }
}
