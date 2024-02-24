#import "mod.typ": *

#show: book.page.with(title: [编写一篇基本文档])

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

== 内容块

有时，文档中会出现连续大段的标记文本。

#code(````typ
*从前有座山，山会讲故事，故事讲的是*

*从前有座山，山会讲故事，故事讲的是*

*...*

````)

这可行，但稍显麻烦。如下代码则显得更为整洁：

#code(````typ
#strong[
  从前有座山，山会讲故事，故事讲的是

  从前有座山，山会讲故事，故事讲的是

  ...
]
````)

例中，```typ #strong[]```这个内容的语法包含三个部分：
+ `#`进入「脚本模式」。
+ `strong`调用「着重」函数。
+ `[]`作为「内容块」标记一段内容，供`strong`使用。

本小节首先讲解「内容块」语法。

在语法中，中括号的部分被称为「内容块」。内容块的内容使用中括号包裹，如下所示：

#code(```typ
#[一段文本]#[两段文本] #[三段文本]
```)

内容块不会对其包裹的内容产生任何效果。当Typst见到一个内容块时，它仅仅是解析内部的文本作为内容块的内容。由于没有任何额外的操作，内部的文本被原封不动的插入到原地。

内容块的唯一作用就是“界定内容”。它收集一个或多个「内容」，以待后续使用。由于有了内容块，现在你可以*准确指定*一段内容，并用「脚本」加工。

Typst中所谓「脚本」，就是将原始内容通过各种方式转换、裁剪和重组，最终形成文档的执行过程。因为有了「脚本」，Typst才能有远超Markdown的排版能力，在许多情况下不逊于LaTeX排版，将来有望全面超越LaTeX排版。

在接下来两小节我们将看到Typst作为一门*编程语言*的核心设计，也是进行更高级排版必须要掌握的知识点。由于本节的目标仅仅是*编写一篇基本文档*，我们将会尽可能减少引入更多知识点，仅仅介绍其中最简单常用的语法。

== 解释模式

回顾「内容块」的语法：

#code(```typ
#[一段文本]
```)

在内容块前，还有一个「井号」（`#`）。「井号」不属于内容块的语法一部分，而是Typst中关于「脚本模式」的定界符。

Typst作为一个解释器会从头到尾「解释」你的文档。解释器有多种「解释模式」。不同的解释模式会以不同的语法规则解释你的文档。

默认情况下，文档处于「标记模式」（markup mode），所谓标记模式，就是允许你使用各种记号书写文档。在这个模式下，Typst几乎就和一个Markdown文档类似。你可以创建标题、列表、段落......

当Typst处于「标记模式」，且遇到一个「井号」时，Typst会立即将后续的一段文本认作「脚本」，即它进入了「脚本模式」（scripting mode）。

在「脚本模式」下，你可以转而*主要*计算各种内容。例如，你可以计算一个算式的「内容」：

#code(```typ
#(1024*1024*8*7*17+1)是一个常见素数。
```)

当处于「脚本模式」时，在*适当*的时候从「脚本模式」退回为「标记模式」。

特别地，当处于「脚本模式」时，你还可以通过「内容块」语法临时返回「标记模式」，以嵌套复杂的逻辑：

#code(```typ
#([== 脚本模式下创建一个标题] + [后接一段文本])
```)

如此反复，Typst就同时具备了方便文档创作与脚本编写的能力。

#pro-tip[
  是否可以直接像使用「星号」那样，直接将中括号包裹的一段作为内容块的内容？
  
  这是可以的，但是存在一些问题。例如，人们也常常在正文中使用中括号等标记，并甚至可能存在括号不匹配的情况：

  #code(```typ
  区间[1, ∞)上几乎所有有理数都可以表示为$x^x$，其中$x$是无理数。
  ```)

  如此，将「标记模式」下的左中括号（`[`）解析为普通文本看起来更为合理。
]

== 函数和函数调用

这里仅作最基础的介绍。在#(refs.scripting-base)[《基本字面量、变量和简单函数》]和#(refs.scripting-complex)[《复合字面量、控制流和复杂函数》]中，有对函数和函数调用更详细的介绍。

内容块本身没有任何作用，但是允许你进而标记大段内容供函数使用，而*不影响内容的书写*。

在Typst中，函数与函数调用同样归属「脚本模式」，所以在调用函数时，需要先使用「井号」让Typst先进入「脚本模式」。

与大部分语言相同的是，在调用Typst函数时，你可以向其传递以「逗号」分隔的内容，这些内容被称为参数。

#code(```typ
四的三次方为#calc.pow(4, 3)。
```)

这里```typ #calc.pow()```是内置的幂计算函数，其接受两个参数：
+ 一为`4`，为幂的底
+ 一为`3`，为幂的指数。

为了装饰内容，你可以使用函数修饰内容块。例如，你可以使用着重函数 #typst-func("strong") 标记一整段内容：

#code(```typ
#strong([
  And every _fair from fair_ sometime declines,
  
  By chance, or nature's changing course untrimm'd;

  But thy _eternal summer_ shall not fade,

  Nor lose possession of that fair thou ow'st;
])
```)

虽然示例很长，但请认真观察，它很简单。首先，中括号包裹的是一大段内容，在之前已经学到，这是一个「内容块」。因此#typst-func("strong")与幂函数没有什么不同，无非是接受了一个内容块作为参数。

类似地，#typst-func("emph")可以标记一整段内容为强调语义：

#code(```typ
#emph([
  And every *fair from fair* sometime declines,
  
  By chance, or nature's changing course untrimm'd;

  But thy *eternal summer* shall not fade,

  Nor lose possession of that fair thou ow'st;
])
```)

在许多的语言中，所有函数参数必须包裹在函数调用参数列表的「圆括号」之内。

#code(```typ
着重语义：这里有一个#strong([重点！])
```)

但在Typst中，如果将内容块作为参数，内容块可以紧贴在参数列表的「圆括号」之后。

#code(```typ
着重语义：这里有一个#strong()[重点！]
```)

特别地，如果参数列表为空，Typst允许省略多余的参数列表。

#code(```typ
着重语义：这里有一个#strong[重点！]
```)

所以，示例也可以写为：

#code(```typ
#strong[
  And every _fair from fair_ sometime declines,
]

