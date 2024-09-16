import 'package:AshuTech/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/controller/send_email_controller.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:provider/provider.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _name,
                    style: Theme.of(context).textTheme.labelMedium,
                    validator: (value) {
                      if (value == "" && value!.isEmpty) {
                        return "Please Enter Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Your Name...",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: const Color(0xff6A6868)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: themProvider.lightTheme
                          ? Colors.grey[200]
                          : Colors.grey[800],
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2,
                            color: themProvider.lightTheme
                                ? Colors.black
                                : Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2,
                            color: themProvider.lightTheme
                                ? Colors.black
                                : Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2,
                            color: themProvider.lightTheme
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _email,
                    style: TextStyle(
                      color:
                          themProvider.lightTheme ? Colors.black : Colors.white,
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
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: const Color(0xff6A6868)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: themProvider.lightTheme
                          ? Colors.grey[200]
                          : Colors.grey[800],
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2,
                            color: themProvider.lightTheme
                                ? Colors.black
                                : Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2,
                            color: themProvider.lightTheme
                                ? Colors.black
                                : Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2,
                            color: themProvider.lightTheme
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            size10,
            size10,
            size10,
            SizedBox(
              height: 100,
              child: TextFormField(
                // maxLength: null,
                maxLines: 100,
                minLines: 4,
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
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: const Color(0xff6A6868)),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: themProvider.lightTheme
                      ? Colors.grey[200]
                      : Colors.grey[800],
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: themProvider.lightTheme
                            ? Colors.black
                            : Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: themProvider.lightTheme
                            ? Colors.black
                            : Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: themProvider.lightTheme
                            ? Colors.black
                            : Colors.white),
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
              // ignore: use_build_context_synchronously
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
      child: Center(
        child: Container(
          width: 200,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 15, right: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: primaryGradientColor,
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(50)),
          child: Text(
            !isLoading ? "Send Message" : "Sending..",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
