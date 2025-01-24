class ProjectModel {
  final String projectName;
  final String projectDescription;
  final String projectLink;

  ProjectModel({
    required this.projectName,
    required this.projectDescription,
    required this.projectLink,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    projectName: "Portfolio Website",
    projectDescription:
        "The Portfolio Website, built with the Flutter framework, "
        "is a visually appealing and fully responsive platform designed to showcase personal or professional projects."
        " It dynamically adjusts its layout to provide an optimal user experience across devices, including mobile, tablet,"
        " and desktop. With smooth animations, intuitive navigation, and a modern design, the website effectively highlights skills, "
        "achievements, and work in a professional manner.",
    projectLink: "https://github.com/Iamdheeraj22/Protfolio_Website",
  ),
  ProjectModel(
    projectName: "Blog App",
    projectDescription:
        "The Blog App is a feature-rich application built using Flutter and powered by Supabase for backend services. "
        "It offers seamless user authentication and allows users to create, read, and manage blogs efficiently."
        " Blogs are securely stored in Supabase's storage, ensuring reliability and fast access."
        " With an intuitive interface and smooth performance, the app provides a great platform for users to share "
        "and explore content effortlessly.",
    projectLink: "https://github.com/Iamdheeraj22/blog_app",
  ),
  ProjectModel(
    projectName: "WallPaper Hub",
    projectDescription: "Wallpaper Hub is a modern app built with Flutter, "
        "offering a vast collection of high-quality wallpapers across various categories like nature,"
        " abstract, and minimalistic designs. With a smooth and user-friendly interface, users can easily browse,"
        " search, and download wallpapers to personalise their devices. The app ensures fast performance and"
        " regularly updates its content to keep the collection fresh and engaging.",
    projectLink: "https://github.com/Iamdheeraj22/wallpaperhub",
  )
];
