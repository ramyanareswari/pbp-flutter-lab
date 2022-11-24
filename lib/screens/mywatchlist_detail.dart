import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:counter_7/drawer.dart';

class WatchListDetail extends StatefulWidget {
  WatchListDetail({super.key, this.data});
  var data;
  @override
  State<WatchListDetail> createState() => _WatchDetailPageState();
}

class _WatchDetailPageState extends State<WatchListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                // back button
                CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Text(
                      '${widget.data.title}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                  )),
                const SizedBox(height: 15),
                Container(
                  child: RichText(
                    text: TextSpan(
                    text: 'Release Date: ',
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                    TextSpan(
                      text: DateFormat("MMM dd, y").format(widget.data.releaseDate),
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          ),
                    ),
                    ],
                  ),
                  )
                ),
                SizedBox(height: 5),

                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Rating: ',
                          style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
            
                        ),
                        Text(
                          '${widget.data.rating}',
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          'Rating: ',
                          style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
            
                        ),
  
                        Text(
                          widget.data.watched ? "Watched" : "Not watched",
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),
                        )
                      ]
                      
                    ),
                    SizedBox(height: 5),
                    RichText(
                    text: TextSpan(
                      text: 'Review: ',
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.data.review}',
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
              
              ],
            ),
            
        ),
    );
  }
}