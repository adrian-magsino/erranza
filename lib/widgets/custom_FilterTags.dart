import 'package:flutter/material.dart';

class CustomFilterTags extends StatefulWidget {
  const CustomFilterTags({
    super.key,
    required this.tagsCollection,
    required this.filterChanged,
    required this.selectedTagIndex,
    required this.tagSelected,
    });

    final List<String> tagsCollection;
    final VoidCallback filterChanged;
    final int selectedTagIndex;
    final ValueChanged<int> tagSelected;
   
  @override
  State<CustomFilterTags> createState() => _CustomFilterTagsState();
}

class _CustomFilterTagsState extends State<CustomFilterTags> {
  

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 8.0,
        children: List<Widget>.generate(widget.tagsCollection.length, (int index) {
          return ChoiceChip(
            label: Text(widget.tagsCollection[index]), 
            selected: widget.selectedTagIndex == index,
            onSelected: (bool selected) {
              setState(() {
                widget.tagSelected(index);
              });
            },
            );
        }).toList()
      ),
    );
  }

}