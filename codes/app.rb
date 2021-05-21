# frozen_string_literal: true

require 'pstore'

class Contact
  attr_accessor :id, :name, :zip, :address, :email

  def initialize(id, name, zip, address, email)
    @id = id
    @name = name
    @zip = zip
    @address = address
    @email = email
  end
end

class AddressBook
  def initialize(dbfile)
    @address_db = PStore.new(dbfile)
    puts "連絡先データベースファイル#{dbfile}を開きました。"
  end

  def register_contact
    print '登録したい連絡先のIDを入力してください: '
    id = $stdin.gets(chomp: true)
    @address_db.transaction do
      if @address_db.root?(id)
        puts "#{id}はすでに登録されています。"
        return
      end
    end
    print '氏名: '
    name = $stdin.gets(chomp: true)
    print '郵便番号: '
    zip = $stdin.gets(chomp: true)
    print '住所: '
    address = $stdin.gets(chomp: true)
    print 'eメール: '
    email = $stdin.gets(chomp: true)
    contact = Contact.new(id, name, zip, address, email)
    @address_db.transaction do
      @address_db[id] = contact
      puts  "#{id}を登録しました。"
    end
  end

  def unregister_contact
    print '抹消したい連絡先のIDを入力してください: '
    id = $stdin.gets(chomp: true)
    @address_db.transaction do
      if @address_db.root?(id)
        contact = @address_db.fetch(id)
        print_one_contact(contact)
        print '削除しますか？(y/n) '
        yesno = $stdin.gets(chomp: true).upcase[0]
        if yesno == 'Y'
          @address_db.delete(id)
          puts '削除しました。'
        else
          puts '削除を中止しました。'
        end
      else
        puts "#{id}はみつかりません。"
      end
    end
  end

  def print_one_contact(contact)
    puts "ID: #{contact.id}"
    puts "氏名: #{contact.name}"
    puts "郵便番号: #{contact.zip}"
    puts "住所: #{contact.address}"
    puts "eメール: #{contact.email}"
    puts '------'
  end

  def print_contacts
    @address_db.transaction do
      ids = @address_db.roots
      ids.each do |id|
        contact = @address_db.fetch(id)
        print_one_contact(contact)
      end
    end
  end

  def run
    loop do
      print '処理を選択します。
1. 連絡先の一覧
2. 連絡先の登録
3. 連絡先の削除
9. 終了
番号を選んでください(1,2,3,9): '
      num = $stdin.gets(chomp: true)
      case num
      when '1'
        print_contacts
      when '2'
        register_contact
      when '3'
        unregister_contact
      when '9'
        exit
      end
    end
  end
end
