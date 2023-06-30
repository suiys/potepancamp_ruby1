require "csv"

puts "下記のいずれかの数字を選択してください\n1 (→ 新規でメモを作成する) / 2 (→ 既存のメモを編集する) >>"

memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください >>"
  file_name = gets.chomp
  if file_name.include?('.')
    puts "ファイル名が不正です"
  else
    puts "メモしたい内容を入力し、入力が完了したら Ctrl + D を押してください >>"
    input_contents = readlines(chomp: true)
    CSV.open("./#{file_name}.csv", "w") do |file|
      file << input_contents
    end
    puts "#{file_name}.csvを新規作成しました"
  end
elsif memo_type == 2
  puts "拡張子を除いたファイル名を入力してください >>"
  file_name = gets.chomp
  if file_name.include?('.')
    puts "ファイル名が不正です"
  else
    # 指定されたファイルが存在している場合は追記し、存在しない場合はプログラムを終了する
    if File.file?("./#{file_name}.csv")
      puts "追記したい内容を入力し、入力が完了したら Ctrl + D を押してください >>"
      input_contents = readlines(chomp: true)
      CSV.open("./#{file_name}.csv", "a") do |file|
        file << input_contents
      end
      puts "#{file_name}.csvに追記しました"
    else
      puts "指定されたファイルは存在しませんでした"
    end
  end
else
  puts "無効な操作です"
end
