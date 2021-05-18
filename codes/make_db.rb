# frozen_string_literal: true

require 'pstore'
require_relative 'bookinfo'

bookinfo1 = BookInfo.new('fujii2019', 'アフターデジタル', '藤井、尾原', 2019, '9784296101627')
bookinfo2 = BookInfo.new('udagawa2019', '他社と働く', '宇田川', 2019, '9784910063010')
bookinfo3 = BookInfo.new('asai2019', '実践的ソフトウェア工学 第2版', '浅井', 2019, 'B07QMQ72YY(ASIN)')

dbfile = 'mybook.db'

File.delete(dbfile)

db = BookInfoDB.new(dbfile)
db.add(bookinfo1)
db.add(bookinfo2)
db.add(bookinfo3)

puts db.list
