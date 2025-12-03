import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../data/portfolio_data.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final personalInfo = PortfolioData.personalInfo;
    
    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
          _animationController.forward();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
        child: Column(
          children: [
            // Section Title
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Text(
                    'About Me',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 50),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side - Bio
                Expanded(
                  flex: 2,
                  child: AnimationConfiguration.staggeredList(
                    position: 1,
                    duration: const Duration(milliseconds: 800),
                    child: SlideAnimation(
                      horizontalOffset: -50.0,
                      child: FadeInAnimation(
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Professional Summary',
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                
                                const SizedBox(height: 20),
                                
                                Text(
                                  personalInfo.bio,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        height: 1.8,
                                      ),
                                ),
                                
                                const SizedBox(height: 30),
                                
                                // Key Highlights
                                Text(
                                  'Key Highlights',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                
                                const SizedBox(height: 16),
                                
                                ...[
                                  '✨ Cross-platform mobile app development expertise',
                                  '🚀 Experience with scalable app architecture',
                                  '🔧 Strong in state management and API integration',
                                  '💎 UI/UX focused with clean coding practices',
                                  '🔍 Debugging and performance optimization skills',
                                ].map((highlight) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    highlight,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          height: 1.5,
                                        ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 30),
                
                // Right side - Quick Stats
                Expanded(
                  flex: 1,
                  child: AnimationConfiguration.staggeredList(
                    position: 2,
                    duration: const Duration(milliseconds: 800),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Column(
                          children: [
                            _buildStatCard(
                              '4+',
                              'Years Experience',
                              Icons.work,
                            ),
                            
                            const SizedBox(height: 20),
                            
                            _buildStatCard(
                              '10+',
                              'Projects Completed',
                              Icons.apps,
                            ),
                            
                            const SizedBox(height: 20),
                            
                            _buildStatCard(
                              '8+',
                              'Technologies',
                              Icons.code,
                            ),
                            
                            const SizedBox(height: 30),
                            
                            // Contact Info
                            Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Contact Info',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    
                                    const SizedBox(height: 16),
                                    
                                    _buildContactInfo(Icons.location_on, personalInfo.location),
                                    _buildContactInfo(Icons.phone, personalInfo.phone),
                                    _buildContactInfo(Icons.email, personalInfo.email),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String label, IconData icon) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            
            const SizedBox(height: 12),
            
            Text(
              number,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            
            const SizedBox(height: 4),
            
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
          
          const SizedBox(width: 8),
          
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}