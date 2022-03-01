import 'dart:math';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:webuni/models/user_data.dart';
import 'package:webuni/utils/user_repository.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('Leave'),
                    )
                  ],
                ));
        return result;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add employee'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'name',
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Name',
                      hintText: 'Full name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Email address',
                      border: OutlineInputBorder(),
                    ),
                    validator: EmailValidator(
                      errorText: 'Wrong email format',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'phone',
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: 'Phone',
                      hintText: 'Phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                FormBuilderImagePicker(
                  name: 'photos',
                  decoration: const InputDecoration(labelText: 'Pick Photos'),
                  maxImages: 1,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                        child: const Text('Create'),
                        onPressed: () async {
                          var form = FormBuilder.of(context)!;
                          if (form.saveAndValidate()) {
                            var photo = form.value['photos'][0] as XFile;
                            var imageBytes = await photo.readAsBytes();
                            var user = UserData(
                              Random().nextInt(1 << 31),
                              form.value['name']!,
                              form.value['email']!,
                              form.value['phone']!,
                              MemoryImage(imageBytes),
                            );
                            UserRepository.of(context).onUserAdded(user);
                            Navigator.pop(context);
                          }
                        },
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
