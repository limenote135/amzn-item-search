import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PurchaseDateTile extends StatelessWidget {
  const PurchaseDateTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Expanded(child: Text("仕入れ日")),
          Flexible(
            child: ReactiveTextField<dynamic>(
              formControlName: purchaseDateField,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "仕入れ日",
                suffixIcon: ReactiveDatePicker(
                  formControlName: purchaseDateField,
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
        ],
      ),
    );
  }
}
