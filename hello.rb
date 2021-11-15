  require "csv"
 
    puts "1(新規でメモを作成) 2(既存のメモ編集する)"
      
    memo_type = gets.to_i #二択選択
    
    # //続きを書いていきましょう！！(ifで条件分岐)
    
    if memo_type == 1 #１が選択された場合
    
      puts "メモを新規作成します"
      puts "拡張子を除いたファイルを入力してください"
      file_name = gets.chomp.to_s #入力した値がファイル名に
      
      puts "メモしたい内容を入力してください"
      puts "完了したらCtrl + Dを押します"
      memo_contents   = $stdin.read #標準入力・メモ内容　
     
     #CSV.書き込みの命令
      CSV.open("#{file_name}.csv", "w") do |memo|
        memo << [memo_contents]
      end
    
    elsif memo_type == 2 #2が選択された場合
    
      puts "編集したいファイル名を入力してください(拡張子抜き)"
      file_name = gets.chomp.to_s #ファイル選択
      puts "中身表示"
      puts CSV.read("#{file_name}.csv")
      puts "_________________________"
      puts "追記内容を記入してください"
      puts "完了したらCtrl + Dを押します"
        
      memo_contents = $stdin.read #標準入力-複数行を「文字列」として読み取る。
        
      CSV.open("#{file_name}.csv", "a") do |memo|
      memo << [memo_contents]
      end
        
    else
      puts "1か2を選択してください"
    end