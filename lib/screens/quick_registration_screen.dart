import 'package:flutter/material.dart';
import '../services/routing_service.dart';
import '../theme/app_theme.dart';

class QuickRegistrationScreen extends StatelessWidget {
  final String? headline;
  final String? headlineAccent;
  final String? description;
  final String? ctaText;
  final String? footerText;
  final String registrationUrl;
  final String backgroundAsset;
  final Color primaryCtaColor;
  final Color accentTextColor;
  final VoidCallback? onClose;
  final VoidCallback? onCtaPressed;

  const QuickRegistrationScreen({
    super.key,
    this.headline = 'Быстрая',
    this.headlineAccent = 'регистрация',
    this.description =
        'Зарегистрируйтесь на сайте и откройте доступ к актуальному предложению. Регистрация займёт всего пару минут.',
    this.ctaText = 'Перейти к регистрации',
    this.footerText = 'После нажатия откроется сайт для регистрации.',
    this.registrationUrl = 'https://applinkgo.com/srf2PnRD',
    this.backgroundAsset = 'assets/stadium_bg.jpg',
    this.primaryCtaColor = AppTheme.primaryColor,
    this.accentTextColor = AppTheme.secondaryColor,
    this.onClose,
    this.onCtaPressed,
  });

  void _handleCta(BuildContext context) {
    if (onCtaPressed != null) {
      onCtaPressed!();
    } else {
      RoutingService.openRegistrationUrl(registrationUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Full-bleed Themed Football Stadium Background
          Image.asset(
            backgroundAsset,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFF0A121A),
            ),
          ),

          // 2. Cinematic Vignette Gradient Overlay
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.60),
                  Colors.black.withValues(alpha: 0.20),
                  Colors.black.withValues(alpha: 0.35),
                  Colors.black.withValues(alpha: 0.85),
                ],
                stops: const [0.0, 0.25, 0.60, 1.0],
              ),
            ),
          ),

          // 3. UI Layer
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        child: Column(
                children: [
                  // Top Right: Circular Close Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onClose ?? () => Navigator.of(context).maybePop(),
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withValues(alpha: 0.40),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.28),
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 2),

                  // Center Headline & Description
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        headline!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1.0,
                          height: 1.04,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 24,
                              offset: Offset(0, 3),
                            ),
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 10,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        headlineAccent!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          color: accentTextColor,
                          letterSpacing: -1.0,
                          height: 1.04,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 24,
                              offset: const Offset(0, 3),
                            ),
                            Shadow(
                              color: accentTextColor.withValues(alpha: 0.45),
                              blurRadius: 28,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          description!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.48,
                            color: Colors.white.withValues(alpha: 0.94),
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.2,
                            shadows: const [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 16,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 3),

                  // Action Button with Primary Theme Color
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () => _handleCta(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryCtaColor,
                        foregroundColor: Colors.white,
                        elevation: 10,
                        shadowColor: primaryCtaColor.withValues(alpha: 0.60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ctaText!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward_rounded, size: 22),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Footer Disclaimer
                  Text(
                    footerText!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.72),
                      fontWeight: FontWeight.w400,
                      shadows: const [
                        Shadow(
                          color: Colors.black87,
                          blurRadius: 8,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
