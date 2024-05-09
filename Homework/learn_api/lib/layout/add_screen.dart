import 'package:flutter/material.dart';
import 'package:learn_api/data/providers.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  final bool isAdd;
  String id;

  AddScreen({super.key, required this.isAdd, this.id = ""});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _textEditingNameController =
      TextEditingController();
  final TextEditingController _textEditingPhoneController =
      TextEditingController();
  final GlobalKey _formState = GlobalKey<FormState>();
  final Map<bool, String> _partners = {true: "Client", false: "Provider"};

  @override
  void initState() {
    super.initState();
    context.read<PartnerAdd>().age = 0;
    context.read<PartnerAdd>().partner = null;
    context.read<PartnerAdd>().provinceId = null;
    context.read<PartnerAdd>().distinctId = null;
    context.read<ProvinceProvider>().getProvinces();
    context.read<DistinctProvider>().getDistinct(null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formState,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: widget.isAdd
                ? const Text(
                    "Add partner",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  )
                : const Text(
                    "Edit partner",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.black12,
              child: Stack(
                children: [
                  addScreen(context),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(18),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
              ),
              onPressed: () {
                PartnerAdd.addPerson(context, _textEditingNameController.text,
                    _textEditingPhoneController.text, widget.isAdd, widget.id);
              },
              child: const Text(
                "Complete",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container addScreen(BuildContext context) => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name partner *",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            TextFormField(
              controller: _textEditingNameController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Ex: Lê Văn Anh",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Age *",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                  ),
                  onPressed: () => context.read<PartnerAdd>().addAge(false),
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  context.watch<PartnerAdd>().age.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                  ),
                  onPressed: () => context.read<PartnerAdd>().addAge(true),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Phone number",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            TextFormField(
              controller: _textEditingPhoneController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Ex: 0123456789",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Type partner *",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: const Text('Select Type'),
                isExpanded: true,
                value: context.read<PartnerAdd>().partner,
                items: _partners.values
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) =>
                    context.read<PartnerAdd>().addPartner(
                          value.toString(),
                        ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Province",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            DropdownButtonHideUnderline(
              child: Center(
                child: context.watch<ProvinceProvider>().isLoadingProvinces
                    ? const CircularProgressIndicator()
                    : DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: context.read<PartnerAdd>().provinceId,
                        hint: const Text('Select Province'),
                        items: ProvinceProvider.provinces
                            .map(
                              (item) => DropdownMenuItem(
                                value: item.provinceId,
                                child: Text(item.provinceName.toString()),
                              ),
                            )
                            .toList(),
                        onChanged: (String? id) => {
                          context.read<PartnerAdd>().addProvince(id),
                          context.read<DistinctProvider>().getDistinct(id),
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Distinct",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            DropdownButtonHideUnderline(
              child: Center(
                child: context.watch<DistinctProvider>().isLoadingDistinct
                    ? const CircularProgressIndicator()
                    : DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: context.read<PartnerAdd>().distinctId,
                        hint: const Text('Select Distinct'),
                        items: DistinctProvider.distinct
                            .map(
                              (item) => DropdownMenuItem(
                                value: item.districtId,
                                child: Text(item.districtName.toString()),
                              ),
                            )
                            .toList(),
                        onChanged: (String? id) =>
                            context.read<PartnerAdd>().addDistinct(id),
                      ),
              ),
            ),
          ],
        ),
      );
}
