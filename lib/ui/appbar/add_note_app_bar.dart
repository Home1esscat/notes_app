import 'package:app_client/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class AddNoteAppBar extends StatelessWidget with PreferredSizeWidget {
  const AddNoteAppBar(
      {super.key,
      required this.onSavePress,
      required this.onColorChangePress,
      required this.onCustomPress});

  final Function onSavePress;
  final Function onCustomPress;
  final Function onColorChangePress;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
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
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => onColorChangePress(),
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
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 22),
                InkWell(
                  onTap: () => onSavePress(),
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
                      Icons.save_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 22),
                InkWell(
                  onTap: () => onCustomPress(),
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
                      Icons.bug_report,
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
