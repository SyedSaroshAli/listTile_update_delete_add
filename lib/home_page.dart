import 'package:flutter/material.dart';
import 'package:list_tile_uni/book_model.dart';
import 'package:list_tile_uni/widgets/tile_widget.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController writerController = TextEditingController();
   TextEditingController subjectController = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                title: Text('Add new book'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Writer name'),
                    TextField(
                      controller: writerController,
                    ),
                    
                    SizedBox(height: 10,),
                    Text('Subject'),
                    TextField(
                      controller: subjectController,
                    )
                  ],
                ),

                actions: [
                  GestureDetector(
                    onTap: (){
                      print('1');

                      if(writerController.text!=''&&subjectController.text!=''){
                         bookDetails.add({
                        'author' : writerController.text.toString(),
                        'subject' : subjectController.text.toString()
                      });
                      
                      
                      setState(() {
                        
                      });

                      Navigator.pop(context);
                      }

                      if(writerController.text==''&&subjectController.text==''){
                       Navigator.pop(context);
                      }


                    },
                    child: Text('Add',
                    style: TextStyle(
                      color: Colors.blue,
                    ),),
                  )
                ],
              );
            });
        },
        child: Icon(Icons.add),),
      body: Column(
        children: [
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i=0; i<bookDetails.length; i++)
                  BookTiles(
                    author: bookDetails[i]['author'],
                    subject: bookDetails[i]['subject'],
                    index: i,
                    onDelete: (){
                      setState(() {
                        bookDetails.removeAt(i);
                      });
                    },

                     onUpdate: (newAuthor, newSubject) {
                        setState(() {
                          bookDetails[i]['author'] = newAuthor;
                          bookDetails[i]['subject'] = newSubject;
                        });
                      },
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
