import 'package:flutter/material.dart';

class AccountTypeSelected extends StatefulWidget {
  const AccountTypeSelected({super.key, required this.controller});

  final ValueNotifier<AccountType?> controller;

  @override
  State<AccountTypeSelected> createState() => _AccountTypeSelectedState();
}

enum AccountType { currentAccount, savingsAccount, fixedDepositAccount }

class _AccountTypeSelectedState extends State<AccountTypeSelected> {
  // AccountType? _status = AccountType.currentAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('ບັນຊີກະແສລາຍວັນ'),
          leading: Radio<AccountType>(
            value: AccountType.currentAccount,
            groupValue: widget.controller.value,
            onChanged: (AccountType? value) {
              widget.controller.value = value;
            },
          ),
        ),
        ListTile(
          title: const Text('ບັນຊີຝາກປະຢັດ'),
          leading: Radio<AccountType>(
            value: AccountType.savingsAccount,
            groupValue: widget.controller.value,
            onChanged: (AccountType? value) {
              widget.controller.value = value;
            }
          ),
        ),
        ListTile(
          title: const Text('ບັນຊີຝາກມີກຳນົດ'),
          leading: Radio<AccountType>(
            value: AccountType.fixedDepositAccount,
            groupValue: widget.controller.value,
            onChanged: (AccountType? value) {
              widget.controller.value = value;
            }
          ),
        ),
      ],
    );
  }
}
