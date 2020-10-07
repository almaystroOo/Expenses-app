import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import '../models/transactions.dart';
//import '../../test/user_transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function newTrx;

  NewTransaction({Key key, this.newTrx}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmitied() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.newTrx(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => onSubmitied(),
                decoration: InputDecoration(
                    hintText: 'Enter your title ', labelText: 'title'),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => onSubmitied(),
                decoration: InputDecoration(
                    hintText: 'Enter your amount ', labelText: 'amount'),
              ),
              FlatButton(
                  onPressed: () {
                    onSubmitied();
                  },
                  // onPressed: () => print('pressed  ' +
                  //     amountController.text +
                  //     "/" +
                  //     titleController.text),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