#emph[
  And every *fair from fair* sometime declines,
]
```)

== 文字修饰

现在你可以使用更多的文本函数来丰富你的文档效果。

=== 背景高亮

你可以使用`highlight`高亮一段内容：

#code(```typ
#highlight[高亮一段内容]
```)

你可以传入`fill`参数以改变高亮颜色。

#code(```typ
#highlight(fill: orange)[高亮一段内容]
//         ^^^^^^^^^^^^ 具名传参
```)

这种传参方式被称为#(refs.scripting-base)[「具名传参」]。

=== 划线

你可以分别使用#typst-func("underline")、#typst-func("overline")、或#typst-func("strike")为一段内容添加下划线、上划线或中划线（删除线）：

#{
  set text(font: "Source Han Serif SC")
  code(```typ
平地翻滚：#underline[ጿኈቼዽጿኈቼዽ] \
施展轻功：#overline[ጿኈቼዽጿኈቼዽ] \
泥地打滚：#strike[ጿኈቼዽጿኈቼዽ] \
```)
}

值得注意地是，被划线内容需要保持相同字体才能保证线段同时处于同一水平高度。

#code(```typ
#set text(font: ("Linux Libertine", "Source Han Serif SC"))
下划线效果：#underline[空格 字体不一致] \
#set text(font: "Source Han Serif SC")
下划线效果：#underline[空格 字体一致] \
```)

该限制可能会在将来被解除。

#typst-func("underline")有一个很有用的`offset`参数，通过它你可以修改下划线相对于「基线」的偏移量：

#code(```typ
#underline(offset: 1.5pt, underline(offset: 3pt, [双下划线]))
```)

如果你更喜欢连贯的下划线，你可以设置`evade`参数。

#code(```typ
带驱逐效果：#underline[Language] \
不带驱逐效果：#underline(evade: false)[Language]
```)

=== 上下标

你可以分别使用#typst-func("sub")或#typst-func("super")将一段文本调整至下标位置或上标位置：

#code(```typ
下标：威严满满#sub[抱头蹲防] \
上标：香風とうふ店#super[TM] \
```)

你可以为上下标设置特定的字体大小：

#code(```typ
上标：香風とうふ店#super(size: 0.8em)[™] \
```)

你可以为上下标设置相对基线的合适高度：

#code(```typ
上标：香風とうふ店#super(size: 1em, baseline: -0.1em)[™] \
```)

== 文字属性

文本本身也有一些「具名参数」可供设置。与#typst-func("strong")和#typst-func("emph")类似，文本也有一个对应的元素函数#typst-func("text")。#typst-func("text")接受任意内容，返回一个影响内部文本的结果。

当输入是单个文本时很好理解，返回的就是一个文本元素：

#code(````typ
#text("一段内容")
````)

当输入是一段内容时，返回的是该内容本身，但是对于内容的中的每一个文本元素，都作相应文本属性的修改。下例修改了「代码片段」元素中的文本元素为红色：

#code(````typ
#text(fill: red)[```
影响块元素的内容
```]
````)

进一步，我们强调，其实际修改了缺省的文本属性。对比以下两个情形：

#code(````typ
#text[```typ #strong[一段内容] #emph[一段内容]```] \
#text(fill: red)[```typ #strong[一段内容] #emph[一段内容]```] \
````)

