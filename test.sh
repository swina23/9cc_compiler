# テストコード
# 第１引数　期待値
# 第２引数　入力値
# コンパイラ(9cc)を実行してアセンブリファイルtmp.sを作る。（コンパイラとはアセンブリを出力するソフトウェア）
# tmp.sをアセンブルして実行ファイルtmpを作る。
# tmpを実行する。
# 実行結果が変数actualに代入される。

#!/bin/bash
try() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

try 0 0
try 42 42
# try 256 256
try 21 "5+20-4"
try 41 " 12 + 34 - 5 "

echo OK
