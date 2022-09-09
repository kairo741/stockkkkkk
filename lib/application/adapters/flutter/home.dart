import 'package:flutter/material.dart';

import 'package:stockkkkkk/domain/adapters/service/stock_service_impl.dart';
import 'package:stockkkkkk/domain/dto/stockDTO.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StockServiceImpl _stockService = StockServiceImpl();

  final snackBar = SnackBar(
    content: Text('O Produto não pode ser negativo!!!'),
  );

  registerPopUp() {
    var name = "";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cadastrar'),
        content: TextField(
          onChanged: (value) => name = value,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Informar nome'),
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  _stockService.save(StockDTO(null, name, 1));
                  Navigator.pop(context);
                });
              },
              child: Text('Cadastrar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                registerPopUp();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: _stockService.findAll(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();

            List<StockDTO> data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(data[index].name!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              data[index].quantity = data[index].quantity! + 1;
                              _stockService.save(data[index]);
                            },
                          );
                        },
                        icon: Icon(Icons.add),
                      ),
                      Text(
                        data[index].quantity.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              if (data[index].quantity! > 0) {
                                data[index].quantity =
                                    data[index].quantity! - 1;
                                _stockService.save(data[index]);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          );
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
