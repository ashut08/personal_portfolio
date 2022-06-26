import 'package:personal_portfolio/models/projects_model.dart';

class ProjectUtils {
  List<ProjectModel> listOfProject = [
    ProjectModel(
        projectImage: "assets/projects/SportShare.png",
        description:
            "SportShare\nSportShare is a sport specific social media app which aims to improve connectivity for anyone involved in sport. SportShare brings athletes and sports professionals closer together by making it easier to connect with professionals.",
        projectIcon: "assets/projects/sportshare_logo.png",
        link: "https://www.sportshare.co.uk/"),
    ProjectModel(
        projectImage: "assets/projects/trailweasel.png",
        description:
            "TrailWeasel\nShow your friends your city with self created online tours",
        projectIcon: "assets/projects/trail_weasel.png",
        link: "https://play.google.com/store/apps/details?id=com.trailweasel"),
    ProjectModel(
        projectImage: "assets/projects/directreunion.png",
        description:
            "Direct Reunion\nWith the Direct Réunion mobile application, watch the weather and the traffic situation on the roads in Réunion in real time. We broadcast the main public cameras on the island, and are also gradually developing our own network of cameras.",
        projectIcon: "assets/projects/direct_log.png",
        link: "https://directreunion.com/"),
    ProjectModel(
        projectImage: "assets/projects/instanews.png",
        description:
            "InstaNews\n A simple news application made with open source api, having bookmarks, search, and share functionality.",
        projectIcon: "assets/projects/insta_logo.jpg",
        link: "https://github.com/ashut08/instanews"),
    ProjectModel(
        projectImage: "assets/projects/cicd.png",
        description:
            "CI/CD pipelines\nIn this is project deploy jenkins server in docker container and build fully automate CI/CD pipeline using docker ,jenkins and git.",
        projectIcon: "assets/projects/cicd_logo.png",
        link:
            "https://medium.com/swlh/ci-cd-using-docker-jenkins-and-git-d034c1d5e371"),
  ];
}
