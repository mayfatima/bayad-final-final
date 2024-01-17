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
                    onTap: () => _selectDate(context),
                  ),

                  // Text Field Age
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
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

  Future<void> _selectDate(BuildContext context) async {
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
