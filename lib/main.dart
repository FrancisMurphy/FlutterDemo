// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_app/NewRoute.dart';
import 'package:flutter_app/FormTestRoute.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
/// //在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)。
/// 在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)。
class MyApp extends StatelessWidget {

  //Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来
  // 描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  @override
  Widget build(BuildContext context) {
    //MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。
    // MaterialApp也是一个widget。
    return MaterialApp(
      title: 'Frank Demo',
//      theme: new ThemeData(
//        brightness: Brightness.dark,
//        primaryColor: Colors.lightBlue,
//        accentColor: Colors.orange,
//      ),
        routes:{
          "new_page":(context)=>NewRoute(),
          "formTest":(context)=>FormTestRoute(),
        },
      //home 为Flutter应用的首页，它也是一个widget。
      home: MyHomePage(title:'Frank home page')
    );
  }
}

/// This is the stateless widget that the main application instantiates.
/// Stateful是一个带状态的控件
/// MyHomePage 是应用的首页，它继承自StatefulWidget类，表示它是一个有状态的widget（Stateful widget）。
/// 现在，我们可以简单认为Stateful widget 和Stateless widget有两点不同：
//
//Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，而Stateless widget是不可变的。
//Stateful widget至少由两个类组成：
//
//一个StatefulWidget类。
//一个 State类； StatefulWidget类本身是不变的，但是 State类中持有的状态在widget生命周期中可能会发生变化。
//_MyHomePageState类是MyHomePage类对应的状态类。看到这里，细心的读者可能已经发现，和MyApp 类不同，
// MyHomePage类中并没有build方法，取而代之的是，build方法被挪到了_MyHomePageState方法中，至于为什么这么做，先留个疑问，
// 在分析完完整代码后再来解答。
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //标题
  final String title;

  @override
  _MyHomePageState createState() =>new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  int _counter=0;

  /**
   * 当按钮点击时，会调用此函数，该函数的作用是先自增_counter，然后调用setState 方法。
   * setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，
   * 会执行build方法来根据新的状态重新构建界面， Flutter 对此方法做了优化，使重新执行变的很快，
   * 所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget。
   */
  void _incrementCounter () {
    // 调用State 类里的setState 方法来更改状态值，使得计数器力口l
    setState(() {
      // 计数器变量，每次点击让其加l
      _counter++;
    });}

  void _subtractionCounter () {
    // 调用State 类里的setState 方法来更改状态值，使得计数器力口l
    setState(() {
      // 计数器变量，每次点击让其加l
      _counter--;
    });}

  /**
   * 构建UI界面的逻辑在build方法中，当MyHomePage第一次创建时，_
   * MyHomePageState类会被创建，当初始化完成后，Flutter框架会调用Widget的build方法来构建widget树，
   * 最终将widget树渲染到设备屏幕上。所以，我们看看_MyHomePageState的build方法中都干了什么事：
   */
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Column(
            //主轴居中对其
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You hava pushed the button this many time:',),
              new Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme
                    .display1,
              ),
              new IconButton(
                  icon: new Icon(Icons.airplay),
                  onPressed: () {
                    /**
                     * Navigator是一个路由管理的widget，它通过一个栈来管理一个路由widget集合。
                     * 通常当前屏幕显示的页面就是栈顶的路由。Navigator提供了一系列方法来管理路由栈
                     */
//                    Navigator.push(context,
//                        /**
//                         * MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，
//                         * 表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。
//                         * MaterialPageRoute 是Material组件库的一个Widget，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画
//                         *
//                         * 如果想自定义路由切换动画，可以自己继承PageRoute来实现，我们将在后面介绍动画时，实现一个自定义的路由Widget
//                         */
//                        new MaterialPageRoute(
//                            builder: (context) {
//                              return new NewRoute();
//                            }
//                        )
//                    );
                    Navigator.of(context).pushNamed("new_page", arguments: "asdasdas");
                  }
              ),
              new FlatButton(
                  child: Text("FormRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("formTest");
                  }
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
        child: new Icon(Icons.add),),
      );
    }

}


