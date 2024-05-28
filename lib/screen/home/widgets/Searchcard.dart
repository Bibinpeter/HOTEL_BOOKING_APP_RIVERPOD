
import 'package:flutter/material.dart';
import 'package:hotel/screen/home/pages/searchlottie.dart';
import 'package:hotel/screen/home/widgets/CustomElevated.dart';
import 'package:hotel/screen/home/widgets/customtextfield.dart';
import 'package:intl/intl.dart';
class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final locationTextcontroller = TextEditingController();
    final dateFromTextcontroller = TextEditingController(); 
    final dateToTextcontroller = TextEditingController();
    locationTextcontroller.text = 'kochi';
    dateFromTextcontroller.text = dateToTextcontroller.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 239, 239),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300.withAlpha(50)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 10),
              CustomTextField(
                label: "Where",
                controller: locationTextcontroller,
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Icon(Icons.calendar_month),
              const SizedBox(width: 10),
              CustomTextField(
                label: "FROM", 
                controller: dateFromTextcontroller,
              ),
              CustomTextField(
                label: "TO",
                controller: dateToTextcontroller,
              ),   
            ],
          ),
          SizedBox(
              width: 200,
              child: CustomElevatedButton(text: "Search",color: const Color.fromARGB(255, 238, 188, 38),
                fontSize: 16.0,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Searchlottie(),));
                }
              ))
        ],
      ),
    );
  }
}
