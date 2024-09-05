// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_app_1/widgets/customer_account_list.dart';
// import 'package:flutter_app_1/widgets/customer_main_card.dart';
// import 'package:flutter_app_1/widgets/product_list.dart';
// import 'package:flutter_app_1/widgets/text_field.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_app_1/providers/customer_provider.dart';

// class CustomerScreen extends StatefulWidget {
//   const CustomerScreen({super.key});

//   @override
//   State<CustomerScreen> createState() => _CustomerScreenState();
// }

// class _CustomerScreenState extends State<CustomerScreen> {
//   final _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     final customerProvider =
//         Provider.of<CustomerProvider>(context, listen: false);
//     customerProvider.getProducts(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Customer Screen'),
//         centerTitle: true,
//         backgroundColor: Colors.blue[900],
//         foregroundColor: Colors.white,
//         titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width - 100,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: CustomTextField(
//                       controller: _searchController,
//                       labelText: 'Search customer',
//                       prefixIcon: Icons.search,
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     final customerProvider =
//                         Provider.of<CustomerProvider>(context, listen: false);
//                     customerProvider
//                         .getCustomerAndAccounts(_searchController.text.trim(), context);
//                   },
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.blue[900],
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.blueAccent),
//                     ),
//                     child: const Text(
//                       'Search',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Consumer<CustomerProvider>(
//               builder: (context, customerProvider, child) {
//                 final customer = customerProvider.customer;
//                 final accounts = customerProvider.accounts;
//                 final products = customerProvider.products;

//                 if (customer == null) {
//                   return const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 22),
//                     child: Center(
//                       child: Text(
//                         'No customer information found',
//                         style: TextStyle(fontSize: 18, color: Colors.redAccent),
//                       ),
//                     ),
//                   );
//                 }

//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomerMainCard(
//                       accountName: customer.customerName,
//                       custNo: customer.customerNo,
//                       branchCode: customer.localBranch,
//                     ),
//                     const SizedBox(height: 20),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 22),
//                       child: Text(
//                         'Account Information',
//                         style:
//                             TextStyle(fontSize: 18, color: Colors.blueAccent),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         children: accounts.map((account) {
//                           return CustomerAccountList(
//                             accountName: account.acDesc,
//                             accountNumber: account.custAcNo,
//                             ccy: account.ccy,
//                             branchCode: account.branchCode,
//                             openDate: account.acOpenDate,
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 22),
//                       child: Text(
//                         'Product List',
//                         style:
//                             TextStyle(fontSize: 18, color: Colors.blueAccent),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     if (products.isNotEmpty)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Wrap(
//                               spacing: 30,
//                               runSpacing: 10,
//                               children: products.map((product) {
//                                 return ProductListMenu(product: product);
//                               }).toList(),
//                             ),
//                           ),
//                         ],
//                       )
//                     else
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 22),
//                         child: Text(
//                           'No products available',
//                           style: TextStyle(fontSize: 16, color: Colors.grey),
//                         ),
//                       ),
//                   ],
//                 );
//               },
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/customer_account_list.dart';
import 'package:flutter_app_1/widgets/customer_main_card.dart';
import 'package:flutter_app_1/widgets/empty_screen_custom.dart';
import 'package:flutter_app_1/widgets/product_list.dart';
import 'package:flutter_app_1/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_1/providers/customer_provider.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  late CustomerProvider _customerProvider;
  final _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _customerProvider = Provider.of<CustomerProvider>(context, listen: false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _customerProvider.clearData();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຄົ້ນຫາຂໍ້ມູນລູກຄ້າ'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Consumer<CustomerProvider>(
          builder: (context, customerProvider, child) {
            if (_isSearching && customerProvider.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CustomTextField(
                            controller: _searchController,
                            labelText: 'Search customer',
                            prefixIcon: Icons.search,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (mounted) {
                            setState(() {
                              _isSearching = false;
                            });
                          }
        
                          final customerProvider = Provider.of<CustomerProvider>(
                              context,
                              listen: false);
                          customerProvider.clearData();
        
                          try {
                            await Future.wait([
                              customerProvider.getProducts(context),
                              customerProvider.getCustomerAndAccounts(
                                  _searchController.text.trim(), context),
                            ]);
                          } catch (e) {
                            print(e);
                          } finally {
                            if (mounted) {
                              setState(() {
                                _isSearching = false;
                              });
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 13),
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          child: const Text(
                            'ຄົ້ນຫາ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (customerProvider.customer == null) ...[
                    if (!_isSearching)
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: EmptyStateScreen(),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      )
                  ] else ...[
                    CustomerMainCard(
                      accountName: customerProvider.customer!.customerName,
                      custNo: customerProvider.customer!.customerNo,
                      branchCode: customerProvider.customer!.localBranch,
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        'ຂໍ້ມູນບັນຊີ',
                        style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (customerProvider.accounts.isNotEmpty) 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: customerProvider.accounts.map((account) {
                              return CustomerAccountList(
                              accountName: account.acDesc,
                              accountNumber: account.custAcNo,
                              ccy: account.ccy,
                              branchCode: account.branchCode,
                              openDate: account.acOpenDate,
                            );
                          }).toList(),
                        ),
                      )
                      else 
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Center(
                          child: Text(
                            'No accounts available',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        'ລາຍການຜະລິດຕະພັນ',
                        style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (customerProvider.products.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Wrap(
                              spacing: 30,
                              runSpacing: 10,
                              children: customerProvider.products.map((product) {
                                return ProductListMenu(product: product);
                              }).toList(),
                            ),
                          ),
                        ],
                      )
                    else
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Center(
                          child: Text(
                            'No products available',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                  ],
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
