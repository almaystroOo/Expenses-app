// /// Flutter code sample for SingleChildScrollView

// // In this example, the children are spaced out equally, unless there's no more
// // room, in which case they stack vertically and scroll.
// //
// // When using this technique, [Expanded] and [Flexible] are not useful, because
// // in both cases the "available space" is infinite (since this is in a viewport).
// // The next section describes a technique for providing a maximum height constraint.

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: MyStatelessWidget(),
//     );
//   }
// }

// /// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatelessWidget {
//   MyStatelessWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: Theme.of(context).textTheme.bodyText2,
//       child: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints viewportConstraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: viewportConstraints.maxHeight,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   Container(
//                     // A fixed-height child.
//                     color: const Color(0xffeeee00), // Yellow
//                     height: 120.0,
//                     alignment: Alignment.center,
//                     child: const Text('Fixed Height Content'),
//                   ),
//                   Container(
//                     // Another fixed-height child.
//                     color: const Color(0xff008000), // Green
//                     height: 120.0,
//                     alignment: Alignment.center,
//                     child: const Text('Fixed Height Content'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

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
        textTheme: ThemeData.light().textTheme.copyWith(
            button: TextStyle(
                //backgroundColor: Colors.purple,
                fontFamily: GoogleFonts.openSans().toString(),
                color: Colors.white),
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

  void newTrx(String txtitle, double txamount, DateTime txDate) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: txDate);
    print(newtx);
    setState(() {
      transactions.add(newtx);
    });
  }

  int _selctedIndex;
  void deleteTrx(int _selctedIndex) {
    setState(() {
      transactions.removeAt(_selctedIndex);
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
            //deleteTrx: deleteTrx,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final appBar = AppBar(
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
    );
    print(' 0.60 height =' +
        '${(((deviceSize.size.height) - appBar.preferredSize.height) * 0.60)}');
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      // Color(0XFFF8BBD0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: (((deviceSize.size.height) -
                    appBar.preferredSize.height -
                    deviceSize.padding.top) *
                0.4),
            // height:
            //     (((deviceSize.size.height) - appBar.preferredSize.height) *
            //         0.40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'The expenses chart !',
                    style: Theme.of(context).textTheme.headline6,
                    //  GoogleFonts.openSans(fontWeight: FontWeight.bold)
                    //TextStyle(color: Colors.black),
                  ),
                ),
                Chart(recentTransaction: _recentTransaction),
              ],
            ),
          ),

          //  Divider(color: Colors.pink),
          Container(
            height: (((deviceSize.size.height) -
                    appBar.preferredSize.height -
                    deviceSize.padding.top) *
                0.60),
            child: TransactionList(
              transactions: transactions,
              deleteTrx: deleteTrx,

              //  scrollDirection: Axis.vertical,
            ),
          ),
          // Center(
          //   child:
          // )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
