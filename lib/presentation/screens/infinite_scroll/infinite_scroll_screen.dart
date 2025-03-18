import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'progress_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1, 2, 3, 4, 5].map((e) => e + lastId),
    );
  }

  /// NOTE: This function simulates an async request to load more images.
  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();

    isLoading = false;

    /// NOTE: Whenever the widget is not mounted before calling setState
    /// This could throw an error eventually because the widget could be not necessarily be disposed on time.

    if (!isMounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 500 >=
          _scrollController.position.maxScrollExtent) {
        /// NOTE: Loads next page of images
        loadNextPage();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  /// NOTE: This function would allow the user that whenever
  /// the new data is loaded he will be directed towards the new data.
  void moveScrollToBottom() {
    if (_scrollController.position.pixels + 100 <=
        _scrollController.position.maxScrollExtent) {
      return;
    }

    _scrollController.animateTo(_scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,

        /// NOTE: Everything that is Widget.builder() function consists in a widget that will be built on runtime under demand.
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: RefreshIndicator(
            /// NOTE: This widget allows to have the famous indicator of the spinning arrow shaped in circle
            /// that indicates that something is loading in the background.
            /// And with that, we are able to trigger a function to load more data.
            onRefresh: onRefresh,
            edgeOffset: 10,
            strokeWidth: 2,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (context, index) {
                  return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/200/300'),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.pop(),
            // child: const Icon(Icons.arrow_back_ios_new_outlined)),
            child: isLoading
                ? SpinPerfect(
                    infinite: true, child: const Icon(Icons.refresh_rounded))
                : const Icon(Icons.arrow_back_ios_new_outlined)));
  }
}