可以看见“红色”的设置仅对代码片段中的“默认颜色”的文本生效。当一个文本已经首先设置了颜色时，“红色”的设置不再生效。

这说明了为什么下列情形输出了蓝色的文本：

#code(````typ
#text(fill: red, text(fill: blue, "一段内容"))
````)

=== 设置大小

通过`size`参数，可以设置文本大小。

#code(```typ
#text(size: 12pt)[一斤鸭梨]
#text(size: 24pt)[四斤鸭梨]
```)

其中`pt`是点单位。中文排版中常见的#link("https://ccjktype.fonts.adobe.com/2009/04/post_1.html")[号单位]与点单位有直接换算关系：

#let owo = ([初号], [小初], [一号], [二号], [小二], [三号], [小三], [四号], [小四], [五号], [小五], [六号], [小六], [七号], [八号],)
#let owo2 = ([42], [36], [26], [22], [18], [16], [15], [14], [12], [10.5], [9], [7.5], [6.5], [5.5], [5],)
#let owo3 = ([42], [–], [27.5], [21], [–], [16], [–], [13.75], [–], [10.5], [–], [8], [–], [5.25], [4],)
#{
  set align(center)
  table(
    columns: 9,

    [字号], ..owo.slice(0, 8),
    [中国（单位：点）], ..owo2.slice(0, 8),
    [日本（单位：点）], ..owo3.slice(0, 8),

    [字号], ..owo.slice(8), [],
    [中国（单位：点）], ..owo2.slice(8),[],
    [日本（单位：点）], ..owo3.slice(8),
  )
}

另一个可用的常见单位是`em`：

#code(```typ
#text(size: 1em)[一斤鸭梨]
#text(size: 2em)[四斤鸭梨]
```)

```typc 1em```是当前设置的文字大小。

关于Typst中长度单位的详细介绍，可以挪步#(refs.ref-length)[《参考：长度单位》]。

=== 设置颜色

详见#(refs.ref-color)[《参考：颜色、渐变填充与模式填充》]。

你可以通过`fill`参数为文字配置各种颜色：

#code(```typ
#text(fill: red)[红色鸭梨]
#text(fill: blue)[蓝色鸭梨]
```)

你还可以通过颜色函数创建自定义颜色：

#code(```typ
#text(fill: rgb("ef475d"))[茉莉红色鸭梨]
#text(fill: color.hsl(200deg, 100%, 70%))[天依蓝色鸭梨]
```)

=== 设置字体

详见#(refs.misc-font-setting)[《字体设置》]。

你可以通过`font`参数为文字配置字体：

#code(```typ
#text(font: "FangSong")[北京鸭梨]
#text(font: "Microsoft YaHei")[板正鸭梨]
```)

你可以用逗号分隔的「列表」同时为文本设置多个字体。Typst按顺序优先使用靠前字体。例如可以同时设置西文为Times New Roman字体，中文为仿宋字体：

#code(```typ
#text(font: ("Times New Roman", "FangSong"))[中西Pear]
```)

== 「`set`」语法

详见#(refs.content-scope-style)[《内容、作用域与样式》]。

Typst允许你为元素的「具名参数」设置新的「默认值」，这个特性由「`set`」语法实现。

例如，你可以这样设置文本字体：

#code(```typ
#set text(fill: red)
红色鸭梨
```)

`set`关键字后跟随一个与函数调用相同语法的表达式，表示此后所有的元素都具有新的默认值。这比```typ #text(fill: red)[红色鸭梨]```要更易读。

默认情况下文本元素的`fill`参数为黑色，即文本默认为黑色。经过`set`规则，其往后的文本都默认为红色。

#code(```typ
黑色鸭梨
#set text(fill: red)
红色鸭梨
```)

之所以说它是默认值，是因为仍然可以在创建元素的时候指定参数值以覆盖默认值：

#code(```typ
#set text(fill: red)
#text(fill: blue)[蓝色鸭梨]
```)

本节前面讲述的所有「具名参数」都可以如是设置，例如文本大小、字体等。

== 图像

你可以通过#(refs.scripting-modules)[绝对路径或相对路径]加载一个图片文件：

#{
  show image: set align(center)
  set image(width: 40%)
  code(```typ
#image("/assets/files/香風とうふ店.jpg")
```)
}

#typst-func("image")有一个很有用的`width`参数，用于限制图片的宽度：

#{
  show image: set align(center)
  code(```typ
#image("/assets/files/香風とうふ店.jpg", width: 100pt)
```)
}

你还可以相对于父元素设置宽度，例如设置为父元素宽度的`50%`：

#{
  show image: set align(center)
  code(```typ
#image("/assets/files/香風とうふ店.jpg", width: 50%)
```)
}

同理，你也可以用`height`参数限制图片的高度。

#{
  show image: set align(center)
  code(```typ
