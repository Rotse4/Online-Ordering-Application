import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> list = <String>['Zimmerman', 'Sunton', 'Roysambu', 'Hunters'];
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.047,
          width: double.maxFinite,
          margin: EdgeInsets.only(left: 20,right: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 247, 222, 186),
          ),
          
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 0,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  // width:MediaQuery.of(context).size.width*0.7,
                  child: Text(value)),
              );
            }).toList(),
          ),
        ),
        Container(
          // color: Colors.blue,
          width: double.maxFinite,
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.only(left:20, right: 20, bottom: 10, top: 10),
          child: TextField(
            minLines: 2,
            maxLines: 2,
           decoration: InputDecoration(
             hintText:"Specify exact location"
           ),
          )
        )
      ],
    );
  }
}
