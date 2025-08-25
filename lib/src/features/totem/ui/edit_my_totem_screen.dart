import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';
import 'package:wom_pocket/src/features/totem/application/my_totem_notifier.dart';

class EditMyTotemScreen extends HookConsumerWidget {
  final String? name;
  final String? phone;
  final String? email;
  final String? website;

  const EditMyTotemScreen({
    this.name,
    super.key,
    this.phone,
    this.email,
    this.website,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final nameController = useTextEditingController(text: name);
    final phoneController = useTextEditingController(text: phone ?? '');
    final emailController = useTextEditingController(text: email ?? '');
    final websiteController = useTextEditingController(text: website ?? '');
    final isLoading = useState(false);
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: 'edit_my_personal_totem.edit'.tr(),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: nameController,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'edit_my_personal_totem.name'.tr(),
              ),
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'edit_my_personal_totem.email'.tr(),
              ),
              validator: FormBuilderValidators.email(checkNullOrEmpty: false),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: phoneController,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'edit_my_personal_totem.phone'.tr(),
              ),
              validator:
                  FormBuilderValidators.phoneNumber(checkNullOrEmpty: false),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: websiteController,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'edit_my_personal_totem.url'.tr(),
              ),
              validator: FormBuilderValidators.url(checkNullOrEmpty: false),
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) {
                return MyButton(
                  isLoading: isLoading.value,
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      if (formKey.currentState?.validate() ?? false) {
                        isLoading.value = true;

                        final name = nameController.text.trim();
                        final email = emailController.text.trim().toLowerCase();
                        final phone = phoneController.text.trim();
                        final website = websiteController.text.trim().toLowerCase();

                        await ref
                            .read(myTotemNotifierProvider.notifier)
                            .savePersonalTotem(
                              name: name,
                              email: email.isEmpty ? null : email,
                              phone: phone.isEmpty ? null : phone,
                              website: website.isEmpty ? null : website,
                            );
                        isLoading.value = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('edit_my_personal_totem.success'.tr()),
                          ),
                        );
                        ref.invalidate(myTotemNotifierProvider);
                        context.maybePop();
                      }
                    } catch (ex, st) {
                      isLoading.value = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('edit_my_personal_totem.error'.tr()),
                        ),
                      );
                    }
                  },
                  child: Text('edit_my_personal_totem.save'.tr()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
