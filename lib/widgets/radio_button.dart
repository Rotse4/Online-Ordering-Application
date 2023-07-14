import 'package:flutter/material.dart';

import 'drop_down.dart';

enum SelectValues {StationPick, deliver}

class RadioSelect extends StatefulWidget {
  const RadioSelect({super.key});
  

  @override
  State<RadioSelect> createState() => _RadioSelectState();
}

class _RadioSelectState extends State<RadioSelect> {
  SelectValues? _character=SelectValues.StationPick;
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 320,
              padding: EdgeInsets.symmetric(horizontal: 20, ),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("     Shipping  Method", style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                     RadioListTile(
                        title: Text("Pick from our Food Caffee"),
                        subtitle: Text("Zimmerm Hub"),
                        value: SelectValues.StationPick, groupValue: _character, onChanged: (value){
                          setState(() {
                            _character=value;
                          });
              
                      }),
                        RadioListTile(
                        title: Text("Deliver To"),
                        subtitle: Text("Areas around Kasarani"),
                        value: SelectValues.deliver, groupValue: _character, onChanged: (value){
                          setState(() {
                            _character=value;
                          });
              
                      }),
                      Dropdown()
                  ],
                ),
              ),
            );
  }
}