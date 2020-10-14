import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime _selectedDate;
  void onSubmitied() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.newTrx(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => onSubmitied(),
                decoration: InputDecoration(
                    hintText: 'Enter your title ', labelText: 'Title'),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => onSubmitied(),
                decoration: InputDecoration(
                    hintText: 'Enter your amount ', labelText: 'Amount'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date chosen'
                        : 'Date Picked : ' +
                            DateFormat.yMMMEd().format(_selectedDate)),
                  ),
                  FlatButton(
                      textColor: Colors.purple,
                      //color: Theme.of(context).primaryColor,
                      onPressed: _showDatePicker,
                      child: Text(
                        'Chose a date',
                        //style: Theme.of(context).textTheme.button,
                      ))
                ],
              ),
              RaisedButton(
                  textColor: Theme.of(context).buttonColor,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    onSubmitied();
                  },
                  // onPressed: () => print('pressed  ' +
                  //     amountController.text +
                  //     "/" +
                  //     titleController.text),
                  child: Text(
                    "Add a new Transaction",
                    //style: TextStyle(color: Theme.of(context).primaryColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
