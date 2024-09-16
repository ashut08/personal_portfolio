class AboutUtils {
  static const String aboutMeHeadline = 'I\'m Ashutosh Singh.';

  static const String aboutMeDetail =
      '''As a passionate Mobile App Developer, I bring a blend of creativity and technical precision to mobile app development. My journey has equipped me with a deep understanding of cross-platform technologies and a commitment to delivering apps that not only perform flawlessly but also provide exceptional user experiences.I thrive in dynamic, collaborative environments where innovation is key. If you have a project idea, I’m here to help you bring it to life with cutting-edge technology and a strategic approach.''';

  static const String email = "ashusingh.unch8@gmail.com";
  static const String dob = "08-09-1998";
  static const String addreess = "Gurugram,India -  122002  ";
  static const String name = "Ashutosh Singh";
  static const String mobileNo = "+916393675500,+917309453580";

  static const String resumeurl =
      "https://drive.google.com/file/d/1FNcd3KABxfJzhm_lu3UO86pZNmXS8u_j/view?usp=sharing";
  int ageCalculate(String input) {
    DateTime dateTime = DateTime(
      int.parse(input.substring(6)),
      int.parse(input.substring(3, 5)),
      int.parse(input.substring(0, 2)),
    );
    return DateTime.fromMillisecondsSinceEpoch(
                DateTime.now().difference(dateTime).inMilliseconds)
            .year -
        1970;
  }
}
