import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/vakinha_ui.dart';
import '../../../core/ui/widgets/vakinha_appbar.dart';
import '../../../core/ui/widgets/vakinha_button.dart';
import '../../../core/ui/widgets/vakinha_textformfield.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(
                    label: 'Senha',
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(
                    label: 'Confirma senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma senha Obrigatória'),
                      Validatorless.compare(
                          _passwordEC, 'Senha diferente de confirma senha'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: VakinhaButton(
                      width: context.width,
                      label: 'Cadastrar',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
