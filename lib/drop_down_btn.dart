import 'package:flutter/material.dart';

class DropDownBtn extends StatefulWidget {
  const DropDownBtn({super.key});

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  List<String> couples = [
    "Alok Bharti",
    "Vaishnavi Jaiswal",
    "Shivam",
    "Shalu",
    "Akhand",
    "Billo",
  ];

  List<String> males = [];
  List<String> females = [];
  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Drop down button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            DropdownButton(
              value: selectedValue,
              hint: const Text("Please select a item"),
              items: couples.map((element) {
                return DropdownMenuItem(value: element, child: Text(element));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });

                print("value-> $value");
              },
            ),
            Text(" price ${selectedValue ?? 0} rs")
          ],
        ),
      ),
    );
  }
}
