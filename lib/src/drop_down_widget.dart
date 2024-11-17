import 'package:flutter/material.dart';


class DropDownWidget extends StatelessWidget{

  final String title;
  final String? hintTitle;
  final Function() onTap;
  final bool isRequired;
  final double? topPadding;


  const DropDownWidget(this.title, this.onTap, {this.hintTitle,super.key,this.isRequired=false, this.topPadding = 20});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: topPadding ?? 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                title,
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis, // This will add "..." if text overflows
                maxLines: 1, // Limits text to two lines
              ),
            ),
            isRequired?const Text("*",style: TextStyle(color: Colors.red),):const SizedBox()
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(8),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color:Colors.black,width: 1)
            ),
            child:  Row(
              children: [
                Expanded(child: Text(hintTitle??"Select", overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 14,color: Colors.black),)),
                const Icon(Icons.arrow_drop_down_sharp,color:Colors.black,)
              ],
            ),
          ),
        )
      ],
    );
  }

}