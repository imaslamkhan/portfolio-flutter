import 'package:flutter/material.dart';
import 'package:portfolio_aslam_khan/models/portfolio_models.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../data/portfolio_data.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
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
    final experiences = PortfolioData.experiences;
    
    return VisibilityDetector(
      key: const Key('experience-section'),
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
                    'Professional Experience',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 60),
            
            // Timeline
            SizedBox(
              width: double.infinity,
              child: AnimationLimiter(
                child: Column(
                  children: experiences.asMap().entries.map((entry) {
                    final index = entry.key;
                    final experience = entry.value;
                    
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 800),
                      child: SlideAnimation(
                        horizontalOffset: index.isEven ? -50.0 : 50.0,
                        child: FadeInAnimation(
                          child: _buildTimelineItem(experience, index),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(Experience experience, int index) {
    final isEven = index.isEven;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left side content (for even indexes)
            if (isEven) ...[
              Expanded(
                child: _buildExperienceCard(experience),
              ),
              const SizedBox(width: 20),
            ] else ...[
              const Expanded(child: SizedBox()),
              const SizedBox(width: 20),
            ],
            
            // Timeline line and dot
            Column(
              children: [
                // Timeline dot
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: experience.isCurrentRole 
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.6),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: experience.isCurrentRole
                      ? const Icon(
                          Icons.work,
                          size: 12,
                          color: Colors.white,
                        )
                      : null,
                ),
                
                // Timeline line (except for last item)
                if (index < PortfolioData.experiences.length - 1)
                  Container(
                    width: 2,
                    height: 80,
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
              ],
            ),
            
            // Right side content (for odd indexes)
            if (!isEven) ...[
              const SizedBox(width: 20),
              Expanded(
                child: _buildExperienceCard(experience),
              ),
            ] else ...[
              const SizedBox(width: 20),
              const Expanded(child: SizedBox()),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(Experience experience) {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Role and Current Badge
            Row(
              children: [
                Expanded(
                  child: Text(
                    experience.role,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                if (experience.isCurrentRole)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Current',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Company and Duration
            Text(
              '${experience.company} • ${experience.duration}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            
            const SizedBox(height: 4),
            
            Text(
              experience.location,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
            ),
            
            const SizedBox(height: 16),
            
            // Responsibilities
            Column(
              children: experience.responsibilities.map((responsibility) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          responsibility,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}