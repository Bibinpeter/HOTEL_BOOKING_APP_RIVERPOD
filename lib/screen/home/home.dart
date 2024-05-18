import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel/screen/home/widgets/CustomElevated.dart';
import 'package:hotel/screen/home/widgets/CustomIcon.dart';
import 'package:hotel/screen/home/widgets/customtextfield.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: Size.height * 0.25),
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _Headersection(),
                  _SearchCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Headersection extends StatelessWidget {
  const _Headersection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/photo.png"),
            ),
            const Spacer(),
            CustomIconWidget(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
        Text(
          "Welcome back 👋",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final locationTextcontroller = TextEditingController();
    final dateFromTextcontroller = TextEditingController();
    final dateToTextcontroller = TextEditingController();
    locationTextcontroller.text = 'Singapore';
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
                label: "From",
                controller: dateFromTextcontroller,
              ),
              CustomTextField(
                label: "To",
                controller: dateToTextcontroller,
              ),
            ],
          ),
          SizedBox(
              width: 200,
              child: CustomElevatedButton(text: "Search",color: const Color.fromARGB(255, 238, 188, 38),
                fontSize: 16.0,
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
