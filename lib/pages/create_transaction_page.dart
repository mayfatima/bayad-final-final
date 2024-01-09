import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:async';


final _formKey = GlobalKey<FormState>();

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({Key? key}) : super(key: key);

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  TextEditingController _dateController = TextEditingController();
  String? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //Text Field First Name
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter something';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'First Name'
                ),
              ),

              //Text Field Middle Name
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter something';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Middle Name'
                ),
              ),

              //Text Field Last Name
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter something';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Last Name'
                ),
              ),


              // Birth Date
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Birthdate',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                readOnly: true,
                onTap: () => _selectDate(context), // Pass the context
              ),

              //Text Field Age
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter something';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Age'
                ),
              ),


              //Text Field Contact Number
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter something';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Contact Number'
                ),
              ),

              ElevatedButton(
              onPressed: () => _pickImage(context), 
              child: const Text("")),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Great!'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null){
      setState((){
      _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
  
  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null){
    String fileName = basename(pickedFile.path);

    setState(() {
    _pickedImage = fileName;
    
    });
}
}
}