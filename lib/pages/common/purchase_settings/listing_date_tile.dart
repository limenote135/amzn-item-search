import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'values.dart';

class ListingDateTile extends StatelessWidget {
  const ListingDateTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Expanded(child: Text("出品日")),
          Flexible(
            child: ReactiveTextField<dynamic>(
              formControlName: listingDateField,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "出品日",
                suffixIcon: ReactiveDatePicker(
                  formControlName: listingDateField,
                  firstDate: DateTime(DateTime.now().year - 3),
                  lastDate: DateTime(DateTime.now().year + 3),
                  builder: (context, picker, child) => IconButton(
                    icon: const Icon(Icons.date_range),
                    onPressed: picker.showPicker,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              final form = ReactiveForm.of(context)! as FormGroup;
              form.control(listingDateField).value = null;
            },
          ),
        ],
      ),
    );
  }
}