#image("/assets/files/香風とうふ店.jpg", height: 100pt)
```)
}

当同时设置了图片的宽度和高度时，图片默认会被裁剪：

#{
  show image: set align(center)
  code(```typ
#image("/assets/files/香風とうふ店.jpg", width: 100pt, height: 100pt)
```)
}

如果想要拉伸图片而非裁剪图片，可以同时使用`fit`参数：

#{
  show image: set align(center)
  code(```typ
#image("/assets/files/香風とうふ店.jpg", width: 100pt, height: 100pt, fit: "stretch")
```)
}

`"stretch"`在英文中是拉伸的意思。

== 图形

你可以通过#typst-func("figure")函数为图像设置标题：

#{
  show image: set align(center)
  set image(width: 40%)
  code(```typ
#figure(image("/assets/files/香風とうふ店.jpg"), caption: [上世纪90年代，香風とうふ店送外卖的宝贵影像])
```)
}

#typst-func("figure")不仅仅可以接受#typst-func("image")作为内容，而是可以接受任意内容：

#{
  show raw: set align(left)
  code(````typ
#figure(```typ 
#image("/assets/files/香風とうふ店.jpg")
```, caption: [用于加载香風とうふ店送外卖的宝贵影像的代码])
````)
}

// == 标签与引用

// #code(```typ
// #set heading(numbering: "1.")
// == 一个神秘标题 <myst>

// @myst 讲述了一个神秘标题。
// ```)

== 链接

链接可以分为外链与内链。最简单情况下，你只需要使用#typst-func("link")函数即可创建一个链接：

#code(```typ
#link("https://zh.wikipedia.org")
```)

特别地，Typst会自动识别文中的HTTPS和HTTP链接文本并创建链接：

#code(```typ
https://zh.wikipedia.org
```)

无论是内链还是外链，你都可以额外传入一段*任意*内容作为链接标题：

#code(```typ
不基于比较方法，#link("https://zh.wikipedia.org/zh-hans/%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F")[排序]可以做到 $op(upright(O)) (n)$ 时间复杂度。
```)

请回忆，这其实等价于调用函数：

#code(```typ
#link("...")[链接] 等价于 #link("...", [链接])
```)

=== 内部链接

你可以通过创建标签，标记*任意*内容：

#code(```typ
== 一个神秘标题 <myst>
```)

上例中`myst`是该标签的名字。每个标签都会附加到恰在其之前的内容。这里即为一个标题。

你可以通过#typst-func("link")函数在文档中的任意位置链接到该内容：

#code(```typ
== 一个神秘标题 <mystery>

讲述了#link(<mystery>)[一个神秘标题]。
```)


== 表格基础

你可以通过#typst-func("table")函数创建表格。#typst-func("table")接受一系列内容，并根据参数将内容组装成一个表格。如下，通过`columns`参数设置表格为2列，Typst自动为你生成了一个2行2列的表格：

#code(```typ
#table(columns: 2, [111], [2], [3])
```)

你可以为表格设定对齐：

#code(```typ
#table(columns: 2, align: center, [111], [2], [3])
```)

其他可选的对齐有`left`、`right`、`bottom`、`top`、`horizon`等。详见#(refs.ref-layout)[《参考：布局函数》]

== 数学模式

#code(````typ
行内数学公式：$sum_x$

行间数学公式：$ sum_x $
````)

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

== 使用其他人的模板

虽然这是一片教你写基础文档的教程，但是为什么不更进一步？有赖于Typst将样式与内容分离，如果你能找到一个朋友愿意为你分享两行神秘代码，当你粘贴到文档开头时，你的文档将会变得更为美观：

#code(````typ
#import "latex-look.typ": latex-look
#show: latex-look

= 这是一篇与LaTeX样式更接近的文档

Hey there!

Here are two paragraphs. The
output is shown to the right.

Let's get started writing this
article by putting insightful
paragraphs right here!
+ following best practices
+ being aware of current results
  of other researchers
+ checking the data for biases

$
  f(x) = integral _(-oo)^oo hat(f)(xi)e^(2 pi i xi x) dif xi 
$
````)

一般来说，使用他人的模板需要做两件事：
+ 将`latex-look.typ`放在你的文档文件夹中。
+ 使用以下两行代码应用模板样式：

  ```typ
  #import "latex-look.typ": latex-look
  #show: latex-look
  ```

// set text font

== 总结

基于本节掌握的知识你应该可以：
+ 查看#(refs.ref-math-symbols)[《参考：常用数学符号》]，以助你编写简单的数学公式。

Todo：
+ 术语-翻译表
+ 本文使用的符号-标记对照表
+ 常用函数表和外部链接，用于增加广度。
