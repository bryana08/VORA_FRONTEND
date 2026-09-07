import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/voice_assistant_sheet.dart';
class VoiceAssistantSheet extends StatelessWidget {
  final String heardText;
  final String detectedPlace;
  final String detectedArea;

  const VoiceAssistantSheet({
    super.key,
    this.heardText = 'Tu me drop à la Pharmacie du Soleil',
    this.detectedPlace = 'Pharmacie du Soleil',
    this.detectedArea = 'Bastos, Yaoundé',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: AppColors.green, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text('Assistant Vocal Gemini IA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: AppColors.navy)),
              ),
              IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.close, color: AppColors.muted),
              ),
            ],
          ),
          const Text('Parlez naturellement, je trouve la destination pour vous.',
              style: TextStyle(fontSize: 12.5, color: AppColors.muted)),
          const SizedBox(height: AppSpacing.lg),

          // Micro animé (statique ici — anime avec AnimationController si besoin)
          SizedBox(
            width: 160, height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 160, height: 160, decoration: BoxDecoration(color: AppColors.greenLight.withOpacity(0.5), shape: BoxShape.circle)),
                Container(width: 110, height: 110, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle)),
                const Icon(Icons.mic, color: Colors.white, size: 44),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
            child: Row(
              children: [
                const Icon(Icons.graphic_eq, color: AppColors.greenDark, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('"$heardText"',
                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13, color: AppColors.greenDark)),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          Row(
            children: const [
              Icon(Icons.auto_awesome, color: AppColors.green, size: 16),
              SizedBox(width: 6),
              Text('Destination détectée :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.green, size: 22),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(detectedPlace, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.navy)),
                  Text('($detectedArea)', style: const TextStyle(fontSize: 12, color: AppColors.muted)),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: fermer la modale et pré-remplir la destination sur home_screen.dart
                Navigator.pop(context, detectedPlace);
              },
              icon: const Icon(Icons.check_circle, color: Colors.white, size: 18),
              label: const Text('Confirmer cette destination', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.shield_outlined, size: 14, color: AppColors.muted),
              SizedBox(width: 4),
              Text('Votre sécurité, notre priorité', style: TextStyle(fontSize: 11, color: AppColors.muted)),
            ],
          ),
        ],
      ),
    );
  }
}
