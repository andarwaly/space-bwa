import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
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
      margin: EdgeInsets.only(
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
    return Container(
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
              obscureText: true,
              decoration: InputDecoration.collapsed(
                hintText: 'Password',
                hintStyle: grayText.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          const Icon(
            LucideIcons.eye,
            color: kGrayColor,
          )
        ],
      ),
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
              value: false,
              onChanged: (value) {},
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
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.only(
        top: 32,
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: kBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
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
}
