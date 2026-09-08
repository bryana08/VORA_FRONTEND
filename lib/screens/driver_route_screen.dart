import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class DriverRouteScreen extends StatelessWidget {
  const DriverRouteScreen({super.key});

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
                  const Icon(Icons.menu, color: AppColors.navy),
                  const SizedBox(width: AppSpacing.sm),
                  const VoraLogo(size: 30),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.pill), border: Border.all(color: AppColors.border)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: const [
                      Icon(Icons.directions_car_outlined, color: AppColors.navy, size: 16),
                      SizedBox(width: 4),
                      Text('Mode Chauffeur', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy)),
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(AppRadius.pill)),
                child: Row(children: const [
                  Icon(Icons.local_taxi, color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Expanded(child: Text('COURSE COVOITURAGE EN COURS — 3/4 Places', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11))),
                ]),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Container(
              height: 190, width: double.infinity, color: const Color(0xFFEDEEEA),
              child: const Center(child: Icon(Icons.route_outlined, size: 56, color: Color(0xFFC7CCC8))),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: const BoxDecoration(color: AppColors.dark, borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(color: const Color(0xFF1A2420), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.green.withOpacity(0.4))),
                        child: Row(children: [
                          Container(width: 30, height: 30, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle), child: const Center(child: Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                            Text('ARRÊT 1/3 :  Déposer Marie N.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5)),
                            SizedBox(height: 4),
                            Text('Lieu : Carrefour EMIA', style: TextStyle(color: Colors.white70, fontSize: 11.5)),
                            Text('Paiement : 500 XAF (Séquestre)', style: TextStyle(color: Colors.white70, fontSize: 11.5)),
                          ])),
                        ]),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.lock_open, color: Colors.white, size: 18),
                          label: const Text("Saisir le Code Ticket de Marie", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.md)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Prochaines étapes', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                            const SizedBox(height: AppSpacing.sm),
                            _NextStop(number: '2', title: 'Déposer Marc T.', place: 'Pharmacie du Soleil', eta: '6 min'),
                            const Divider(height: 20),
                            _NextStop(number: '3', title: 'Déposer Jean B.', place: 'Marché Mokolo', eta: '12 min'),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(color: const Color(0xFF1A2420), borderRadius: BorderRadius.circular(AppRadius.md)),
                        child: Row(children: const [
                          Icon(Icons.lock, color: AppColors.green, size: 16),
                          SizedBox(width: 6),
                          Expanded(child: Text('Gains totaux de cette course :', style: TextStyle(color: Colors.white70, fontSize: 10.5))),
                          Text('1 500 XAF', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Row(children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
                            label: const Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.map_outlined, color: AppColors.green, size: 18),
                            label: const Text("Optimiser l'itinéraire", style: TextStyle(color: AppColors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                            style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.green), padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextStop extends StatelessWidget {
  final String number;
  final String title;
  final String place;
  final String eta;
  const _NextStop({required this.number, required this.title, required this.place, required this.eta});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(width: 26, height: 26, decoration: const BoxDecoration(color: Color(0xFFDDE1DE), shape: BoxShape.circle), child: Center(child: Text(number, style: const TextStyle(color: AppColors.navy, fontWeight: FontWeight.bold, fontSize: 12)))),
      const SizedBox(width: AppSpacing.sm),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Arrêt $number :  $title', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
        Text(place, style: const TextStyle(fontSize: 11, color: AppColors.muted)),
      ])),
      Text('Dans $eta', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.navy)),
    ]);
  }
}
