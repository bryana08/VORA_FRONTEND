import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';
import 'driver_pending_verification_screen.dart';

class DriverSignupScreen extends StatefulWidget {
  const DriverSignupScreen({super.key});
  @override
  State<DriverSignupScreen> createState() => _DriverSignupScreenState();
}

class _DriverSignupScreenState extends State<DriverSignupScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool cniImported = false;
  bool licenseImported = false;
  bool registrationImported = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF0B1410);
    const cardBg = Color(0xFF12211A);
    const fieldBg = Color(0xFF17281F);

    return Scaffold(
      backgroundColor: darkBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  IconButton(padding: EdgeInsets.zero, onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back, color: Colors.white)),
                  const Spacer(),
                  const VoraLogo(size: 30),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.shield, color: AppColors.greenDark, size: 14),
                        SizedBox(width: 4),
                        Text('Sécurisé et fiable', style: TextStyle(color: AppColors.greenDark, fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text.rich(
                TextSpan(
                  text: 'Inscription Chauffeur ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  children: [TextSpan(text: 'VORA', style: TextStyle(color: AppColors.green))],
                ),
              ),
              const SizedBox(height: 4),
              const Text('Rejoignez notre communauté de chauffeurs et conduisez en toute sérénité.', style: TextStyle(fontSize: 13, color: Colors.white60)),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  _StepCircle(number: '1', active: true),
                  Expanded(child: Container(height: 3, color: AppColors.green)),
                  _StepCircle(number: '2', active: false),
                  Expanded(child: Container(height: 3, color: Colors.white24)),
                  _StepCircle(number: '3', active: false),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Étape 1 sur 3', style: TextStyle(color: Colors.white60, fontSize: 12)),
                  Text('33%', style: TextStyle(color: Colors.white60, fontSize: 12)),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(AppRadius.lg)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(width: 30, height: 30, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle), child: const Icon(Icons.person, color: Colors.white, size: 16)),
                        const SizedBox(width: AppSpacing.sm),
                        const Text('Informations personnelles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _DarkField(icon: Icons.person_outline, label: 'Nom complet (comme sur CNI)', hint: 'Ex : M. Njoya Jean Paul', controller: nameController, fieldBg: fieldBg),
                    const SizedBox(height: AppSpacing.sm),
                    _DarkField(icon: Icons.phone_outlined, label: 'Numéro Mobile Money (+237)', hint: 'Ex : 6XX XXX XXX', controller: phoneController, fieldBg: fieldBg, keyboardType: TextInputType.phone),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Container(width: 26, height: 26, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle), child: const Center(child: Text('2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)))),
                  const SizedBox(width: AppSpacing.sm),
                  const Text('Documents à fournir', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const Padding(padding: EdgeInsets.only(left: 34), child: Text('Veuillez importer les documents ci-dessous.', style: TextStyle(color: Colors.white54, fontSize: 12))),
              const SizedBox(height: AppSpacing.md),
              _DocumentTile(label: 'Photo CNI (Recto/Verso)', sublabel: "Carte nationale d'identité", imported: cniImported, cardBg: cardBg, onImport: () => setState(() => cniImported = true)),
              const SizedBox(height: AppSpacing.sm),
              _DocumentTile(label: 'Permis de conduire', sublabel: 'En cours de validité', imported: licenseImported, cardBg: cardBg, onImport: () => setState(() => licenseImported = true)),
              const SizedBox(height: AppSpacing.sm),
              _DocumentTile(label: 'Immatriculation du Véhicule', sublabel: "Carte grise ou certificat", imported: registrationImported, cardBg: cardBg, onImport: () => setState(() => registrationImported = true)),
              const SizedBox(height: AppSpacing.md),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(AppRadius.md)),
                child: Row(
                  children: const [
                    Icon(Icons.shield_outlined, color: AppColors.green, size: 18),
                    SizedBox(width: 8),
                    Expanded(child: Text('Vos documents sont vérifiés manuellement par nos équipes pour garantir la sécurité des passagers.', style: TextStyle(fontSize: 11.5, color: Colors.white60, height: 1.4))),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: (cniImported && licenseImported && registrationImported)
                      ? () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverPendingVerificationScreen()));
                        }
                      : null,
                  icon: const Icon(Icons.send, color: Colors.white, size: 18),
                  label: const Text('Soumettre pour Vérification', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, disabledBackgroundColor: AppColors.green.withOpacity(0.35), padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
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

class _StepCircle extends StatelessWidget {
  final String number;
  final bool active;
  const _StepCircle({required this.number, required this.active});
  @override
  Widget build(BuildContext context) {
    return Container(width: 30, height: 30, decoration: BoxDecoration(color: active ? AppColors.green : Colors.white12, shape: BoxShape.circle), child: Center(child: Text(number, style: TextStyle(color: active ? Colors.white : Colors.white38, fontWeight: FontWeight.bold))));
  }
}

class _DarkField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hint;
  final TextEditingController controller;
  final Color fieldBg;
  final TextInputType? keyboardType;
  const _DarkField({required this.icon, required this.label, required this.hint, required this.controller, required this.fieldBg, this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 4),
      decoration: BoxDecoration(color: fieldBg, borderRadius: BorderRadius.circular(AppRadius.md)),
      child: Row(
        children: [
          Icon(icon, color: Colors.white38, size: 18),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(border: InputBorder.none, labelText: label, labelStyle: const TextStyle(color: Colors.white, fontSize: 12), hintText: hint, hintStyle: const TextStyle(color: Colors.white30, fontSize: 12), floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentTile extends StatelessWidget {
  final String label;
  final String sublabel;
  final bool imported;
  final Color cardBg;
  final VoidCallback onImport;
  const _DocumentTile({required this.label, required this.sublabel, required this.imported, required this.cardBg, required this.onImport});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(AppRadius.md)),
      child: Row(
        children: [
          Container(width: 34, height: 34, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle), child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 16)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)), Text(sublabel, style: const TextStyle(color: Colors.white54, fontSize: 10.5))])),
          OutlinedButton.icon(
            onPressed: onImport,
            icon: Icon(imported ? Icons.check : Icons.camera_alt_outlined, color: AppColors.green, size: 14),
            label: Text(imported ? 'Importé' : 'Importer', style: const TextStyle(color: AppColors.green, fontSize: 11)),
            style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.green), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
          ),
        ],
      ),
    );
  }
}
