import 'file:///C:/Users/ahmed/.vscode/expenses_app/test/user_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transactionsList.dart';
import 'package:intl/intl.dart';
import './models/transactions.dart';
import './widgets/new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.accents[200],
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transactions = [
    Transaction(
        id: DateTime.now().toString(),
        amount: 88,
        date: DateTime.now(),
        title: 'tx no 1 : fuel'),
    Transaction(
        id: DateTime.now().toString(),
        amount: 82,
        date: DateTime.now(),
        title: 'tx no 3 : gaz')
  ];
  void newTrx(String txtitle, double txamount) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
    print(newtx);
    setState(() {
      _transactions.add(newtx);
    });
  }

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        // #fixed / GestureDetector(
        // onTap: () {},
        // behavior: HitTestBehavior.opaque,
        // child:
        context: ctx,
        builder: (_) {
          return NewTransaction(
            newTrx: newTrx,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.playlist_add),
              onPressed: () {
                startNewTransaction(context);
              })
        ],
        title: Text('Expenses App'),
        centerTitle: true,
        backgroundColor: Color(0XFFE91E63),
      ),
      backgroundColor: Color(0XFFF8BBD0),
      body: ListView(
        children: <Widget>[
          // Text("fuck you son of bitch"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Text(
                  'The expenses chart !',
                  style: TextStyle(color: Colors.black),
                ),
                elevation: 5,
              ),
              Divider(color: Colors.pink),
              TransactionList(
                transactions: _transactions,
              )
              // Center(
              //   child:
              // )
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              startNewTransaction(context);
            }),
      ),
    );
  }
}
