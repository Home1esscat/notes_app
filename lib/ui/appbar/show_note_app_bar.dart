import 'package:app_client/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class ShowNoteAppBar extends StatelessWidget with PreferredSizeWidget {
  const ShowNoteAppBar({super.key, required this.onCustomPress});

  final Function onCustomPress;

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
                      Icons.edit,
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
