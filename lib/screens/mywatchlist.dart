import 'package:flutter/material.dart';

import 'package:counter_7/drawer.dart';
import 'package:counter_7/screens/mywatchlist_detail.dart';
import 'package:counter_7/services/fetchwatchlist.dart';


class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  State<WatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
            future: fetchWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => 
                      Container(
                        margin: const EdgeInsets.only(top:8.0, bottom:8.0, right: 8.0, left:9),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WatchListDetail(
                                            data: snapshot.data![index].fields)),
                                  );
                                },
                                
                                title: Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Column(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.all(
                                              snapshot.data![index].fields.watched !=
                                                    null &&
                                                snapshot.data![index]
                                                        .fields
                                                        ?.watched ==
                                                    true
                                            ? Colors.green
                                            : Color.fromARGB(255, 222, 42, 29)),
                                      value: snapshot.data![index].fields.watched,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          snapshot.data![index].fields.watched =
                                              value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                
                              ),
                            ],
                          ),
                        ),
                      ),
                  );
                
              }
            }));
  }
}