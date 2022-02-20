import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/constants/custom_theme.dart';

class ContactForm extends HookWidget {
  const ContactForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final messageController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final textTheme = Theme.of(context).textTheme;
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
      child: Column(
        children: [
          CustomInput(
            inputController: emailController,
            label: 'Email',
            isDark: isDark,
            hint: 'Enter your email',
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          CustomInput(
            inputController: nameController,
            label: 'Name',
            isDark: isDark,
            hint: 'Enter your name',
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          CustomInput(
            inputController: messageController,
            label: 'Message',
            isDark: isDark,
            hint: 'Enter your message',
            maxLines: 7,
          ),
          RaisedButton(
            onPressed: () {},
            child: const Text('Submit'),
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
    const secondaryColor = Color(0xff6D28D9);
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
        const SizedBox(
          height: 8,
        ),
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
          child: TextField(
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
