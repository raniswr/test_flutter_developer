import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_developer/constant/colors.dart';
import 'package:test_flutter_developer/constant/styles.dart';
import 'package:test_flutter_developer/cubit/article_cubit.dart';
import 'package:test_flutter_developer/cubit/login_cubit.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  generateDate(String date) {
    final f = DateFormat('dd MMMM yyyy, hh:mm:ss');
    return f.format(DateTime.parse(date));
  }

  bool load = true;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: BlocBuilder<ArticleCubit, ArticleState>(
            builder: (context, state) {
              return load
                  ? const DataListTile()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, loginState) {
                            return Text.rich(
                              TextSpan(
                                text: 'Welcome, ', style: AppStyles.styleTextBody20(), // default text style
                                children: <TextSpan>[
                                  TextSpan(text: loginState.user?.user?.name ?? '', style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            );
                          },
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            height: 400,
                            child: ListView.builder(
                              itemCount: 5,
                              primary: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var data = state.articles?.articles?[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: 200,
                                    height: 500,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(color: AppColors.green),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data?.title ?? '',
                                          style: AppStyles.styleTextBody18(fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          data?.content ?? '',
                                          style: AppStyles.styleTextBody18(),
                                          maxLines: 4,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ListView.builder(
                            itemCount: state.articles?.articles?.length ?? 0,
                            primary: true,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var data = state.articles?.articles?[index];

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width: 200,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.boxColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.network(
                                                data?.image ?? '',
                                                height: 100.0,
                                                width: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                data?.title ?? '',
                                                style: AppStyles.styleTextBody18(colorText: AppColors.black),
                                                // softWrap: false,
                                                maxLines: 6,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        data?.content ?? '',
                                        style: AppStyles.styleTextBody18(colorText: AppColors.black),
                                        maxLines: 4,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            generateDate(data?.created?.date ?? ''),
                                            style: AppStyles.styleTextBody18(colorText: AppColors.black),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
            },
          )),
    );
  }
}

class DataListTile extends StatelessWidget {
  const DataListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 15,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                height: 400,
                child: ListView.builder(
                  itemCount: 2,
                  primary: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 200,
                        height: 500,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: 2,
                primary: true,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
