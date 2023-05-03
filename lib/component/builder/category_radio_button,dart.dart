import 'package:flutter/material.dart';



class CustomRadioButtonRow extends StatefulWidget {
   const CustomRadioButtonRow({super.key});
  @override
  State<CustomRadioButtonRow> createState() => CustomRadioButtonRowState();
}
class CustomRadioButtonRowState extends State<CustomRadioButtonRow> {

  String selectedLabel = '';
  int selectedValue = 0;

  void saveSelectedDropDown(){
    final selectedPlace = selectedLabel;
    print('seleted catagory : $selectedPlace');
  }

  Widget labeledRadioButton({required String label, required int value}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          Radio<int>(
            value: value,
            groupValue: selectedValue,
            onChanged: (int? newValue) {
              setState(() {
                selectedValue = newValue!;
                selectedLabel = label;
              });
              print(selectedValue);
              print(selectedLabel);
            },
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        labeledRadioButton(label: '어플리케이션', value: 1),
        Expanded(
          flex: 1,
          child: labeledRadioButton(label: '온라인', value: 2),
        ),
        labeledRadioButton(label: '오프라인', value: 3),
      ],
    );
  }
}
