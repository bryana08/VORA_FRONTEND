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
            // Header
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
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.directions_car_outlined, color: AppColors.navy, size: 16),
                        SizedBox(width: 4),
                        Text('Mode Chauffeur', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy)),
                        Icon(Icons.expand_more, size: 16, color: AppColors.navy),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bandeau covoiturage en cours
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(AppRadius.pill)),
                child: Row(
                  children: const [
                    Icon(Icons.local_taxi, color: Colors.white, size: 16),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text('COURSE COVOITURAGE EN COURS  —  3/4 Places Occupées',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

            // Carte (placeholder avec 3 arrêts numérotés)
            Container(
              height: 210,
              width: double.infinity,
              color: const Color(0xFFEDEEEA),
              child: Stack(
                children: [
                  const Center(child: Icon(Icons.route_outlined, size: 56, color: Color(0xFFC7CCC8))),
                  Positioned(top: 16, left: 16, child: _RoutePin(number: '1', label: 'Carrefour EMIA')),
                  Positioned(top: 60, left: 130, child: _RoutePin(number: '2', label: 'Pharmacie du Soleil')),
                  Positioned(top: 16, right: 16, child: _RoutePin(number: '3', label: 'Marché Mokolo', flag: true)),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: const BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2)))),
                      const SizedBox(height: AppSpacing.md),

                      // Arrêt actuel
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A2420),
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          border: Border.all(color: AppColors.green.withOpacity(0.4)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30, height: 30,
                              decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
                              child: const Center(child: Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ARRÊT 1/3 :  Déposer Marie N.',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5)),
                                  const SizedBox(height: 4),
                                  Row(children: const [
                                    Icon(Icons.location_on, color: Colors.white54, size: 12),
                                    SizedBox(width: 4),
                                    Text('Lieu : Carrefour EMIA', style: TextStyle(color: Colors.white70, fontSize: 11.5)),
                                  ]),
                                  Row(children: const [
                                    Icon(Icons.swap_horiz, color: Colors.white54, size: 12),
                                    SizedBox(width: 4),
                                    Text('Paiement : 500 XAF (Séquestre MoMo)', style: TextStyle(color: Colors.white70, fontSize: 11.5)),
                                  ]),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                const CircleAvatar(radius: 16, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green, size: 16)),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(AppRadius.pill)),
                                  child: const Text('En cours', style: TextStyle(color: Colors.white, fontSize: 9)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: ouvrir la saisie du code ticket -> valider via ride_service.dart
                          },
                          icon: const Icon(Icons.lock_open, color: Colors.white, size: 18),
                          label: const Text('Saisir le Code Ticket de Marie à l\'Arrivée',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Prochaines étapes (fond clair)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.md)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Prochaines étapes', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                            const SizedBox(height: AppSpacing.sm),
                            _NextStop(number: '2', title: 'Déposer Marc T.', place: 'Pharmacie du Soleil', eta: '6 min', distance: '1,2 km'),
                            const Divider(height: 20),
                            _NextStop(number: '3', title: 'Déposer Jean B.', place: 'Marché Mokolo', eta: '12 min', distance: '3,8 km'),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(color: const Color(0xFF1A2420), borderRadius: BorderRadius.circular(AppRadius.md)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: const [
                                    Icon(Icons.lock, color: AppColors.green, size: 16),
                                    SizedBox(width: 6),
                                    Expanded(child: Text('Gains totaux de cette course :', style: TextStyle(color: Colors.white70, fontSize: 10.5))),
                                  ]),
                                  const SizedBox(height: 4),
                                  const Text('1 500 XAF', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(color: const Color(0xFF1A2420), borderRadius: BorderRadius.circular(AppRadius.md)),
                              child: Row(
                                children: [
                                  const Icon(Icons.attach_money, color: Colors.white70, size: 18),
                                  const SizedBox(width: 6),
                                  const Expanded(
                                    child: Text('Paiement en espèces (si le passager le choisit)',
                                        style: TextStyle(color: Colors.white70, fontSize: 9.5)),
                                  ),
                                  Switch(value: true, activeColor: AppColors.green, onChanged: (_) {}),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // TODO: déclencher l'alerte SOS -> POST /sos
                              },
                              icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
                              label: const Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.danger,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                // TODO: ouvrir la navigation GPS externe
                              },
                              icon: const Icon(Icons.map_outlined, color: AppColors.green, size: 18),
                              label: const Text('Optimiser l\'itinéraire (GPS)', style: TextStyle(color: AppColors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.green),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                              ),
                            ),
                          ),
                        ],
                      ),
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

class _RoutePin extends StatelessWidget {
  final String number;
  final String label;
  final bool flag;
  const _RoutePin({required this.number, required this.label, this.flag = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 26, height: 26,
          decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
          child: Center(
            child: flag
                ? const Icon(Icons.flag, color: Colors.white, size: 14)
                : Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.sm)),
          child: Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.navy)),
        ),
      ],
    );
  }
}

class _NextStop extends StatelessWidget {
  final String number;
  final String title;
  final String place;
  final String eta;
  final String distance;
  const _NextStop({required this.number, required this.title, required this.place, required this.eta, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 26, height: 26,
          decoration: const BoxDecoration(color: Color(0xFFDDE1DE), shape: BoxShape.circle),
          child: Center(child: Text(number, style: const TextStyle(color: AppColors.navy, fontWeight: FontWeight.bold, fontSize: 12))),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Arrêt $number :  $title', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
              Row(children: [
                const Icon(Icons.location_on_outlined, size: 12, color: AppColors.muted),
                const SizedBox(width: 4),
                Text(place, style: const TextStyle(fontSize: 11, color: AppColors.muted)),
              ]),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(children: [
              const Icon(Icons.access_time, size: 12, color: AppColors.muted),
              const SizedBox(width: 4),
              Text('Dans $eta', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.navy)),
            ]),
            Text('($distance)', style: const TextStyle(fontSize: 10, color: AppColors.muted)),
          ],
        ),
        const Icon(Icons.chevron_right, color: AppColors.muted, size: 18),
      ],
    );
  }
}
