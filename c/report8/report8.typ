#import "/report-template/template.typ": *
#import "@preview/codelst:2.0.0": sourcecode, sourcefile

#show: project.with(
  week: 1,
  authors: (
    (
      name: sys.inputs.STUDENT_NAME,
      id: sys.inputs.STUDENT_ID,
      affiliation: "情報科学類2年"
    ),
  ),
  date: "6 月 27 日",
)

= 課題1

本課題は講義資料で示された Hello World プログラムを入力し、期待通りに動作することを確認するという課題である。
課題を行う上で自分の PC を用いた。GCC のバージョンは 12.2.0 である。詳細を以下に示す。

#sourcecode[```
  $ gcc --version           
  gcc (Debian 12.2.0-14) 12.2.0
  Copyright (C) 2022 Free Software Foundation, Inc.
  This is free software; see the source for copying conditions.  There is NO
  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```]

まず、以下に示す内容の `hello.c` ファイルを作成した。

#sourcefile(read("hello.c"), file:"hello.c")

次に、以下に示す手順で GCC コンパイラを用いて `hello.c` ファイルをコンパイルし、`hello.out` 実行可能ファイルを生成し実行を行った。

#sourcecode[```
  $ gcc hello.c -o hello.out
  $ ./hello.out
  Hello World!
```]

期待通りに動作することが確認できた。

= 課題2

本課題は課題 1 で作成したプログラムに対してプリプロセッサで処理をし、`printf` に関連する内容を見つけ、そこから読み取れることを説明するというものである。

以下に示す手順を用いてプリプロセッサで処理を行い、結果として `hello_preprocessed.c` ファイルを得た。

#sourcecode[```
  $ cpp hello.c -o hello_preprocessed.c
```]

`printf` に関連する内容として以下の行が見つかった。

#sourcecode[```c
  extern int printf (const char *__restrict __format, ...);
```]

ここから読み取れることとして、`printf` の戻り値は `int` であり、関数の外部参照を表していることがわかる。
また、引数について以下のようなことが読み取れる。

- `const char *__restrict __format`
  - 最初の引数は文字列 (`const char*` 型) であり、`__restrict` 修飾子によってコンパイラに対してポインタが他のポインタと重ならないことが保証されている。
  - また、引数の名前は `__format` であることがわかる。
- `...`
  - 可変長引数を示す
  - 任意の数の追加引数を受け取ることができることがわかる

= 課題3

本課題は課題 1 で作成したプログラムをコンパイルした結果のアセンブリ言語プログラムを観察し、そこから読み取れることを説明するというものである。

講義資料では `cc1` コマンドが紹介されていたが課題を行った環境にはなかったため、同じ結果を得られる GCC コンパイラに `-S` オプションを渡したものを用いた。
具体的には以下に示すコマンドを実行して、`hello.s` ファイルを得た。

#sourcecode[```
  $ gcc -S hello.c -o hello.s
```]

`hello.s` ファイルの内容を以下に示す。

#sourcefile(read("hello.s"), file:"hello.s")

結果を観察すると、処理の他にコンパイラの識別情報などが含まれていることがわかる。

また、`printf` に相当する部分は以下のようになっていることがわかる
- `leaq .LC0(%rip), %rax` で `Hello World!` 文字列のアドレスを計算して、レジスタ `%rax` にロード
- `movq %rax, %rdi` でそれをさらに `%rdi` レジスタに移動
- `call puts@PLT` で `puts` 関数を呼び出し標準出力に表示
