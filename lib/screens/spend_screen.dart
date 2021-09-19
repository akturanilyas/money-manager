import 'package:bloctest/bloc/firestore/firestore_bloc.dart';
import 'package:bloctest/models/money_exchange_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpendScreen extends StatefulWidget {
  const SpendScreen({Key? key}) : super(key: key);

  @override
  _SpendScreenState createState() => _SpendScreenState();
}

class _SpendScreenState extends State<SpendScreen> {
  @override
  Widget build(BuildContext context) {
    List<MoneyExchange> exchanges =
        context.select((FirestoreBloc bloc) => bloc.exchanges);
    return BlocBuilder<FirestoreBloc, FirestoreState>(
      builder: (context, state) {
        if (state == Loading()) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: exchanges.length,
          itemBuilder: (BuildContext builderContext, int index) {
            return Container(
              padding: EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 0),
              width: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: exchanges[index].status ? Colors.blueAccent : Colors.red,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      minVerticalPadding: 10,
                      leading: Icon(Icons.album, size: 70),
                      title: Text(exchanges[index].name,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      subtitle: Text(exchanges[index].value.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
