import 'package:flutter/material.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:provider/provider.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool isHover = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textField('Name', _name, context),
        size10,
        textField('Email', _email, context),
        size10,
        textField('Message', _message, context),
        size10,
        buildSendMessageButton(context)
      ],
    );
  }

  textField(String hintMessage, TextEditingController controller,
      BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      //  height: hintMessage == "Message" ? 500 : null,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: themProvider.lightTheme ? Colors.black : Colors.white,
        ),
        decoration: InputDecoration(
            hintText: hintMessage,
            hintStyle: TextStyle(
                color: themProvider.lightTheme ? Colors.black : Colors.white),
            border: InputBorder.none,
            filled: true,
            fillColor:
                themProvider.lightTheme ? Colors.grey[200] : Colors.grey[800]),
      ),
    );
  }

  buildSendMessageButton(BuildContext context) {
    final themProv = Provider.of<ThemeProvider>(context);
    return InkWell(
      onHover: (value) {
        if (value) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isHover
                ? kPrimaryColor
                : !themProv.lightTheme
                    ? Colors.black
                    : Colors.white,
            border: Border.all(color: kPrimaryColor)),
        child: const Text(
          "Send Message",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
