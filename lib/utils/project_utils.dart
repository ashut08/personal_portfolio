import 'package:personal_portfolio/models/projects_model.dart';

class ProjectUtils {
  List<ProjectModel> listOfProject = [
    ProjectModel(
        projectImage: "assets/projects/SportShare.png",
        description: "sportshare",
        link: "https://www.sportshare.co.uk/"),
    ProjectModel(
        projectImage: "assets/projects/trailweasel.png",
        description: "Trail Weasel",
        link: "https://www.trailweasel.com/"),
    ProjectModel(
        projectImage: "assets/projects/directreunion.png",
        description: "Direct Reunion",
        link: "https://directreunion.com/"),
    ProjectModel(
        projectImage: "assets/projects/instanews.png",
        description: "InstaNews",
        link: "https://github.com/ashut08/instanews"),
    ProjectModel(
        projectImage: "assets/projects/cicd.png",
        description: "CI/CD pipelines",
        link:
            "https://medium.com/swlh/ci-cd-using-docker-jenkins-and-git-d034c1d5e371"),
  ];
}
