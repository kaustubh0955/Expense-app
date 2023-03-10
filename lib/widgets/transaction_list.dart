import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    //ListView is a widget provided by flutter which is the default column
    //with single child scroll view
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              //return Card(
              //child: Row(
              //children: <Widget>[
              //Container(
              //margin: EdgeInsets.symmetric(
              //  vertical: 10,
              //horizontal: 15,
              //),
              //decoration: BoxDecoration(
              //border: Border.all(
              //color: Theme.of(context).primaryColor,
              //width: 2,
              //),
              //),
              //padding: EdgeInsets.all(10),
              //child: Text(
              //'\$${transactions[index].amount.toStringAsFixed(2)}',
              //style: TextStyle(
              //fontWeight: FontWeight.bold,
              //fontSize: 20,
              //color: Theme.of(context).primaryColor,
              //),
              //),
              //),
              //Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //children: <Widget>[
              //Text(
              //transactions[index].title,
              //style: Theme.of(context).textTheme.subtitle1,
              //),
              //Text(
              //DateFormat.yMMMd().format(transactions[index].date),
              //style: TextStyle(
              //color: Colors.grey,
              //),
              //),
              //],
              //),
              // ],
              //),
              //);
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    //Container(
                    //height: 60,
                    //width: 60,
                    //decoration: BoxDecoration(
                    //color: Theme.of(context).primaryColor,
                    //shape: BoxShape.circle,

                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: transactions.length, //no.of transactions to be passed
          );
  }
}
