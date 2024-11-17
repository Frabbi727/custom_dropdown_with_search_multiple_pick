import 'package:flutter/material.dart';


void showGenericListDialog<T>({
  required BuildContext context,
  required String dialogTitle,
  required List<T> itemList,
  required String Function(T) getItemName,
  T? selectedItem,
  void Function(T)? onItemSelected,
  void Function(List<T>)? onMultipleItemsSelected,
  bool showSearch = true,
  bool multipleChoice = false,
}) {
  final TextEditingController searchController = TextEditingController();
  List<T> filteredList = List.from(itemList);
  List<T> selectedItems = [];

  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredList = List.from(itemList);
    } else {
      filteredList = itemList
          .where((item) =>
          getItemName(item).toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text(dialogTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showSearch)
                  TextFormField (
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (query) {
                      setState(() {
                        filterSearch(query);
                      });
                    },
                  ),
                const SizedBox(height: 10),
                Flexible(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final item = filteredList[index];
                        final isSelected = selectedItems.contains(item);
                        return ListTile(
                          title: Text(getItemName(item)),
                          trailing: multipleChoice
                              ? Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedItems.add(item);
                                } else {
                                  selectedItems.remove(item);
                                }
                              });
                              onMultipleItemsSelected?.call(selectedItems);
                            },
                          )
                              : null,
                          onTap: !multipleChoice
                              ? () {
                            onItemSelected?.call(item);
                            Navigator.of(context).pop();
                          }
                              : null,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              if (multipleChoice)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done'),
                ),
            ],
          );
        },
      );
    },
  );
}




