import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';

class PortfolioData {
  static PersonalInfo personalInfo = PersonalInfo(
    name: "MOHD ASLAM KHAN",
    title: "Flutter Developer",
    tagline: "Crafting Beautiful Cross-Platform Mobile Applications",
    bio: "Flutter Developer experienced in scalable mobile app development using Dart, Provider/GetX, REST APIs, Firebase, and backend integration. Strong in UI/UX, clean architecture, debugging, and delivering stable production applications.",
    location: "Hyderabad, India",
    phone: "+91 81493 33474",
    email: "aslamyakubkhan@gmail.com",
    portfolioUrl: "https://aslamkhan.vercel.app",
    githubUrl: "https://github.com/imaslamkhan",
    linkedinUrl: "https://linkedin.com/in/aslamkhan", // Placeholder
    profileImageUrl: "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg", // Placeholder professional photo
  );

  static List<Experience> experiences = [
    Experience(
      role: "Mobile Developer – Flutter",
      company: "Levitica Technologies",
      duration: "2025 – Present",
      location: "Hyderabad",
      isCurrentRole: true,
      responsibilities: [
        "Built cross-platform Flutter apps with responsive UI & optimized performance",
        "Integrated REST APIs, authentication, and Provider/GetX state management",
        "Implemented Firebase features, Cloudinary media workflows & Render deployment",
        "Improved app stability with debugging, API testing & code optimization",
      ],
    ),
    Experience(
      role: "Flutter Developer",
      company: "AIYRAT Reco-Path Solutions",
      duration: "2024 – 2025",
      location: "Remote",
      responsibilities: [
        "Developed Flutter apps with role-based authentication & real-time updates",
        "Integrated Node.js APIs & optimized backend workflows",
      ],
    ),
    Experience(
      role: "Full Stack Intern",
      company: "SyncSAS Technologies",
      duration: "2024",
      location: "Remote",
      responsibilities: [
        "Assisted in mobile/web development & improved REST API integrations",
      ],
    ),
    Experience(
      role: "Intern",
      company: "Qaswa Technologies",
      duration: "2020",
      location: "Remote",
      responsibilities: [
        "Created responsive pages using HTML, CSS, JavaScript",
      ],
    ),
  ];

  static List<Project> projects = [
    Project(
      title: "Hostel Management App",
      description: "Comprehensive workflow automation for hostel operations including onboarding, room allocation, payments, and staff management.",
      technology: "Flutter",
      features: [
        "Student onboarding automation",
        "Room allocation system",
        "Payment processing integration",
        "Staff management dashboard",
        "Provider state management",
        "Cloudinary media uploads",
        "REST API integration",
      ],
      techStack: ["Flutter", "Dart", "Provider", "REST APIs", "Cloudinary", "Render"],
      imageUrl: "https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg",
      githubUrl: "https://github.com/imaslamkhan/hostel-management",
    ),
    Project(
      title: "Yard Management App",
      description: "Vehicle tracking system with entry/exit logging, admin dashboards, and comprehensive media handling.",
      technology: "Flutter",
      features: [
        "Vehicle entry/exit logs",
        "Real-time tracking",
        "Admin dashboard",
        "Cloudinary media handling",
        "Report generation",
        "Multi-role access control",
      ],
      techStack: ["Flutter", "Dart", "Firebase", "Cloudinary", "REST APIs"],
      imageUrl: "https://images.pexels.com/photos/1125774/pexels-photo-1125774.jpeg",
      githubUrl: "https://github.com/imaslamkhan/yard-management",
    ),
    Project(
      title: "Women Safety App",
      description: "Emergency response application with SOS alerts, GPS tracking, and automated SMS notifications for women's safety.",
      technology: "Android",
      features: [
        "SOS alert system",
        "GPS location tracking",
        "Emergency SMS notifications",
        "Contact management",
        "Quick emergency dial",
        "Location sharing",
      ],
      techStack: ["Android", "Java", "GPS", "SMS API", "Google Maps"],
      imageUrl: "https://images.pexels.com/photos/1252869/pexels-photo-1252869.jpeg",
      githubUrl: "https://github.com/imaslamkhan/women-safety-app",
    ),
  ];

  static List<Skill> skills = [
    // Languages
    Skill(name: "Dart", proficiency: 0.95, category: "Languages", color: const Color(0xFF0175C2)),
    Skill(name: "Java", proficiency: 0.85, category: "Languages", color: const Color(0xFFED8B00)),
    Skill(name: "SQL", proficiency: 0.80, category: "Languages", color: const Color(0xFF336791)),
    Skill(name: "JavaScript", proficiency: 0.75, category: "Languages", color: const Color(0xFFF7DF1E)),
    
    // Frameworks
    Skill(name: "Flutter", proficiency: 0.95, category: "Frameworks", color: const Color(0xFF02569B)),
    Skill(name: "React.js", proficiency: 0.70, category: "Frameworks", color: const Color(0xFF61DAFB)),
    
    // State Management
    Skill(name: "Provider", proficiency: 0.90, category: "State Management", color: const Color(0xFF2196F3)),
    Skill(name: "GetX", proficiency: 0.85, category: "State Management", color: const Color(0xFF9C27B0)),
    
    // Backend
    Skill(name: "Node.js", proficiency: 0.80, category: "Backend", color: const Color(0xFF339933)),
    Skill(name: "Express.js", proficiency: 0.75, category: "Backend", color: const Color(0xFF000000)),
    Skill(name: "REST APIs", proficiency: 0.90, category: "Backend", color: const Color(0xFFFF6B35)),
    
    // Databases
    Skill(name: "MongoDB", proficiency: 0.80, category: "Databases", color: const Color(0xFF47A248)),
    Skill(name: "MySQL", proficiency: 0.75, category: "Databases", color: const Color(0xFF4479A1)),
    
    // Tools
    Skill(name: "Git", proficiency: 0.85, category: "Tools", color: const Color(0xFFF05032)),
    Skill(name: "Postman", proficiency: 0.90, category: "Tools", color: const Color(0xFFFF6C37)),
    Skill(name: "Firebase", proficiency: 0.85, category: "Tools", color: const Color(0xFFFFCA28)),
    Skill(name: "Cloudinary", proficiency: 0.80, category: "Tools", color: const Color(0xFF3448C5)),
  ];

  static List<Education> educations = [
    Education(
      degree: "B.Tech Computer Science Engineering",
      institution: "GH Raisoni University",
      duration: "2021 – 2024",
      grade: "8.2 CGPA",
      description: "Comprehensive computer science education focusing on software development, algorithms, and system design.",
    ),
    Education(
      degree: "Diploma in Computer Science",
      institution: "Anjuman Polytechnic",
      duration: "2018 – 2021",
      grade: "82.29%",
      description: "Foundation in computer science fundamentals, programming languages, and software development practices.",
    ),
  ];
}