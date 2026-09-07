import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class CancelRideScreen extends StatefulWidget {
  const CancelRideScreen({super.key});

  @override
  State<CancelRideScreen> createState() => _CancelRideScreenState();
}

class _CancelRideScreenState extends State<CancelRideScreen> {
  String selectedReason = "Changement d'avis";
  final otherController = TextEditingController();

  final reasons = [
    "Changement d'avis",
    "Temps d'attente trop long",
    "Erreur de destination",
    "Problème personnel",
    "Chauffeur ne se présente pas",
    "Autre motif",
  ];

  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.maybePop(context),
                    icon: const Icon(Icons.arrow_back, color: AppColors.navy),
                  ),
                  const Spacer(),
                  const VoraLogo(size: 32),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              const Text('Annuler la course',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: 4),
              const Text('Vous pouvez annuler la course avant le départ du chauffeur.',
                  style: TextStyle(fontSize: 13, color: AppColors.muted)),
              const SizedBox(height: AppSpacing.md),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDECEC),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.error, color: AppColors.danger, size: 20),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        "Les frais d'annulation peuvent s'appliquer selon le moment de l'annulation.",
                        style: TextStyle(color: AppColors.danger, fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              const Text("Choisissez le motif d'annulation",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: AppSpacing.sm),

              ...reasons.map(
                (r) => RadioListTile<String>(
                  value: r,
                  groupValue: selectedReason,
                  onChanged: (v) => setState(() => selectedReason = v!),
                  activeColor: AppColors.green,
                  contentPadding: EdgeInsets.zero,
                  title: Text(r, style: const TextStyle(fontSize: 14, color: AppColors.navy)),
                ),
              ),

              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: otherController,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: 'Précisez le motif (optionnel)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6E5),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.info, color: Color(0xFFE0A500), size: 20),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('À savoir',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF8A6200))),
                          Text(
                            "Si la course n'a pas encore commencé, votre paiement séquestré sera intégralement remboursé sur votre compte MoMo.",
                            style: TextStyle(fontSize: 12, color: Color(0xFF8A6200), height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.greenLight,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.shield, color: AppColors.green, size: 20),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vos fonds sont en sécurité',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.greenDark)),
                          Text(
                            "Aucun montant ne sera débité en cas d'annulation avant le début de la course.",
                            style: TextStyle(fontSize: 12, color: AppColors.greenDark, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: appeler ride_service.dart -> POST /rides/{id}/cancel
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                  ),
                  child: const Text("Confirmer l'annulation",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.maybePop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.border),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                  ),
                  child: const Text('Retour',
                      style: TextStyle(color: AppColors.navy, fontSize: 16, fontWeight: FontWeight.bold)),
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
