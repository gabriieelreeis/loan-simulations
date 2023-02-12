import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/app/modules/loading/views/loading_view.dart';
import 'package:loan_simulations/app/modules/simulation/controllers/simulation_controller.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';
import 'package:loan_simulations/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:loan_simulations/shared/widgets/buttons/default_button_widget.dart';
import 'package:loan_simulations/shared/widgets/default_dropdown/default_dropdown_widget.dart';
import 'package:loan_simulations/shared/widgets/default_input/default_input_widget.dart';
import 'package:loan_simulations/shared/widgets/default_multi_select_widget.dart/default_multi_select_widget.dart';

class SimulationView extends GetView<SimulationController> {
  const SimulationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        constraints: BoxConstraints(
          minHeight: ScreenUtil().screenHeight,
        ),
        color: primaryBackground,
        child: Obx(() {
          if (controller.loading) return const LoadingView();

          return SingleChildScrollView(child: _buildWidget());
        }),
      ),
    );
  }

  Widget _buildWidget() {
    return Column(
      children: [
        Container(
          width: ScreenUtil().screenWidth,
          height: (ScreenUtil().screenHeight * .3).h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/webps/quem-somos.webp'),
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0),
                  Color.fromRGBO(0, 0, 0, .1),
                  Color.fromRGBO(0, 0, 0, .3),
                  Color.fromRGBO(0, 0, 0, 1),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Container(
              padding:
                  EdgeInsets.only(right: (ScreenUtil().screenWidth * .4).w),
              child: Text.rich(
                TextSpan(
                  text: 'oi, nós somos a Empresta',
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  children: const [
                    TextSpan(
                      text: ':)',
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: 20.w, right: 100.w, top: 20.h, bottom: 20.h),
          child: Text.rich(
            textAlign: TextAlign.left,
            TextSpan(
              text: 'Empréstimo pessoal: ',
              style: TextStyle(
                fontSize: 42.sp,
                fontWeight: FontWeight.w700,
                color: accentColor,
              ),
              children: const <InlineSpan>[
                TextSpan(
                  text: 'dinheiro rápido e seguro',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' para você!',
                  style: TextStyle(
                    color: accentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (controller.result != null) _result(),
        if (controller.result == null) _buildForm(),
      ],
    );
  }

  Widget _buildForm() {
    final List<int> installments = [36, 48, 60, 72, 84];

    return Container(
      alignment: Alignment.topLeft,
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.all(20.w),
      color: greyColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Simule seu empréstimo pessoal',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          DefaultInput(
            flex: 100,
            labelText: '* Valor do emprestimo',
            hintText: 'R\$0,00',
            keyboardType: TextInputType.number,
            controller: controller.loanValueController,
            inputFormatters: <TextInputFormatter>[
              CurrencyTextInputFormatter(
                locale: 'pt_BR',
                symbol: 'R\$',
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => DefaultMultiSelect(
              flex: 100,
              labelText: 'Instituição',
              hintText: 'Selecione uma instituição',
              onChange: (value) => controller.institution = value,
              items: controller.listInstitutions,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => DefaultMultiSelect(
              flex: 100,
              labelText: 'Convênio',
              hintText: 'Selecione um convênio',
              initialValue: controller.insurance,
              onChange: (value) => controller.insurance = value,
              items: controller.listInsurances,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          DefaultDropDown(
            flex: 100,
            labelText: 'Parcelas',
            onChange: (value) => controller.installments = value!,
            items: [
              DropdownMenuItem<String>(
                value: null,
                child: Text(
                  'Selecione a quantidade de parcelas',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              ...installments.map((installment) {
                return DropdownMenuItem<String>(
                  value: installment.toString(),
                  child: Text(
                    installment.toString(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                );
              }).toList(),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => DefaultButtonWidget(
              title: 'Simular',
              textColor: Colors.white,
              bgColor: controller.validForm
                  ? primaryColor
                  : primaryColor.withOpacity(.6),
              onTap: controller.validForm ? controller.simulateLoan : () => {},
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const Text('Campos com * são obrigatórios'),
        ],
      ),
    );
  }

  Widget _result() {
    return Container(
      alignment: Alignment.topLeft,
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vejaa baixo as opções de emprestimo \ndisponíveis para você:',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: accentColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.result!.length,
              itemBuilder: (context, index) {
                String key = controller.result!.keys.toList()[index];

                return Container(
                  width: ScreenUtil().screenWidth,
                  color: greyColor,
                  padding: EdgeInsets.all(20.w),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            key,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Valor: ',
                              children: [
                                TextSpan(
                                  text: controller.convertDoubleToReal(
                                      controller.loanValue),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Opções disponíveis:',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        height: 50.h,
                      ),
                      for (var item in controller.result![key])
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Parcelas: ',
                                    children: [
                                      TextSpan(
                                        text: '${item['parcelas']}x ',
                                        children: [
                                          TextSpan(
                                            text:
                                                controller.convertDoubleToReal(
                                                    item['valor_parcela']),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Juros ao mês: ',
                                    children: [
                                      TextSpan(
                                        text: '${item['taxa']}%',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 50.h,
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          DefaultButtonWidget(
            title: 'Simular novamente',
            textColor: Colors.white,
            bgColor: primaryColor,
            onTap: controller.reset,
          ),
        ],
      ),
    );
  }
}
