import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class NavigationWrapper extends StatelessWidget {
  const NavigationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRouteName =
        GoRouter.of(context).routeInformationProvider.value.location;

    final Map<String, int> routesIndex = {
      '/home': 0,
      '/transferir': 1,
      '/qr': 2,
      '/analisis': 3,
      '/mas': 4,
    };

    final currentIndex = routesIndex[currentRouteName] ?? 0;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: AppColors.textColor,
      child: SizedBox(
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              icon: HugeIcons.strokeRoundedHome01,
              label: 'Inicio',
              route: '/home',
              index: 0,
              currentIndex: currentIndex,
            ),
            _buildNavItem(
              context,
              icon: HugeIcons.strokeRoundedArrowDataTransferDiagonal,
              label: 'Transferir',
              route: '/transferir',
              index: 1,
              currentIndex: currentIndex,
            ),
            _buildQrItem(context,
                icon: HugeIcons.strokeRoundedQrCode, route: '/qrCode'),
            _buildNavItem(
              context,
              icon: HugeIcons.strokeRoundedAnalyticsUp,
              label: 'Análisis',
              route: '/analisis',
              index: 3,
              currentIndex: currentIndex,
            ),
            _buildNavItem(
              context,
              icon: HugeIcons.strokeRoundedUserStory,
              label: 'Más',
              route: '/mas',
              index: 4,
              currentIndex: currentIndex,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildNavItem(
  BuildContext context, {
  required IconData icon,
  required String label,
  required String route,
  required int index,
  required int currentIndex,
}) {
  Color color =
      currentIndex == index ? Colors.grey.shade800 : Colors.grey.shade400;

  return InkWell(
    onTap: () => context.go(route),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        HugeIcon(
          icon: icon,
          color: color,
          size: 26.0,
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: color),
        ),
      ],
    ),
  );
}

Widget _buildQrItem(
  BuildContext context, {
  required IconData icon,
  required String route,
}) {
  return InkWell(
    onTap: () => context.go(route),
    child: Container(
      height: 100,
      width: 65,
      decoration: BoxDecoration(
          color: AppColors.redPrimaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: HugeIcon(
        icon: icon,
        color: AppColors.backgroundColor,
        size: 42,
      )),
    ),
  );
}
