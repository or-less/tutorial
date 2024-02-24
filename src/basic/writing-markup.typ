#import "mod.typ": *

#show: book.page.with(title: [编写一篇基本文档 - 标记篇])

Typst是一门简明但强大的现代排版语言，你可以使用简洁直观的语法排版出好看的文档。

Typst希望用户总是尽可能少的配置样式，就获得一个排版优秀的文档。这意味着在许多情况下，你都只需要进行文档的撰写，而不需要在文档内部对排版做任何更复杂的调整。

得益于此，本节只涉及编写一篇文档所需的最基本的语法。只要学会这些语法，你就已经可以在大部分场合下编写出满足需求的文档。

== 段落

在Typst中所有文本默认组成段落。

#code(```typ
我是一段文本
```)

另起一行文本不会产生新的段落。为了创建新的段落，你需要空至少一行。

#code(```typ
轻轻的我走了，
正如我轻轻的来；

我轻轻的招手，
作别西天的云彩。
```)

缩进并不会产生新的空格：

#code(```typ
  轻轻的我走了，
      正如我轻轻的来；

  我轻轻的招手，
      作别西天的云彩。
```)

注意：在Typst的中文排版中，另起一行会引入一个小的空格。该问题会在未来修复。

```typ
轻轻的我走了，
正如我轻轻的来；

轻轻的我走了，正如我轻轻的来；
```

#code(```typ
轻轻的我走了，#box(fill: blue, outset: (right: 0.2em), sym.space)
正如我轻轻的来；

轻轻的我走了，正如我轻轻的来；
```, show-cc: false)

== 标题

在Typst中，你可以使用一个或多个*连续*的「等于号」（`=`）开启一个标题。

#code(```typ
= 一级标题
我走了。
== 二级标题
我来了。
=== 三级标题
我走了又来了。
```)

等于号的数量恰好对应了标题的级别。一级标题由一个「等于号」开启，二级标题由两个「等于号」开启，以此类推。

注意：正如你所见，标题会强制划分新的段落。

== 着重和强调语义

在Typst中有许多与等于号类似的语法标记，当你以相应的语法标记文本内容时，相应的文本就被赋予了特别的语义和样式。

与许多标记语言相同，Typst中使用一系列「定界符」规则确定一段语义的开始和结束。为了组成一段带有语义的文本，需要将一个「定界符」置于文本之前，表示该语义的开始；同时将另一个「定界符」置于文本末尾，表示该语义的结束。

例如，「星号」（`*`）作为定界符赋予所包裹的一段文本以「着重语义」。

#code(```typ
着重语义：这里有一个*重点！*
```)

与「着重语义」类似，「下划线」（`_`）作为定界符将赋予「强调语义」：

#code(```typ
强调语义：_emphasis_
```)

着重语义一般比强调语义语气更重。着重和强调语义可以相互嵌套：

#code(```typ
着重且强调：*_strong emph_* 或 _*strong emph*_
```)

注意：中文排版一般不使用斜体表示着重或强调。

== （计算机）代码片段

Typst的代码片段标记语法与Markdown完全相同。如果你使用过Markdown，那么你将对以下代码片段的标记方式非常熟悉。

例如，配对的「反引号」（``` ` ```）包裹一段内容，表示内容为代码片段。

#code(````typ
短代码片段：`code`
````)

有时候你希望允许代码内容包含反引号。这时候，你需要使用*至少连续*三个「反引号」组成定界符标记代码片段：

#code(`````typ
包含反引号的长代码片段：``` ` ```

包含三个反引号的长代码片段：```` ``` ````
`````)

特别的，如果使用长的代码片段定界符包裹内容，你还可以在起始定界符后*紧接着*指定该代码的语言类别，以便Typst自动进行语法高亮。

#code(`````typ
一段有高亮的代码片段：```javascript function uninstallLaTeX {}```

另一段有高亮的代码片段：````typst 包含反引号的长代码片段：``` ` ``` ````
`````)

除了定界符的长短，代码片段还有是否成块的区分。如果代码片段符合以下两点，那么它就是一个「块代码片段」：
+ 使用*至少连续*三个「反引号」作为长定界符。
+ 包含至少一个换行符。

#code(`````typ
将代码片段插入行内：你可以通过单独实现```rust trait World```为Typst编译器提供执行环境。

让代码自成一段：```js
function fibnacci(n) {
  return n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2);
}
```
`````)

// typ
// typc

== 列表

Typst的代码片段标记语法与Markdown非常类似，但不完全相同。如果你使用过Markdown，那么你将可以很快上手。

在Typst中，你可以使用一个的「减号」（`-`）开启一个无编号列表项，并使用缩进调整列表项等级：

#code(```typ
- 一级列表项1
  - 二级列表项1.1
    - 三级列表项1.1.1
  - 二级列表项1.2
