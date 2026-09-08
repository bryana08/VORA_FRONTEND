import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';
import 'home_screen.dart';
import 'driver_signup_screen.dart';

enum VoraProfile { passenger, driver }

class ProfileChoiceScreen extends StatefulWidget {
  const ProfileChoiceScreen({super.key});
  @override
  State<ProfileChoiceScreen> createState() => _ProfileChoiceScreenState();
}

class _ProfileChoiceScreenState extends State<ProfileChoiceScreen> {
  VoraProfile selected = VoraProfile.passenger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.md),
              const VoraLogo(size: 56),
              const SizedBox(height: AppSpacing.lg),
              const Text('Choisissez votre profil', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: AppSpacing.sm),
              const Text('Sélectionnez le profil qui correspond\nà votre activité sur VORA', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: AppColors.muted)),
              const SizedBox(height: AppSpacing.lg),
              _ProfileCard(
                icon: Icons.location_on_outlined,
                title: 'Passager VORA',
                description: 'Commandez, négociez et voyagez en toute sécurité.',
                selected: selected == VoraProfile.passenger,
                onSelect: () => setState(() => selected = VoraProfile.passenger),
              ),
              const SizedBox(height: AppSpacing.md),
              _ProfileCard(
                icon: Icons.directions_car_outlined,
                title: 'Chauffeur VORA',
                description: 'Augmentez vos revenus et sécurisez vos paiements.',
                selected: selected == VoraProfile.driver,
                onSelect: () => setState(() => selected = VoraProfile.driver),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selected == VoraProfile.passenger) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DriverSignupScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Continuer', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onSelect;
  const _ProfileCard({required this.icon, required this.title, required this.description, required this.selected, required this.onSelect});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: selected ? AppColors.green : AppColors.border, width: selected ? 1.5 : 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(width: 48, height: 48, decoration: const BoxDecoration(color: AppColors.greenLight, shape: BoxShape.circle), child: Icon(icon, color: AppColors.green)),
            const Spacer(),
            Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: selected ? AppColors.green : AppColors.border),
          ]),
          const SizedBox(height: AppSpacing.sm),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy)),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 12.5, color: AppColors.muted)),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onSelect,
              style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.green, width: 1.5), padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md))),
              child: const Text('Choisir ce profil', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
