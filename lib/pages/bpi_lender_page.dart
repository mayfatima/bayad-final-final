import 'package:bayad/pages/create_transaction_page.dart';
import 'package:flutter/material.dart';

class BPILenderPage extends StatelessWidget {
  const BPILenderPage({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Detail for BPI')),
      body:
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            TextButton(
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: 
                  (context) => CreateTransaction()),
                );
              },
              child: const Text('Create Transaction'),
            )
          ],
        ),
      ),
    );
  }
}