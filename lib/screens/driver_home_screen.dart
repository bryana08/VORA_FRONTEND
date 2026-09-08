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
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                  child: Row(
                    children: [
                      const VoraLogo(size: 34),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => setState(() => online = !online),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: online ? AppColors.greenLight : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.circle, color: online ? AppColors.green : AppColors.muted, size: 10),
                              const SizedBox(width: 6),
                              Text(online ? 'EN LIGNE' : 'HORS LIGNE',
                                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: online ? AppColors.greenDark : AppColors.muted)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const CircleAvatar(radius: 18, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green, size: 18)),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFEDEEEA),
                        child: const Center(child: Icon(Icons.map_outlined, size: 64, color: Color(0xFFC7CCC8))),
                      ),
                      Positioned(
                        top: 12, left: AppSpacing.lg,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(AppRadius.md),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.wb_sunny_outlined, color: Colors.orange, size: 18),
                              const SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Yaoundé', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
                                  Text('26°C · Ciel couvert', style: TextStyle(fontSize: 10, color: AppColors.muted)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: const BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(width: 40, height: 40, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle), child: const Icon(Icons.bar_chart, color: Colors.white, size: 20)),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('Gains du jour', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                                      Text('8 500 XAF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.navy)),
                                      Text('(12 courses)', style: TextStyle(fontSize: 10, color: AppColors.muted)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(width: 1, height: 44, color: AppColors.border),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Row(
                              children: [
                                Container(width: 40, height: 40, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle), child: const Icon(Icons.account_balance_wallet, color: Colors.white, size: 20)),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('Solde Portefeuille', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                                      Text('1 200 XAF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.navy)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.location_on, color: Colors.white, size: 18),
                          label: const Text('Zones à forte demande', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomNavigationBar(
                  currentIndex: navIndex,
                  onTap: (i) => setState(() => navIndex = i),
                  selectedItemColor: AppColors.green,
                  unselectedItemColor: AppColors.muted,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Accueil'),
                    BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Carte'),
                    BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historique'),
                    BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Portefeuille'),
                    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
                  ],
                ),
              ],
            ),
            Positioned(
              right: AppSpacing.lg,
              bottom: 90,
              child: Container(
                width: 60, height: 60,
                decoration: BoxDecoration(color: AppColors.danger, shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppColors.danger.withOpacity(0.4), blurRadius: 12)]),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications_active, color: Colors.white, size: 18),
                    Text('SOS', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
