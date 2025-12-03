import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final personalInfo = PortfolioData.personalInfo;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side - Name and tagline
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    personalInfo.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    personalInfo.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
              
              // Right side - Social links
              Row(
                children: [
                  _buildFooterSocialButton(
                    icon: FontAwesomeIcons.github,
                    onTap: () => _launchURL(personalInfo.githubUrl),
                  ),
                  _buildFooterSocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    onTap: () => _launchURL(personalInfo.linkedinUrl),
                  ),
                  _buildFooterSocialButton(
                    icon: FontAwesomeIcons.envelope,
                    onTap: () => _launchURL('mailto:${personalInfo.email}'),
                  ),
                  _buildFooterSocialButton(
                    icon: FontAwesomeIcons.globe,
                    onTap: () => _launchURL(personalInfo.portfolioUrl),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          
          // Divider
          Divider(
            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.2),
          ),
          
          const SizedBox(height: 20),
          
          // Bottom row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2025 ${personalInfo.name}. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
                    ),
              ),
              
              Text(
                'Built with Flutter 💙',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSocialButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FaIcon(
            icon,
            size: 16,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}