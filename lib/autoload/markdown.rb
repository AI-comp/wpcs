# -*- coding: utf-8 -*-

require 'redcarpet'

class Markdown

  def self.to_html(md)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
      superscript: true,
    }).render(md)
  end

  def self.example
<<EOL
Markdown
========

説明
--------
普通の文章
改行をこまめに入れると綺麗になるよ

### リスト
前後に空行を入れてね
入れ子はスペース4つで

* English
    * 1st
    * 2nd
    * 3rd
* Italiano
    * uno
    * due
    * tre
* 日本語
    * 漢字
        * 壱
        * 弐
        * 参

### 番号付きリスト
1. foo
2. bar
3. baz


### ブロック
バッククオート3つではさむとブロックで囲われる<br>
これも前後に空行をいれて

```
def fib(n)
  @memo = [1,1,2,3]
  @memo[n] || @memo[n] = fib(n-1) + fib(n-2)
end
```


### 画像

![](http://cedec.cesa.or.jp/2012/images/speakers/303.jpg)

でもサイズは指定できないから、その時は諦めてimgタグ使ってね

<img src="http://murooka.me/mr.png" width="100">


### 数式っぽいもの

* x^(2)+y^(2)=4
* fibonacci
     * f<sub>0</sub> = 1
     * f<sub>1</sub> = 1
     * f<sub>n</sub> = f<sub>n-1</sub> + f<sub>n-2</sub>


### 表

    Language   |      type      | compile | interpreter
:-------------:|----------------|:-------:|:------------:
 C             | weak, static   |   YES   |     NO
 Java          | strong, static |   YES   |     NO
 ruby          | weak, dynamic  |    NO   |    YES
 Coffee Script | weak, dynamic  |   YES   |     NO
 Scala         | strong, static |   YES   |    YES


### リンク

[3Dげーむ](http://murooka.me/2/pc.html)


### 引用

> すげぇ！<br>
> マジパネェ
EOL
  end

end
