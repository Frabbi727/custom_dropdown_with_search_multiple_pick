import 'package:flutter/material.dart';

import 'drop_down_widget.dart';
import 'generic_dialog.dart';
import '../custom_drop_down/model.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late List<TypeOfOrganization> selectedOrganizationList = [];
  final List<TypeOfOrganization> typeOfOrganizationList = [
    TypeOfOrganization(
      id: '1',
      name: 'Tech Innovators Inc',
      email: 'contact@techinnovators.com',
      phone: '+1234567890',
      address: '123 Tech Blvd, Silicon Valley',
    ),
    TypeOfOrganization(
      id: '2',
      name: 'Green Solutions Ltd',
      email: 'info@greensolutions.com',
      phone: '+1987654321',
      address: '789 Eco Park, Green City',
    ),
    TypeOfOrganization(
      id: '3',
      name: 'EduLearn Academy',
      email: 'support@edulearnacademy.com',
      phone: '+1123456789',
      address: '101 Learning Ave, Education City',
    ),
    TypeOfOrganization(
      id: '4',
      name: 'HealthFirst Clinic',
      email: 'appointments@healthfirst.com',
      phone: '+1145678901',
      address: '456 Wellness Rd, Health Town',
    ),
    TypeOfOrganization(
      id: '5',
      name: 'NextGen Robotics',
      email: 'sales@nextgenrobotics.com',
      phone: '+1654321987',
      address: '202 Innovation Way, Robot City',
    ),
    TypeOfOrganization(
      id: '6',
      name: 'Future Energy Corp',
      email: 'hello@futureenergy.com',
      phone: '+1748392011',
      address: '333 Solar St, Energy Valley',
    ),
    TypeOfOrganization(
      id: '7',
      name: 'Bright Minds Tutoring',
      email: 'info@brightminds.com',
      phone: '+1239874560',
      address: '99 Scholar Lane, Tutoring Hub',
    ),
    TypeOfOrganization(
      id: '8',
      name: 'Culinary Arts Center',
      email: 'chef@culinaryarts.com',
      phone: '+1478523690',
      address: '654 Gourmet Ave, Food City',
    ),
    TypeOfOrganization(
      id: '9',
      name: 'Apex Financial Group',
      email: 'services@apexfinancial.com',
      phone: '+1928374650',
      address: '808 Finance Rd, Money Town',
    ),
    TypeOfOrganization(
      id: '10',
      name: 'Creative Designs Studio',
      email: 'contact@creativedesigns.com',
      phone: '+1597534862',
      address: '404 Artistry St, Design City',
    ),
  ];

  TypeOfOrganization selectedType = TypeOfOrganization();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          DropDownWidget(
            'SINGLE OBJECT SELECT ',
            () {
              FocusScope.of(context).requestFocus(FocusNode());

              if (typeOfOrganizationList.isNotEmpty) {
                showGenericListDialog(
                  showSearch: true,
                  context: context,
                  dialogTitle: 'TYPE OF ORGANIZATION',
                  itemList: typeOfOrganizationList,
                  getItemName: (TypeOfOrganization type) => type.name ?? "",
                 /// FOR SINGLE OBJECT SELECT UNCOMMENT THIS
                  selectedItem: selectedType,
                  onItemSelected: (TypeOfOrganization type) {
                    print("This selected item ${type}");
                    setState(() {
                      selectedType = type;
                    });
                  },

                  /// FOR MULTIPLE OBJECT UNCOMMENT THIS AND COMMENT THE SINGLE PORTION

              /*    multipleChoice: true,
                  onMultipleItemsSelected:
                      (List<TypeOfOrganization> selectedItems) {
                    selectedOrganizationList = selectedItems;
                    debugPrint("Selected  object: $selectedItems");
                    debugPrint("LIST OF OBJECT: ${selectedOrganizationList.length}");
                    debugPrint(
                        "Selected objects: ${selectedItems.map((e) => e.name).toList()}");
                  },*/
                );
              }
            },
            hintTitle: selectedOrganizationList.isNotEmpty
                ? selectedOrganizationList.map((e) => e.name).join(', ')
                : selectedType.name ?? "TYPE OF ORGANIZATION",
            isRequired: true,
          ),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}
