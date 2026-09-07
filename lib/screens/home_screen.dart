import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  const Icon(Icons.menu, color: AppColors.navy),
                  const Spacer(),
                  const VoraLogo(size: 32),
                  const Spacer(),
                  Stack(
                    children: [
                      const Icon(Icons.notifications_none, color: AppColors.navy),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8, height: 8,
                          decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bannière alerte
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.water_drop_outlined, color: Colors.blueGrey, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text('Pluie - Zone à forte demande',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
                    ),
                    Icon(Icons.bar_chart, color: AppColors.green, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Carte (placeholder pour l'instant)
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEDEEEA),
                child: Stack(
                  children: [
                    const Center(child: Icon(Icons.map_outlined, size: 64, color: Color(0xFFC7CCC8))),
                    Positioned(
                      top: 20, left: 24,
                      child: _MapPin(label: 'Carrefour EMIA'),
                    ),
                    Positioned(
                      bottom: 40, right: 30,
                      child: _MapPin(label: 'Marché Mokolo'),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom sheet : recherche + types de course
            Container(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.sm),
              decoration: const BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
              ),
              child: Column(
                children: [
                  Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Où allez-vous ? (ex: Carrefour EMIA)',
                      prefixIcon: const Icon(Icons.search, color: AppColors.green),
                      suffixIcon: const Icon(Icons.mic_none, color: AppColors.green),
                      filled: true,
                      fillColor: AppColors.bg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: _RideTypeCard(
                          icon: Icons.local_taxi_outlined,
                          title: 'Taxi Covoiturage',
                          subtitle: 'Partagez le trajet et économisez',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: _RideTypeCard(
                          icon: Icons.directions_car_outlined,
                          title: 'Course Privée',
                          subtitle: 'Trajet direct, rien que pour vous',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom nav
            BottomNavigationBar(
              currentIndex: navIndex,
              onTap: (i) => setState(() => navIndex = i),
              selectedItemColor: AppColors.green,
              unselectedItemColor: AppColors.muted,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Accueil'),
                BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'Mes trajets'),
                BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MapPin extends StatelessWidget {
  final String label;
  const _MapPin({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 4)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.location_on, color: AppColors.green, size: 16),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy)),
        ],
      ),
    );
  }
}

class _RideTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _RideTypeCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.navy, size: 28),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy)),
                Text(subtitle, style: const TextStyle(fontSize: 10, color: AppColors.muted)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.muted, size: 18),
        ],
      ),
    );
  }
}
