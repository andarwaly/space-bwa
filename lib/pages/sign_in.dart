import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late FToast fToast;
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isShowPasswordError = false;
  bool isRememberMe = false;
  bool isLoading = false;
  bool hidePass = true;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          emailInput(),
          passInput(),
          rememberCheckBox(),
          loginButton(),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'OR',
                style: grayText.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
            ),
          ),
          loginGoogleButton(),
          registerButton(),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(
        top: 84,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Login to your\naccount',
              style: blackAccentText.copyWith(
                fontSize: 24,
                fontWeight: bold,
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  width: 87,
                  height: 4,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.circular(4),
                  )),
              Container(
                width: 8,
                height: 4,
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      padding: const EdgeInsets.all(16),
      width: 366,
      decoration: BoxDecoration(
        color: kWhiteGray,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration.collapsed(
            hintText: 'Email',
            hintStyle: grayText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            )),
      ),
    );
  }

  Widget passInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.all(16),
          width: 366,
          decoration: BoxDecoration(
            color: kWhiteGray,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: hidePass,
                  controller: passwordController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: grayText.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      hidePass = !hidePass;
                    },
                  );
                },
                child: Icon(
                  hidePass ? LucideIcons.eye : LucideIcons.eyeOff,
                  color: kGrayColor,
                ),
              )
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              'Please check your password',
              style: redText,
            ),
          )
      ],
    );
  }

  Widget rememberCheckBox() {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: isRememberMe,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Remember me',
            style: blackText.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      height: 56,
      width: double.infinity,
      margin: EdgeInsets.only(top: 32),
      child: TextButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (passwordController.text != '123456') {
              setState(() {
                isShowPasswordError = true;
              });
              fToast.showToast(
                child: errorToast(),
                toastDuration: Duration(seconds: 2),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              setState(() {
                isShowPasswordError = false;
                Navigator.pushNamed(context, '/home');
              });
            }
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: kBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: kWhiteColor,
                backgroundColor: kGrayColor,
              )
            : Text(
                'Login',
                style: whiteText.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
      ),
    );
  }

  Widget loginGoogleButton() {
    return Container(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'Login with Google',
          style: blackText.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }

  Widget registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 44),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don’t have an account?',
            style: grayText.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(
            width: 4,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Register',
              style: blueText.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorToast() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Wrong Password, try again in one minutes',
        style: whiteText.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
