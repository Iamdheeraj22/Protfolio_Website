import 'package:mysite/app/sections/experience/model/experience_model.dart';

class ExperienceUtils {
  List<ExperienceModel> experiences = [
    ExperienceModel(
      jobRole: 'Associate Mobile Developer',
      jobType: 'Full-time',
      companyName: 'Elsner Technologies, Ahmedabad',
      companyLogo:
          'https://our.umbraco.com/media/upload/9989acc0-dd97-4f4d-bfd8-965d825cd339/dotsquares.jpg',
      startDate: 'Apr 2025',
      endDate: 'Present',
      isCurrentJob: true,
      jobDescription: [
        'Implemented CI/CD pipelines to automate build processes, accelerating release delivery and improving deployment reliability.',
        'Optimized Flutter app performance by resolving Android 14/15 compatibility issues and reducing PDF load time by 50% using background isolation techniques.',
        'Contributed to HRMS application development, implementing multi-role management and reporting hierarchy functionalities.',
        'Trained and mentored Flutter interns, conducting live demo sessions and practical workshops to strengthen hands-on development skills'
      ],
    ),
    ExperienceModel(
      jobRole: 'Associate Mobile Developer',
      jobType: 'Full-time',
      companyName: 'Dotsquares Technologies, Jaipur',
      companyLogo:
          'https://our.umbraco.com/media/upload/9989acc0-dd97-4f4d-bfd8-965d825cd339/dotsquares.jpg',
      startDate: 'Jan 2023',
      endDate: 'June 2024',
      isCurrentJob: false,
      jobDescription: [
        'Designed and implemented user-friendly interfaces with efficient state management using BLoC architecture.',
        'Integrated Firebase for real-time data management and seamless app functionality.',
        'Developed advanced features like biometric authentication, geolocation, and Google Maps integration.',
        'Implemented push notifications and secure online payment options for enhanced user experience.'
      ],
    ),
    ExperienceModel(
      jobRole: 'Mobile Developer',
      jobType: 'Full-time',
      companyName: 'Quadtrics Solutions, Mohali',
      companyLogo: 'http://via.placeholder.com/200x150',
      startDate: 'March 2022',
      endDate: 'Oct 2022',
      isCurrentJob: false,
      jobDescription: [
        'Worked on multiple apps for clients in industries.',
        'Extensively used VCS to maintain the changes and help recoveries.',
        'Developed multiple applications and settled up UI Screens, Navigations, and Business logic.',
        'Worked closely with the design and development team using agile methodologies.',
        'Worked on integration of different third-party open-source APIs.',
      ],
    ),
    ExperienceModel(
      jobRole: 'Android Developer - Intern',
      jobType: 'Full-time',
      companyName: 'Quadtrics Solutions, Mohali',
      companyLogo: 'http://via.placeholder.com/200x150',
      startDate: 'Sept 2021',
      endDate: 'March 2022',
      isCurrentJob: false,
      jobDescription: [
        'Developed and maintained Android applications, ensuring smooth performance and user-friendly interfaces.',
        'Assisted in debugging and resolving issues, improving app stability and user experience.',
        'Collaborated with the design team to implement UI/UX designs accurately.',
        'Conducted testing and implemented feedback to enhance app functionality.',
        'Learned and applied best practices in mobile development, including coding standards and version control.'
      ],
    ),
  ];
}
