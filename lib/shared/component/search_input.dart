import 'package:flutter/material.dart';
import 'package:news_flash/shared/shared.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value) onChanged;
  final bool readOnly;
  final VoidCallback? onTap;

  const SearchInput({
    super.key,
    this.controller,
    required this.onChanged,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search News',
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.primary,
          ),
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          suffix: GestureDetector(
            onTap: () {
              controller?.text = '';
              onChanged('');
            },
            child: const Icon(
              Icons.close,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
