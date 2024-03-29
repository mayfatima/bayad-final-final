import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final _formKey = GlobalKey<FormState>();

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({Key? key}) : super(key: key);

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _otherDateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fatherBDayController = TextEditingController();
  final TextEditingController _emailFatherController = TextEditingController();
  final TextEditingController _spouseBDayController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

  List<String>? _pickedImages;
  List<String>? _pickedBirthCertificate;
  List<String>? _pickedSelfies;
  List<String>? _pickedPoliceClearance;
  bool _isImagePickerActive = false;
  String _selectedGender = 'Female';
  String _selectedMaritalStatus = 'Single';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Information'),
      ),
      body: SizedBox(
        height: 1000, // Height of the app
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  // Text Field First Name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),

                  // Text Field Middle Name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Middle Name',
                    ),
                  ),

                  // Text Field Last Name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
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
                    onTap: () => _selectBirthDate(context),
                  ),

                  // Text Field Age
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Age',
                    ),
                  ),

                  //Gender
                  DropdownButtonFormField<String>(
                      value: _selectedGender,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedGender = newValue!;
                        });
                      },
                      items: const ['Female', 'Male']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(labelText: 'Gender')),

                  // Text Field Contact Number
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Contact Number',
                    ),
                  ),

                  //Input IDs
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Input Valid IDs'),
                          const SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              if (!_isImagePickerActive) {
                                _pickImage(context,
                                    isBirthCertificate: false,
                                    isSelfie: false,
                                    isPoliceClearance: false);
                              }
                            },
                            child: const Row(children: [
                              Icon(Icons.add_a_photo),
                              SizedBox(width: 8.0),
                              Text("Add photos")
                            ]),
                          ),
                        ],
                      ),
                      if (_pickedImages != null && _pickedImages!.isNotEmpty)
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: _pickedImages!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.file(
                                    File(_pickedImages![index]),
                                    height: 300,
                                    width: 300,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _pickedImages!.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            // size: 20.0
                                          )))
                                ]);
                          },
                        ),
                    ],
                  ),

                  //Input birth certificate
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const Text('Input Birth Certificate'),
                          const SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              _pickImage(context,
                                  isBirthCertificate: true,
                                  isSelfie: false,
                                  isPoliceClearance: false);
                            },
                            child: const Row(children: [
                              Icon(Icons.add_a_photo),
                              Text("Add photo")
                            ]),
                          ),
                        ]),
                        if (_pickedBirthCertificate != null &&
                            _pickedBirthCertificate!.isNotEmpty)
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: _pickedBirthCertificate!.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.file(
                                    File(_pickedBirthCertificate![index]),
                                    height: 300,
                                    width: 300,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _pickedBirthCertificate!
                                            .removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                      ]),
                  //Input selfies
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Input selfies'),
                          const SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              if (!_isImagePickerActive) {
                                _pickImage(context,
                                    isBirthCertificate: false,
                                    isSelfie: true,
                                    isPoliceClearance: false);
                              }
                            },
                            child: const Row(children: [
                              Icon(Icons.add_a_photo),
                              Text('Add Photos')
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                  if (_pickedSelfies != null && _pickedSelfies!.isNotEmpty)
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: _pickedSelfies!.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.file(
                              File(_pickedSelfies![index]),
                              height: 300,
                              width: 300,
                              fit: BoxFit.scaleDown,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _pickedSelfies!.removeAt(index);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  //Input police clearance
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Input Police Clearance'),
                          const SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              _pickImage(context,
                                  isBirthCertificate: false,
                                  isSelfie: false,
                                  isPoliceClearance: true);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.add_a_photo),
                                Text('Add photos'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (_pickedPoliceClearance != null &&
                          _pickedPoliceClearance!.isNotEmpty)
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: _pickedPoliceClearance!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.file(
                                  File(_pickedPoliceClearance![index]),
                                  height: 300,
                                  width: 300,
                                  fit: BoxFit.scaleDown,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _pickedPoliceClearance!.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),

//Source of income
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Source of income',
                        ),
                      ),
//Marital Status Dropdown
DropdownButtonFormField<String>(
  value: _selectedMaritalStatus,
  onChanged: (newValue){
    setState((){
      _selectedMaritalStatus = newValue!;

    });
  },
  items: const ['Single','Married']
.map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  ),
  ).toList(),
decoration: const InputDecoration(
  labelText: 'Marital Status'
),
),

if (_selectedMaritalStatus == 'Single')
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    //single specific form fields can be added
//Mother's name
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mother's Name",
      ),
    ),
