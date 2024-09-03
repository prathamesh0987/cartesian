import 'package:cartesian/screens/categories.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  var ipController = TextEditingController(text: '192.168.0.1');
  var portController = TextEditingController(text: '502');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Connect to PLC'),
              TextFormField(
                controller: ipController,
              ),
              TextFormField(
                controller: portController,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    print(
                        "ip: ${ipController.text}, Port: ${portController.text}");
                    // await ModbusCommunication.establishConnection(
                    //     ipController.text, int.parse(portController.text));
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Connected to PLC',
                        ),
                      ),
                    );

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Categories(),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Failed due to: $e',
                        ),
                      ),
                    );

                    print('Failed due to: $e');
                  }
                },
                child: const Text(
                  'Connect',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
