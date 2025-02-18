import 'package:flutter/material.dart';

// My home page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Contact functions
  List<String> _contactName = [];
  List<String> _contactNumber = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  _addContact() {
    if (_nameController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      print(_numberController);
      print(_nameController);
      setState(() {
        _contactName.add(_nameController.text);
        _contactNumber.add(_numberController.text);
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
        title: Text(
          'Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content:
            Text('Are you sure for Delete?', style: TextStyle(fontSize: 15)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.no_sim_outlined,
              color: Colors.blue,
            ),
          ),
          TextButton(
            onPressed: () {
              _deleteContact(index);
              Navigator.pop(context);
            },
            child: Icon(
              Icons.delete_outline_outlined,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  _deleteContact(int index) {
    setState(() {
      _contactName.removeAt(index);
      _contactNumber.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    //form key
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    //task

    return Scaffold(
        /////////////////// App Bar
        appBar: AppBar(
          title: Text(
            'Contact List',
            style: TextStyle(fontSize: 20),
          ),
        ),

        /////////////////// Body
        body: Column(
          children: [
            SizedBox(height: 5),

            /////////////////// Form Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'Enter Your Phone Number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            !RegExp(r'^01[3-9][0-9]{8}$').hasMatch(value)) {
                          return 'Enter a valid 11-digit number starting with 01[3-9]';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addContact();
                        } else {}
                      },
                      //_addContact,
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),

            /////////////////// List Tile
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  itemCount: _contactName.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          surfaceTintColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              size: 38,
                              color: Colors.brown,
                            ),
                            title: Text(
                              _contactName[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                            subtitle: Text(_contactNumber[index]),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.phone,
                                color: Colors.blueAccent,
                              ),
                            ),
                            onLongPress: () => _confirmDelete(index),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 0, bottom: 0),
                          child: Divider(
                            color: Colors.grey.shade500, // Customize the color
                            thickness: 1, // Customize the thickness
                            height: 1, // Reduce space between tiles
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

//01877777777
//01745777777