//Date picker for mothers birthday
    TextField(
      controller: _otherDateController,
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
      onTap: () => _selectDate(context),
    ),
//Email text field
    TextFormField(
      controller: _emailController,
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter your email';
        } else if (!isValidEmail(value)){
          return 'Enter a valid email address';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email'
      ),
    ),
//Work mother
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Work",
      ),
    ),
//Mother's Age
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        labelText: 'Age',
      )
    ),
//Mother's Contact Number
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        labelText: 'Contact Number'
      ),
    ),
//Father's name
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Father's Name",
      ),
    ),
//Father birthdate picker
    TextField(
      controller: _fatherBDayController,
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
      onTap: () => _selectBirthday (context),
    ),
//Father email address
    TextFormField(
      controller: _emailFatherController,
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter your email';
        } else if (!isValidEmail(value)){
          return 'Enter a valid email address';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email'
      ),
    ),
//Father's work
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Work",
      ),
    ),
//Father's Age
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        labelText: 'Age',
      )
    ),
//Father's Contact Number
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        labelText: 'Contact Number',
      )
    ),
  ],
)

else if (_selectedMaritalStatus == 'Married')
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    //Spouse Name
    TextFormField(
       validator: (value){
        if(value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
       },
       decoration: const InputDecoration(
        labelText: 'Spouse Name'
       ),
    ),
    //Spouse Age
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        labelText: 'Age',
      )
    ),
    //Spouse Work
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Work",
      ),
    ),
    //Spouse Birthdate
    TextField(
      controller: _spouseBDayController,
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
      onTap: () => _selectSpouseBday(context),
    ),
    //Contact Number
    TextFormField(
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter something';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        labelText: 'Contact Number',
      )
    ),
    //Spouse Email Address
    TextFormField(
      controller: _emailFatherController,
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Enter your email';
        } else if (!isValidEmail(value)){
          return 'Enter a valid email address';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email'
      ),
    ),
  ],
),

TextFormField(
  controller: _amountController,
  validator: (value){
    if (value == null || value.isEmpty){
      return 'Enter valid amount';
    }
    return null;
  },
  keyboardType: const TextInputType.numberWithOptions(decimal: true),
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
  ],
  decoration: const InputDecoration(
    labelText: 'Amount',
  ),
),

TextFormField(
  controller: _purposeController,
  validator: (value){
    if(value == null || value.isEmpty){
      return 'Enter the purpose of the loan';
    }
    return null;
  },
  maxLength: 300,
  maxLines: 5,
  decoration: const InputDecoration(
    labelText: 'Purpose of Loan',
    counterText: '',
  ),
),



//Submit
                      Center(
                        child: ElevatedButton(
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
                      ),
                    ],
                  ),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }

    bool isValidEmail(String email){
    final emailRegExp = 
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
    }

  Future<void> _selectBirthDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectSpouseBday(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _spouseBDayController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if(_picked != null){
      setState(() {
        _otherDateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectBirthday(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null){
      setState((){
        _fatherBDayController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _pickImage(BuildContext context,
      {required bool isBirthCertificate,
      required bool isSelfie,
      required bool isPoliceClearance}) async {
    setState(() {
      _isImagePickerActive = true;
    });
    final ImagePicker _picker = ImagePicker();
    List<XFile>? pickedFiles = await _picker.pickMultiImage(
      imageQuality: 70,
      maxWidth: 800,
    );

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        if (isBirthCertificate) {
          if (_pickedBirthCertificate == null) {
            _pickedBirthCertificate =
                pickedFiles.map((file) => file.path).toList();
          } else {
            _pickedBirthCertificate!.addAll(pickedFiles
                .map((file) => file.path)
                .take(2 - _pickedBirthCertificate!.length));
          }
        } else if (isSelfie) {
          if (_pickedSelfies == null) {
            _pickedSelfies = pickedFiles.map((file) => file.path).toList();
          } else {
            _pickedSelfies!.addAll(pickedFiles
                .map((file) => file.path)
                .take(2 - _pickedSelfies!.length));
          }
        } else {
          if (_pickedImages == null) {
            _pickedImages = pickedFiles.map((file) => file.path).toList();
          } else {
            _pickedImages!.addAll(pickedFiles
                .map((file) => file.path)
                .take(2 - _pickedImages!.length));
          }
        }
      });
    }

    setState(() {
      _isImagePickerActive = false;
    });
  }
}
