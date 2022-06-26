import 'package:personal_portfolio/models/service_model.dart';

class ServiceUtils {
  static List<ServiceModel> serviceUtils = [
    ServiceModel(
      serviceName: "Web Development",
      serviceDescription:
          "Build web app using flutter and react.js.\n Provide end to end service from building to deploying.",
      serviceImage: "assets/sitemap-solid.svg",
    ),
    ServiceModel(
      serviceName: "Mobile Development",
      serviceDescription:
          "Build mobile apps using flutter. \n Provide end-to-end development services for mobile apps for Android as well as iOS platforms.",
      serviceImage: "assets/mobile-alt-solid.svg",
    ),
    ServiceModel(
      serviceName: "Rapid Development",
      serviceDescription:
          "Provide Working  MVP of the products.\n Quick and working prototype ",
      serviceImage: "assets/rapid_development.svg",
    ),
    ServiceModel(
      serviceName: "UI/UX Design",
      serviceDescription:
          "Full range of web and mobile app design services.\n from prototyping and graphic design to pixel-perfect UI.",
      serviceImage: "assets/palette-solid.svg",
    ),
    ServiceModel(
      serviceName: "Open Source",
      serviceDescription:
          "Well documentation.\n Well written README.md files.\n ",
      serviceImage: "assets/code-solid.svg",
    ),
    ServiceModel(
      serviceName: "Technical Blogger",
      serviceDescription:
          "SEO friendly blog. \n Write technical blogs on Medium\n Grammatical error-free blogs.",
      serviceImage: "assets/pencil-solid.svg",
    ),
  ];
}
