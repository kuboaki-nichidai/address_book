# frozen_string_literal: true

s = gets # .chomp
p s

def run
  loop do
    print '処理を選択します。
1. 蔵書データの一覧
2. 蔵書データの登録
3. 蔵書データの削除
9. 終了
番号を選んでください(1,2,3,9): '
    num = gets(chomp: true)
    case num
    when '1'
      p 'list_books'
    when '2'
      p 'regist_book'
    when '3'
      p 'delete_book'
    when '9'
      p 'exit'
      break
    end
  end
end

run
