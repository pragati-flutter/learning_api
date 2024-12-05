import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<String> states = ['UttarPradesh', 'Maharashtra', 'Gujarat'];

  ///state selected value
  String? yoursValue;

  /// district selected value
  String? myValue;
  List<String> UttarPradesh = ['Maharajah', 'Gorakhpur', 'Srinagar'];
  List<String> Gujarat = ['Ahemdabad', 'Amethi', 'Pakistan'];
  List<String> Maharastra = ['America', 'London', 'paris'];
  List<String> district = [];

  Widget districtMenu(String? selectedValue) {
    debugPrint("...selected state -> $selectedValue");
    // myValue = null;
    if (selectedValue == "UttarPradesh") {
      setState(() {
        district = UttarPradesh;
      });
    } else if (selectedValue == "Gujarat") {
      setState(() {
        district = Gujarat;
      });
    } else {
      setState(() {
        district = Maharastra;
      });
    }

    debugPrint("...district -> $district");
    if (district.isNotEmpty) {
      myValue = district[0];
      return DropdownButton(
          value: myValue,
          hint: const Text("baby select our district"),
          items: district.map((element) {
            return DropdownMenuItem(value: element, child: Text(element));
          }).toList(),
          onChanged: (value) {
            setState(() {
              myValue = value;
            });
            print("value is  $value");
          });
    } else {
      return const Text("Failed to set district");
    }
  }

  Widget col(String? selectedValue) {
    if (selectedValue == null) {
      return const Column(
        children: [Text("select your state")],
      );
    } else {
      return districtMenu(yoursValue);
    }
  }

  Column col2(String? selectedValue) {
    if (selectedValue == null) {
      return const Column(
        children: [
          Text("............."),
        ],
      );
    } else {
      return Column(
        children: [
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          child: Text(
                              "State is: $yoursValue,district is: $myValue"));
                    });
              },
              child: const Text("Save"))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const SizedBox(
          child: Text("hello droppy"),
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton(
              value: yoursValue,
              hint: const Text("hey jaana select our state"),
              items: states.map((element) {
                return DropdownMenuItem(value: element, child: Text(element));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  yoursValue = value;
                });

                print("value-> $value");
                print("selected value is ${yoursValue ?? 0} rs");
              },
            ),
            //  districtMenu(selectedValue!),

            col(yoursValue),
            col2(myValue),
          ],
        ),
      ),
    );
  }
}
