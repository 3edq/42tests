#!/bin/bash

echo "Hello World!" > infile

# テストケース 1: 正常な動作
echo "Test 1 - Valid input executed with Bash"
./pipex infile "cat -e" "wc -l" outfile

# テストケース 2: 存在しない入力ファイル
echo "Test 2 - Nonexistent infile executed with Bash"
./pipex nonexistentfile "cat -e" "wc -l" outfile

# テストケース 3: 入力ファイルに読み取り権限がない
chmod 000 infile
echo "Test 3 - Infile without read permission executed with Bash"
./pipex infile "cat -e" "wc -l" outfile
chmod 644 infile

# テストケース 4: 出力ファイルに書き込み権限がない
chmod 000 outfile
echo "Test 4 - Outfile without write permission executed with Bash"
./pipex infile "cat -e" "wc -l" outfile
chmod 644 outfile

# テストケース 5: 存在しないコマンド
echo "Test 5 - Invalid command in cmd1"
./pipex infile "nonexistentcommand" "wc -l" outfile

# テストケース 6: コマンドに空文字
echo "Test 6 - Empty command in cmd1"
./pipex infile "" "wc -l" outfile

# テストケース 7: 入力ファイルが空の場合
> infile
echo "Test 7 - Empty infile executed with Bash"
./pipex infile "cat -e" "wc -l" outfile

# テストケース 8: 存在しないパスの指定
echo "Test 8 - Nonexistent path specified for commands"
./pipex infile "/nonexistent/path/to/cat -e" "/nonexistent/path/to/wc -l" outfile

# テストケース 9: PATH unset with nonexistent path specified for commands
echo "Test 9 - PATH unset with nonexistent path specified for commands (pipex)"
unset PATH
./pipex infile "/nonexistent/path/to/cat -e" "/nonexistent/path/to/wc -l" outfile 2> error.log
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
cat error.log

# クリーンアップ
rm -f infile outfile
