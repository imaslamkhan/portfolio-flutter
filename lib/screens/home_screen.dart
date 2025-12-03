import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/education_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  bool _isDarkMode = false;
  String _currentSection = 'home';

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _fadeController.forward();
    
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Update current section based on scroll position
    final scrollPosition = _scrollController.offset;
    // Implementation for section highlighting would go here
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case 'home':
        targetKey = _heroKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'experience':
        targetKey = _experienceKey;
        break;
      case 'projects':
        targetKey = _projectsKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'education':
        targetKey = _educationKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        body: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              controller: _scrollController,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    // Hero Section
                    Container(
                      key: _heroKey,
                      child: const HeroSection(),
                    ),
                    
                    // About Section
                    Container(
                      key: _aboutKey,
                      child: const AboutSection(),
                    ),
                    
                    // Experience Section
                    Container(
                      key: _experienceKey,
                      child: const ExperienceSection(),
                    ),
                    
                    // Projects Section
                    Container(
                      key: _projectsKey,
                      child: const ProjectsSection(),
                    ),
                    
                    // Skills Section
                    Container(
                      key: _skillsKey,
                      child: const SkillsSection(),
                    ),
                    
                    // Education Section
                    Container(
                      key: _educationKey,
                      child: const EducationSection(),
                    ),
                    
                    // Contact Section
                    Container(
                      key: _contactKey,
                      child: const ContactSection(),
                    ),
                    
                    // Footer
                    const FooterSection(),
                  ],
                ),
              ),
            ),
            
            // Sticky Navigation
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomNavigationBar(
                currentSection: _currentSection,
                onSectionTap: _scrollToSection,
                onThemeToggle: _toggleTheme,
                isDarkMode: _isDarkMode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}