import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widget%20management/close.dart';

class ToDoCard extends StatefulWidget {
  ToDoCard({super.key});
  _ToDoCard createState() => new _ToDoCard();
}

class _ToDoCard extends State<ToDoCard> {
  int ClosingCount = 0;

  @override
  Widget build(BuildContext context) {
    final closeButton = Provider.of<Close>(context, listen: false);
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding:
          const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 200, 167, 239).withOpacity(1),
                Color.fromARGB(255, 153, 95, 219).withOpacity(0.5)
              ])),
      child: const Stack(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "What you want to done!",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          // Positioned(
          //     right: 0.0,
          //     top: 0.0,
          //     child: IconButton(
          //         onPressed: () {
          //           closeButton.setCount();
          //         },
          //         icon: const Icon(Icons.close_rounded))),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  "Priority : ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Image(
                  image: AssetImage('assets/icons/rating.png'),
                  height: 18.0,
                  width: 18.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
