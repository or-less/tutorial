
== variable identifier

// `let`关键字后紧接着跟随一个#term("variable identifier")。标识符是变量的“名称”。「变量声明」后续的位置都可以通过标识符引用该变量。

// + 标识符以Unicode字母、Unicode数字和#mark("_")开头。以下是示例的合法变量名：
//   ```typ
//   // 以英文字母开头，是Unicode字母
//   #let a; #let z; #let A; #let Z;
//   // 以汉字开头，是Unicode字母
//   #let 这;
//   // 以下划线开头
//   #let _;
//   ```
// + 标识符后接有限个Unicode字母、Unicode数字、#mark("hyphen")和#mark("_")。以下是示例的合法变量名：
//   ```typ
//   // 纯英文变量名，带连字号
//   #let alpha-test; #let alpha--test;
//   // 纯中文变量名
//   #let 这个变量; #let 这个_变量; #let 这个-变量;
//   // 连字号、下划线在多种位置
//   #let alpha-; // 连字号不能在变量名开头位置
//   #let _alpha; #let alpha_; 
//   ```
// + 特殊规则：标识符仅为#mark("_")时，不允许在后续位置继续使用。
//   #code(```typ
//   #let _ = 1;
//   // 不能编译：#_
//   ```)
//   该标识符被称为#term("placeholder")。
// + 特殊规则：标识符不允许为`let`、`set`、`show`等关键字。
//   #code(```typ
//   // 不能编译：
//   // #let let = 1;
//   ```)

// 建议标识符简短且具有描述性。同时建议标识符中仅含英文与#mark("hyphen")。

== let statement

// 「变量声明」可以没有初始值表达式：

// #code(```typ
// #let x
// #repr(x)
// ```)

// 事实上，它等价于将`x`初始化为`none`。

// #code(```typ
// #let x = none
// #repr(x)
// ```)

// 尽管Typst允许你不写初始值表达式，本书还是建议你让所有的「变量声明」都具有初始值表达式。因为初始值表达式还告诉阅读你代码的人这个变量可能具有什么样的类型。

== expression

// === 逻辑比较表达式 <grammar-logical-cmp-exp>

// 数字之间可以相互（算术逻辑）比较，并产生布尔类型的表达式：

// - 小于：
//   #code(```typ
//   #(1 < 0), #(1 < 1), #(1 < 2)
//   ```)
// - 小于等于：
//   #code(```typ
//   #(1 <= 0), #(1 <= 1), #(1 <= 2)
//   ```)
// - 大于：
//   #code(```typ
//   #(1 > 0), #(1 > 1), #(1 > 2)
//   ```)
// - 大于等于：
//   #code(```typ
//   #(1 >= 0), #(1 >= 1), #(1 >= 2)
//   ```)
// - 等于：
//   #code(```typ
//   #(1 == 0), #(1 == 1), #(1 == 2)
//   ```)
// - 不等于：
//   #code(```typ
//   #(1 != 0), #(1 != 1), #(1 != 2)
//   ```)

// 不仅整数与整数之间、浮点数与浮点数之间可以做比较，而且整数与浮点数之间也可以做比较。当整数与浮点数相互比较时，整数会转换为浮点数再参与比较。
// #code(```typ
// #(1 != 0.), #(1 != 1.), #(1 != 2.)
// ```)

// 注意：不推荐将整数与浮点数相互比较，这有可能产生意料之外的浮点误差。
// #code(```typ
// #(9/1e160*1e160), #(9/1e160*1e160 == 9) \
// // 理论上为true，实际运算结果为false
// #(9/1e160/1e160*1e160*1e160), #(9/1e160/1e160*1e160*1e160 == 9)
// ```)

// === 逻辑运算表达式 <grammar-logical-calc-exp>

// 布尔值之间可以做逻辑运算，并产生布尔类型的表达式：
// - 非运算：
//   #code(```typ
//   #(not false), #(not true)
//   ```)
// - 或运算：
//   #code(```typ
//   #(false or false), #(false or true), #(true or false), #(true or true)
//   ```)
// - 且运算：
//   #code(```typ
//   #(false and false), #(false and true), #(true and false), #(true and true)
//   ```)

// 真值表如下：

// #{
//   set align(center)
//   table(columns: 5, stroke: 0.5pt, 
//     $p$, $q$, $not p$, $p or q$, $p and q$,
//     $0$, $0$, $1$, $0$, $0$,
//     $0$, $1$, $1$, $1$, $0$,
//     $1$, $0$, $0$, $1$, $0$,
//     $1$, $1$, $0$, $1$, $1$,
//   )
// }

