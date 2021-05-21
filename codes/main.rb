# frozen_string_literal: true

require_relative 'app'

abort "usage: ruby #{$PROGRAM_NAME} db_file" if ARGV.empty?
addressbook = AddressBook.new(ARGV[0])
addressbook.run
