class AboutUtils {
  static const String aboutMeHeadline = 'I\'m Ashutosh Singh.';

  static const String aboutMeDetail =
      'I am a programmer and designer of websites and mobile applications with more than two years of experience, as I possess the skill, creativity and innovation in my field of work, and this is what makes me distinguished from others and people love to deal with me';

  static const String email = "ashusingh.unch8@gmail.com";
  static const String dob = "08-09-1998";
  static const String addreess = "Raebareli, India-229401";
  static const String name = "Ashutosh Singh";

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