// 逻辑运算使用起来很简单，建议入门的同学找一些专题阅读，例如#link("https://zhuanlan.zhihu.com/p/82986019")[数理逻辑（1）——命题逻辑的基本概念]。

// 一旦涉及到对复杂事物的逻辑讨论，你就可能陷入了知识的海洋。关于逻辑运算已经形成一门学科，如有兴趣建议后续找一些书籍阅读，例如#link("https://www.xuetangx.com/course/THU12011001060/19316572")[逻辑学概论]。

// 本书自然不负责教你逻辑学。

// === 算术运算表达式 <grammar-arith-exp>

// 数字之间可以做算术运算，并产生数字结果的表达式：

// - 取正运算：<grammar-plus-exp>
//   #code(```typ
//   #(+1), #(+0), #(++1)
//   ```)
// - 取负运算：<grammar-minus-exp>
//   #code(```typ
//   #(-1), #(-0), #(--1), #(-+-1)
//   ```)
// - 加运算：
//   #code(```typ
//   #(1 + 2), #(1 + 1), #(1 + -1), #(1 + -2)
//   ```)
// - 减运算：
//   #code(```typ
//   #(1 - 2), #(1 - 1), #(1 - -1), #(1 - -2)
//   ```)
// - 乘运算：
//   #code(```typ
//   #(1 * 2), #(2 * 2), #(2 * -2)
//   ```)
// - 除运算：
//   #code(```typ
//   #(1 / 2), #(2 / 2), #(2 / -2)
//   ```)

// 值得注意的是$-2^63$在Typst中是浮点数，这可能是Typst的bug：

// #code(```typ
// #type(-9223372036854775808)
// ```)

// 为了正常使用该整数值你需要强制转换：

// #code(```typ
// #int(-9223372036854775808), #type(int(-9223372036854775808))
// ```)

// 在日常生活中，我们还常用整除，如下方法实现了整除：

// #code(```typ
// #let fdiv(x, y) = int(x / y)
// #fdiv(3, 2), #fdiv(-12, 2), #fdiv(-12, 5) \
// // 或
// #int(3 / 2), #int(-12 / 2), #int(-12 / 5)
// ```)

// #pro-tip[
//   `calc.rem`函数帮你求解整除的余数：
//   #code(```typ
//   #let fdiv(x, y) = int(x / y)
//   $ 3 div & 2 = & #fdiv(  3, 2) & ...... & #calc.rem(  3, 2). \
//   -12 div & 2 = & #fdiv(-12, 2) & ...... & #calc.rem(-12, 2). \
//   -12 div & 5 = & #fdiv(-12, 5) & ...... & #calc.rem(-12, 5). $
//   ```)
// ]

// === 赋值表达式 <grammar-assign-exp>

// 变量可以被赋予一个表达式的值，所有的赋值表达式都产生`none`值而非返回变量的值。

// - 赋值及先加（减、乘或除）后赋值：
//   #code(```typ
//   #let a = 1
//   #repr(a = 10), #a, #repr(a += 2), #a, #repr(a -= 2), #a, #repr(a *= 2), #a, #repr(a /= 2), #a
//   ```)

// === 字符串相关的表达式

// 字符串相加表示字符串的连接：<grammar-string-concat-exp>

// #code(```typ
// #("a" + "b")
// ```)

// 字符串与数字相乘表示将该字符串重复$n$次后再连接：<grammar-string-mul-exp>

// #code(```typ
// #("a" * 4), #(4 * "ab")
// ```)

// 字符串之间的比较遵从#link("https://en.wikipedia.org/wiki/Lexicographic_order")[#term("lexicographical order")]。<grammar-string-cmp-exp>

// 等于和不等于的比较，比较每个字符是否相等：

// #code(```typ
// #("a" == "a"), #("a" != "a") \
// #("a" == "b"), #("a" != "b") \
// ```)

// 大于和小于的比较，从第一个字符开始依次比较，比较每个字符是否相等。直到第一个不相等的字符时作以下判断，字符的Unicode值较小的字符串则x相应更“小”：

// #code(```typ
// #("a" < "b"), #("a" > "a"),  \
// #("a" < "ba"), #("ac" < "ba"), #("aac" < "aba")
// ```)

// 若一直比到了其中一个字符串的尽头，则较短的字符串更“小”：

// #code(```typ
// #("a" < "ab")
// ```)

// 大于等于和小于等于的比较则将「相等性」纳入考虑：

// #code(```typ
// #("a" >= "a"), #("a" <= "a") \
// ```)