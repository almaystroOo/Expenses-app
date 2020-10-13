import './widgets/chart.dart';
import 'package:flutter/material.dart';
import './widgets/transactionsList.dart';
import 'package:intl/intl.dart';
import './models/transactions.dart';
import './widgets/new_transaction.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                headline6: TextStyle(
                    fontFamily: GoogleFonts.acme().toString(),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white)
                // TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontFamily:
                //         GoogleFonts.openSans(fontWeight: FontWeight.bold)
                //             .toString())
                )),
        textTheme: TextTheme(
            headline6:
                TextStyle(fontFamily: GoogleFonts.openSans().toString())),
        fontFamily: GoogleFonts.lato().toString(),
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
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
  List<Transaction> transactions = [
    // Transaction(
    //     id: DateTime.now().toString(),
    //     amount: 88,
    //     date: DateTime.now(),
    //     title: 'tx no 1 : fuel'),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     amount: 82,
    //     date: DateTime.now(),
    //     title: 'tx no 3 : gaz')
  ];
  List<Transaction> get _recentTransaction {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void newTrx(String txtitle, double txamount) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
    print(newtx);
    setState(() {
      transactions.add(newtx);
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
        textTheme: Theme.of(context).appBarTheme.textTheme,
        actions: [
          IconButton(
              icon: Icon(Icons.playlist_add),
              onPressed: () {
                startNewTransaction(context);
              })
        ],
        title: Text(
          'Expenses App',
          style: Theme.of(context).appBarTheme.textTheme.headline6,
        ),
        centerTitle: true,
        //Color(0XFFE91E63)
        backgroundColor: Theme.of(context).primaryColor,
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
                child: Column(
                  children: [
                    Text(
                      'The expenses chart !',
                      style: Theme.of(context).textTheme.headline6,
                      //  GoogleFonts.openSans(fontWeight: FontWeight.bold)
                      //TextStyle(color: Colors.black),
                    ),
                    Chart(recentTransaction: _recentTransaction)
                  ],
                ),
                elevation: 5,
              ),
              Divider(color: Colors.pink),
              TransactionList(
                transactions: transactions,
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
