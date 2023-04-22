import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/homeslider.dart';


class genreresult extends StatefulWidget {
  final Future genrefuture;
  final genrestring;
  const genreresult({required this.genrefuture,required this.genrestring,Key? key}) : super(key: key);

  @override
  State<genreresult> createState() => _genreresultState();
}

class _genreresultState extends State<genreresult> {

  bool isGrid=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      title: Text('${widget.genrestring}'),
        actions: [ IconButton(
            onPressed: (){
              setState(() {
                isGrid=!isGrid;
              });
            },
            icon:Icon(isGrid?Icons.list:Icons.grid_view,color:Colors.white,)
        )],
      ),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:
            [
              // SizedBox(height: 10,),

              Container(child:isGrid?futuregrid(widget.genrefuture):futurelistview(widget.genrefuture),)
            ],
          ),
        ),
      ),




    );
  }
}
