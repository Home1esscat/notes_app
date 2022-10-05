import 'package:app_client/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar(
      {super.key, required this.onSearchPress, required this.onInfoPress});

  final Function onSearchPress;
  final Function onInfoPress;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Notes',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 43,
                  color: Colors.white),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => onSearchPress(),
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      color: CustomColors.lightGrey,
                    ),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 22),
                InkWell(
                  onTap: () => onInfoPress(),
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      color: CustomColors.lightGrey,
                    ),
                    child: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(82.0);
}
