import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});
  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool online = true;
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  const VoraLogo(size: 34),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                    child: const Text('EN LIGNE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.greenDark)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEDEEEA),
                child: const Center(child: Icon(Icons.map_outlined, size: 64, color: Color(0xFFC7CCC8))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: const Text('Zones à forte demande', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            BottomNavigationBar(
              currentIndex: navIndex,
              onTap: (i) => setState(() => navIndex = i),
              selectedItemColor: AppColors.green,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Accueil'),
                BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Carte'),
                BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historique'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
