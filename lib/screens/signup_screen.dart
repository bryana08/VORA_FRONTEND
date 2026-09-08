import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';
import 'profile_choice_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.md),
                const Center(child: VoraLogo(size: 56)),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(child: Container(height: 4, decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(2)))),
                    const SizedBox(width: 6),
                    Expanded(child: Container(height: 4, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)))),
                    const SizedBox(width: 6),
                    Expanded(child: Container(height: 4, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                IconButton(padding: EdgeInsets.zero, onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back, color: AppColors.navy)),
                const SizedBox(height: AppSpacing.sm),
                const Text('Créer un compte Passager', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.navy)),
                const SizedBox(height: AppSpacing.sm),
                const Text('Rejoignez VORA et voyagez en toute sécurité.', style: TextStyle(fontSize: 14, color: AppColors.muted)),
                const SizedBox(height: AppSpacing.xl),
                const Text('Nom complet', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Entrez votre nom complet',
                    prefixIcon: const Icon(Icons.person_outline, color: AppColors.green),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.md), borderSide: const BorderSide(color: AppColors.border)),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                const Text('Numéro de téléphone (+237)', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Ex : 6 78 12 34 56',
                    prefixIcon: const Icon(Icons.phone_outlined, color: AppColors.green),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.md), borderSide: const BorderSide(color: AppColors.border)),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Row(
                  children: [
                    const Icon(Icons.shield_outlined, color: AppColors.green, size: 22),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Vos données et transactions sont protégées', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
                          Text('VORA utilise un chiffrement de bout en bout.', style: TextStyle(fontSize: 12, color: AppColors.muted)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileChoiceScreen()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Créer mon compte', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
