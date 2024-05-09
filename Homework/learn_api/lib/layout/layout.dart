import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_api/data/person.dart';
import 'package:learn_api/data/providers.dart';
import 'package:learn_api/layout/add_screen.dart';

class Layout {
  static ListView displayData(List<Person> persons, BuildContext context) =>
      ListView.builder(
        itemCount: persons.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) => selectionDialogue(context, persons[index].id!),
          ),
          child: itemView(persons[index]),
        ),
      );

  static CupertinoAlertDialog selectionDialogue(
          BuildContext context, String personId) =>
      CupertinoAlertDialog(
        content: const Text("Select operation"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddScreen(
                    isAdd: false,
                    id: personId,
                  ),
                ),
              );
            },
            child: const Text('Edit'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => PartnerAdd.deletePerson(
              context,
              personId!,
            ),
            child: const Text('Delete'),
          ),
        ],
      );

  static Container itemView(Person person) => Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  person.name.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: person.age != null,
              child: const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
            ),
            Visibility(
              visible: person.age != null,
              child: Row(
                children: [
                  const Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    person.age.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: person.phoneNumber != null,
              child: const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
            ),
            Visibility(
              visible: person.phoneNumber != null,
              child: Row(
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    person.phoneNumber.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: person.province != null,
              child: const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
            ),
            Visibility(
              visible: person.province != null,
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    person.province.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: person.district != null,
              child: const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
            ),
            Visibility(
              visible: person.district != null,
              child: Row(
                children: [
                  const Icon(
                    Icons.streetview,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    person.district.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
