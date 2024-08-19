import 'package:flutter/material.dart';


class BookTiles extends StatelessWidget {
  
  final author, subject,index,onDelete,onUpdate;
   BookTiles({super.key, this.author, this.subject, this.index, this.onDelete, this.onUpdate});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Icon(Icons.book,color: Colors.white,),
          
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
                Text(author,
                style: TextStyle(
                  color: Colors.white
                ),)
              ],
            ),
          ),
            GestureDetector(
            onTap: () {
              TextEditingController authorController =
                  TextEditingController(text: author);
              TextEditingController subjectController =
                  TextEditingController(text: subject);

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Edit Book"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: authorController,
                          decoration: InputDecoration(labelText: 'Author'),
                        ),
                        TextField(
                          controller: subjectController,
                          decoration: InputDecoration(labelText: 'Subject'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          onUpdate(
                            authorController.text,
                            subjectController.text,
                          );
                          Navigator.pop(context);
                        },
                        child: Text('Update'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(Icons.edit, color: Colors.white),
          ),
         GestureDetector(
          onTap: (){
             
             showDialog(
              context: context, 
              builder: (context){
                return AlertDialog(
                  content: Text('Are you sure you want to delete this book?'),

                  actions: [
                    GestureDetector(
                      onTap: (){
                         onDelete();
                         Navigator.pop(context);
                      },
                      child: Text('Yes')
                      ),
                    GestureDetector(
                      onTap: (){
                 
                         Navigator.pop(context);
                      },
                      child: Text('No'))
                  ],
                );
              });
            
          
          },
          child: Icon(Icons.delete,color: Colors.white,))  ,  
         

        ],
      ),
    );
  }
}