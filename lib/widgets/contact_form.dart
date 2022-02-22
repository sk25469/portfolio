import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';

const _kWidth = 1536;
const _kHeight = 745;

class ContactForm extends HookWidget {
  const ContactForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final subjectController = useTextEditingController();
    final emailController = useTextEditingController();
    final messageController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    // final isSuccess = useState(false);
    final isError = useState(false);
    final errorMessage = useState('');
    final isSubmitting = useState(false);

    final submit = useCallback(() async {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
      }

      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'sk25469@gmail.com',
        query: encodeQueryParameters(
          <String, String>{
            'subject': subjectController.text,
            'body': messageController.text,
          },
        ),
      );
      isSubmitting.value = true;
      try {
        await launch(emailLaunchUri.toString());
        isSubmitting.value = false;
      } catch (e) {
        isError.value = true;
        errorMessage.value = e.toString();
        isSubmitting.value = false;
      }
    }, [formKey]);

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomInput(
            inputController: subjectController,
            label: 'Name',
            isDark: isDark,
            hint: 'Let\'s not be strangers, shall we?',
            maxLines: 1,
          ),
          SizedBox(height: 10 / _kHeight * height),
          CustomInput(
            inputController: emailController,
            label: 'Subject',
            isDark: isDark,
            hint: 'What do you want to talk about?',
            maxLines: 1,
          ),
          SizedBox(height: 10 / _kHeight * height),
          CustomInput(
            inputController: messageController,
            label: 'Message',
            isDark: isDark,
            hint: 'What\'s on your mind?',
            maxLines: 6,
          ),
          SizedBox(height: 15 / _kHeight * height),
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

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
            maxLines: maxLines,
            controller: inputController,
            // onChanged: (value) {
            //   //Do something
            // },
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
              contentPadding: EdgeInsets.symmetric(
                vertical: 20.0 / _kHeight * height,
                horizontal: 20.0 / _kWidth * width,
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
