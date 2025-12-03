import 'package:flutter/material.dart';

class PersonalInfo {
  final String name;
  final String title;
  final String tagline;
  final String bio;
  final String location;
  final String phone;
  final String email;
  final String portfolioUrl;
  final String githubUrl;
  final String linkedinUrl;
  final String profileImageUrl;

  PersonalInfo({
    required this.name,
    required this.title,
    required this.tagline,
    required this.bio,
    required this.location,
    required this.phone,
    required this.email,
    required this.portfolioUrl,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.profileImageUrl,
  });
}

class Experience {
  final String role;
  final String company;
  final String duration;
  final String location;
  final List<String> responsibilities;
  final bool isCurrentRole;

  Experience({
    required this.role,
    required this.company,
    required this.duration,
    required this.location,
    required this.responsibilities,
    this.isCurrentRole = false,
  });
}

class Project {
  final String title;
  final String description;
  final String technology;
  final List<String> features;
  final String? githubUrl;
  final String? liveUrl;
  final String imageUrl;
  final List<String> techStack;

  Project({
    required this.title,
    required this.description,
    required this.technology,
    required this.features,
    this.githubUrl,
    this.liveUrl,
    required this.imageUrl,
    required this.techStack,
  });
}

class Skill {
  final String name;
  final double proficiency; // 0.0 to 1.0
  final String category;
  final Color color;

  Skill({
    required this.name,
    required this.proficiency,
    required this.category,
    required this.color,
  });
}

class Education {
  final String degree;
  final String institution;
  final String duration;
  final String grade;
  final String description;

  Education({
    required this.degree,
    required this.institution,
    required this.duration,
    required this.grade,
    required this.description,
  });
}