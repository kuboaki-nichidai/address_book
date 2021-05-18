# frozen_string_literal: true

require_relative `app`


if $PROGRAM_NAME == __FILE__
  abort "usage: ruby #{$PROGRAM_NAME} db_file" if ARGV.empty?
  mybook = MyBook.new(ARGV[0])
  mybook.run
end
