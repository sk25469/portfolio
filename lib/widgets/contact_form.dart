import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/gradient_button.dart';

class ContactForm extends HookWidget {
  const ContactForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final messageController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSuccess = useState(false);
    final isError = useState(false);
    final errorMessage = useState('');
    final isSubmitting = useState(false);

    final submit = useCallback(() async {
      if (formKey.currentState!.validate()) {
        isSubmitting.value = true;
        try {
          await Future.delayed(const Duration(seconds: 2));
          isSuccess.value = true;
          isSubmitting.value = false;
        } catch (e) {
          isError.value = true;
          errorMessage.value = e.toString();
          isSubmitting.value = false;
        }
      }
    }, [formKey]);

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomInput(
            inputController: nameController,
            label: 'Name',
            isDark: isDark,
            hint: 'Let\'s not be strangers, shall we?',
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          CustomInput(
            inputController: emailController,
            label: 'Email',
            isDark: isDark,
            hint: 'Your email please?',
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          CustomInput(
            inputController: messageController,
            label: 'Message',
            isDark: isDark,
            hint: 'What\'s on your mind?',
            maxLines: 6,
          ),
          const SizedBox(height: 15),
          GradientButton(
            text: 'SEND',
            onPressed: submit,
            isCertificate: false,
          ),
        ],
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final TextEditingController inputController;
  final String label;
  final String hint;
  final bool isDark;
  final int maxLines;
  const CustomInput({
    Key? key,
    required this.inputController,
    required this.label,
    required this.hint,
    required this.isDark,
    required this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDark ? lightBackgroundColor : darkBackgroundColor;
    const secondaryColor = Color.fromARGB(255, 98, 0, 255);
    const errorColor = Color(0xffEF4444);
    final _isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _isDark ? Colors.white.withOpacity(.9) : Colors.black.withOpacity(.9),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1),
              ),
            ],
          ),
          child: TextFormField(
            validator: (value) {
              // if (label == "Name" && value!.isEmpty) {
              //   return "Tell me your name, please!";
              // }
              // if (label == "Email" && (value!.isEmpty || !value.contains('@'))) {
              //   return "Come on! That's not a valid email";
              // }
              // // if (label == "Message" && value!.isEmpty) {
              // //   return "Don't want to say anything?";
              // // }
              // return null;
            },
            maxLines: maxLines,
            controller: inputController,
            onChanged: (value) {
              //Do something
            },
            style: TextStyle(
              fontSize: 14,
              color: _isDark ? Colors.black : Colors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  _isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(.8),
              hintText: hint,
              hintStyle: TextStyle(
                color: _isDark
                    ? Colors.black.withOpacity(.75)
                    : Colors.white.withOpacity(.75),
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 10,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
