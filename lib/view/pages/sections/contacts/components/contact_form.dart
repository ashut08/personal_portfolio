import 'package:flutter/material.dart';
import 'package:personal_portfolio/controller/send_email_controller.dart';
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
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _name,
              style: TextStyle(
                color: themProvider.lightTheme ? Colors.black : Colors.white,
              ),
              validator: (value) {
                if (value == "" && value!.isEmpty) {
                  return "Please Enter Name";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter Your Name...",
                hintStyle: TextStyle(
                    color:
                        themProvider.lightTheme ? Colors.black : Colors.white),
                border: InputBorder.none,
                filled: true,
                fillColor: themProvider.lightTheme
                    ? Colors.grey[200]
                    : Colors.grey[800],
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            size10,
            TextFormField(
              controller: _email,
              style: TextStyle(
                color: themProvider.lightTheme ? Colors.black : Colors.white,
              ),
              validator: (value) {
                if (value == "" && value!.isEmpty) {
                  return "Please Enter Email";
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(_email.text)) {
                  return "Please Provide valid email";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter Your Email...",
                hintStyle: TextStyle(
                    color:
                        themProvider.lightTheme ? Colors.black : Colors.white),
                border: InputBorder.none,
                filled: true,
                fillColor: themProvider.lightTheme
                    ? Colors.grey[200]
                    : Colors.grey[800],
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            size10,
            TextFormField(
              // maxLength: null,
              maxLines: null,
              minLines: null,
              // expands: true,
              controller: _message,
              style: TextStyle(
                color: themProvider.lightTheme ? Colors.black : Colors.white,
              ),
              validator: (val) {
                if (val!.isEmpty || val == "") {
                  return "Please Enter Message";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter Your Message...",
                hintStyle: TextStyle(
                    color:
                        themProvider.lightTheme ? Colors.black : Colors.white),
                border: InputBorder.none,
                filled: true,
                fillColor: themProvider.lightTheme
                    ? Colors.grey[200]
                    : Colors.grey[800],
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            size10,
            buildSendMessageButton(context, _formKey)
          ],
        ),
      ),
    );
  }

  buildSendMessageButton(BuildContext context, GlobalKey<FormState> key) {
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
      onTap: () async {
        if (key.currentState!.validate()) {
          try {
            setState(() {
              isLoading = true;
            });

            final data = await SenEmail.sendEmail(
                name: _name.text, email: _email.text, message: _message.text);
            if (data.statusCode == 200) {
              setState(() {
                isLoading = false;
              });

              _name.clear();
              _email.clear();
              _message.clear(); // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Message Sent")));
            } else if (data.statusCode >= 400) {
              setState(() {
                isLoading = false;
              });
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red, content: Text(data.body)));
            }
          } catch (e) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red, content: Text(e.toString())));
          }
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
        child: Text(
          !isLoading ? "Send Message" : "Sending..",
          style: TextStyle(
              color: !isHover
                  ? kPrimaryColor
                  : themProv.lightTheme
                      ? Colors.black
                      : Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