- 一级列表项2
  - 二级列表项2.1
```)

与之相对，「加号」（`+`）开启一个有编号列表项，并可以与无编号列表项相混合。

#code(```typ
+ 一级列表项1
  - 二级列表项1.1
    + 三级列表项1.1.1
  - 二级列表项1.2
+ 一级列表项2
  - 二级列表项2.1
```)

和Markdown相同，Typst同样允许使用`1.`开启一个有编号列表项，并且可以从指定编号开始。

#code(```typ
1. 列表项1
1. 列表项2
1. 列表项3
```)

#code(```typ
4. 列表项4
+  列表项5
+  列表项6
```)

== 转义序列

你有时不希望使用Typst提供的语义标记，而是直接展示标记符号本身的真实内容。例如，你可能希望在段落中直接展示一个「下划线」，而非期望使用「下划线」赋予强调语义。这时你需要使用转义序列：

#code(````typ
在段落中直接使用下划线 >\_<！
````)

遵从了大部分语言的习惯，Typst使用「反斜杠」（`\`）转义特殊标记。下表给出了所有需要转义的字符：

#let escaped-sequences = (
  (`\\`, [\\]),
  (`\#`, [\#]),
 (`\\`, [\\]), (`\/`, [\/]), (`\[`, [\[]), (`\]`, [\]]), (`\{`, [\{]), (`\}`, [\}]), (`\#`, [\#]), (`\*`, [\*]), (`\_`, [\_]), (`\+`, [\+]), (`\=`, [\=]), (`\~`, [\~]), 
(```\` ```, [\`]), (`\$`, [\$]), (`\"`, [\"]), (`\'`, [\']), (`\<`, [\<]), (`\>`, [\>]), (`\@`, [\@]), (`\(`, [\(]), (`\)`, [\)]), (`\A`, [\A]),
)

#let mk-tab(seq) = {
  set align(center)
  let u = it => raw(it.at(0).text, lang: "typ")
  let ovo = it => it.at(1)
  let w = 10
  table(
    columns: w + 2,
    [代码], ..seq.slice(w * 0, w * 1).map(u), u((`\u{cccc}`, [\u{cccc}])),
    [效果], ..seq.slice(w * 0, w * 1).map(ovo), [\u{cccc}], 
    [代码], ..seq.slice(w * 1, w * 2).map(u),u((`\u{cCCc}`, [\u{cCCc}])),
    [效果], ..seq.slice(w * 1, w * 2).map(ovo),  [\u{cCCc}], 
    [代码], ..seq.slice(w * 2).map(u), [], [], [], [], [], [], u((`\u{2665}`, [\u{2665}])),
    [效果], ..seq.slice(w * 2).map(ovo), 
   [], [], [], [], [],  [],  [\u{2665}]
  )
}

#mk-tab(escaped-sequences)

以上大部分转义序列都紧跟一个单字符，除了表中的最后一列。`\u{unicode}`的语法常见于各种语言。你可以通过将`unicode`替换为#link("https://zh.wikipedia.org/zh-cn/%E7%A0%81%E4%BD%8D")[Unicode码位]的值，以输出该特定字符，而无需*输入法支持*。例如，你可以这样输出一句话：

#code(````typ
\u{9999}\u{8FA3}\u{725B}\u{8089}\u{7C89}\u{597D}\u{5403}\u{2665}
````)

如此诸多转义序列无需死记硬背，你只需要记住，如果你希望录入一个字符，但是：
+ 其在Typst中已经被赋予含义，请尝试在字符前添加一个反斜杠。
+ 其不可见或难以使用输入法获得，请考虑使用`\u{unicode}`。

== 换行符

换行符是一种特殊的转义序列。

使用「反斜杠」（`\`）加上任意一个空白字符，表示在此处主动插入一个段落内的换行符：

#code(````typ
转义空格可以换行 \	转义回车也可以换行 \
换行！
````)

空白字符一般取短空格、长空格、回车等。

== 注释

Typst采用C语言风格的注释语法。

Typst语言的注释有两种表示方法。

第一种写法是将注释放在「双斜杠」（`//`）后面，从双斜杠到行尾都属于注释。

#code(````typ
// 这是一行注释
一行文本 // 这也是注释
````)

与代码片段的情形类似，Typst也提供了另外一种格式的注释`/*...*/`。

#code(````typ
你没有看见/* 混入其中 */注释
````)

值得注意的是，Typst会将行注释从源码中剔除后再解释你的文档，因此它们对文档没有影响。

以下两个段落等价：

#code(````typ
注释不会
// 这是一行注释 // 注释内的注释还是注释
插入换行 // 这也是注释

注释不会
插入换行
````)

以下三个段落等价：

#code(````typ
注释不会/* 混入其中 */插入空格

注释不会/*
混入其中
*/插入空格

注释不会插入空格
````)