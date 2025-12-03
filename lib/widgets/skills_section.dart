import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Map<String, List<Skill>> _groupSkillsByCategory() {
    final Map<String, List<Skill>> groupedSkills = {};
    
    for (final skill in PortfolioData.skills) {
      if (!groupedSkills.containsKey(skill.category)) {
        groupedSkills[skill.category] = [];
      }
      groupedSkills[skill.category]!.add(skill);
    }
    
    return groupedSkills;
  }

  @override
  Widget build(BuildContext context) {
    final groupedSkills = _groupSkillsByCategory();
    
    return VisibilityDetector(
      key: const Key('skills-section'),
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
                    'Skills & Technologies',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 60),
            
            // Skills Categories
            AnimationLimiter(
              child: Column(
                children: groupedSkills.entries.map((entry) {
                  final category = entry.key;
                  final skills = entry.value;
                  final index = groupedSkills.keys.toList().indexOf(category);
                  
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 800),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: _buildSkillCategory(category, skills),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(String category, List<Skill> skills) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Title
              Text(
                category,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              
              const SizedBox(height: 24),
              
              // Skills Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 4 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return _buildSkillItem(skills[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillItem(Skill skill) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Skill Name and Icon
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: skill.color,
                    shape: BoxShape.circle,
                  ),
                ),
                
                const SizedBox(width: 8),
                
                Expanded(
                  child: Text(
                    skill.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                
                Text(
                  '${(skill.proficiency * 100).round()}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: skill.color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: _isVisible ? skill.proficiency : 0.0,
                backgroundColor: skill.color.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(skill.color),
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}