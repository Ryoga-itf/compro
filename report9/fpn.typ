#import "/report-template/template.typ": *
#import "@preview/codelst:2.0.1": sourcecode, sourcefile

#show: project.with(
  week: 2,
  authors: (
    (
      name: sys.inputs.STUDENT_NAME,
      id: sys.inputs.STUDENT_ID,
      affiliation: "情報科学類2年"
    ),
  ),
  date: "7 月 4 日",
)

= 課題2

課題を行う上で自分の PC を用いた。GCC のバージョンは 12.2.0 である。詳細を以下に示す。

#sourcecode[```
  $ gcc --version           
  gcc (Debian 12.2.0-14) 12.2.0
  Copyright (C) 2022 Free Software Foundation, Inc.
  This is free software; see the source for copying conditions.  There is NO
  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```]

以下に課題 1 で作成したソースコードを示す。

#sourcefile(read("bitseq.c"), file:"bitseq.c")

当初 `printf` のフォーマット指定子に `%032b` を指定して実装したが、コンパイル時に Warning が出たため、各 bit を見て出力するような実装をした。

出力を以下に示す。

#sourcecode[```
  00000000000000000000000000000000
  0|00000000|00000000000000000000000
  ---
  00000000000000000000000000000001
  0|01111111|00000000000000000000000
  ---
  00000000000000000000000000000010
  0|10000000|00000000000000000000000
  ---
  00000000000000000000000000000011
  0|10000000|10000000000000000000000
  ---
  00000000000000000000000000000100
  0|10000001|00000000000000000000000
  ---
  00000000000000000000000000000101
  0|10000001|01000000000000000000000
  ---
  00000000000000000000000000000110
  0|10000001|10000000000000000000000
  ---
  00000000000000000000000000000111
  0|10000001|11000000000000000000000
  ---
```]

次に、$1.0 dots 7.0$ の float のビット表現についてそれぞれ検証をした。
なお、検証にあたっては https://siv3d.jp/web/sample/IEEE754Float32/IEEE754Float32.html を参考にした。

以下にそれをまとめる。

#let bit2int(binary) = {
  let result = 0
  while binary.len() > 0 {
    result = result.bit-lshift(1)
    result += int(binary.at(0))
    binary = binary.slice(1)
  }
  return result
}

#let describe(bitseq) = {
  let (sig2, e2, f2) = bitseq.split("|")
  let sig = bit2int(sig2)
  let e = bit2int(e2)
  let f = bit2int(f2)

  [
    ビット表現は #bitseq であるから、
    - 符号部は $#{sig2}_((2)) = #sig$
    - 指数部は $#{e2}_((2)) = #e$
    - 仮数部は $#{f2}_((2)) = #f$

    よって、これは $(-1)^(#sig) times 2^(#e - 127) times (1 + #f / #calc.pow(2, 23)) = #{calc.pow(-1, sig) * calc.pow(2, e - 127) * (1 + f / calc.pow(2, 23))}$
    であり、確かにこの値を表していることが確認できる。
  ]
}

=== 1.0
#describe("0|01111111|00000000000000000000000")
=== 2.0
#describe("0|10000000|00000000000000000000000")
=== 3.0
#describe("0|10000000|10000000000000000000000")
=== 4.0
#describe("0|10000001|00000000000000000000000")
=== 5.0
#describe("0|10000001|01000000000000000000000")
=== 6.0
#describe("0|10000001|10000000000000000000000")
=== 7.0
#describe("0|10000001|11000000000000000000000")
