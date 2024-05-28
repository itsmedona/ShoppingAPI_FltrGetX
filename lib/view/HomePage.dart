import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                child: Text(
                  "ShopiFy",
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                ),
                //IconButton(icon:Icon(Icons.view_list_rounded),onPressed:(){}),
                //IconButton(icon:Icon(Icons.grid_view),onPressed:(){})
              ),
            ]),
          ),
          Expanded(
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              //itemCount:1000,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              // itemBuilder(context, index){
              // return Container(
              // height:100,
              //width:100,
              //color:Colors.red
            ),
          ),
        ],
      ),
    );
  }
}
