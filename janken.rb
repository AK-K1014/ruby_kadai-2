def janken()
    puts "じゃんけん..."
    puts "0（グー）1（チョキ）2（パー）3（戦わない）"
  
    #じゃんけん
    $number = gets.to_s.chomp
    if $number == "0"
      puts "ホイ！"
      puts "----------------------------"
      puts "あなた：グー"
    elsif $number == "1"
      puts "ホイ！"
      puts "----------------------------"
      puts "あなた：チョキ"
    elsif $number == "2"
      puts "ホイ！"
      puts "----------------------------"
      puts "あなた：パー"
    elsif $number == "3"
      puts "あなた：ジャンケンをやめました"
    else 
      puts "0〜3の数字を選択してください"
    end
     
    if $number == "0" || $number == "1" || $number == "2"
      opponent_number = rand(0..2).to_s
      if opponent_number == "0"
        puts "あいて：グーを出しました"
      elsif opponent_number == "1"
        puts "あいて：チョキを出しました"
      else 
        puts "あいて：パーを出しました"
      end
    elsif $number == "3"
      puts "あいて：またジャンケンしましょう！"
    else
      puts "やり直しです"
    end
   
    if opponent_number == $number
      puts "あいこです"
      $case_pattern = "draw"
    elsif (opponent_number == "0" && $number == "2") || (opponent_number == "1" && $number == "0") || (opponent_number == "2" && $number == "1")
      puts "あなたの勝ちです"
      $case_pattern = "win"
    elsif (opponent_number == "0" && $number == "1") || (opponent_number == "1" && $number == "2") || (opponent_number == "2" && $number == "0")
      puts "あなたの負けです"
      $case_pattern = "lose"
    elsif $number == "3"
      $case_pattern = "quit"
    else
      $case_pattern = "mistake"
    end
  end
  
  #あっち向いてホイ
  def finger_pointing_game()
    puts "あっち向いて〜"
    puts "0（上）1（右）2（下）3（左）"
    $your_finger_or_face = gets.to_s.chomp
    if $your_finger_or_face == "0"
      puts "ホイ！"
      puts "----------------------------"
      puts "あなた：上"
    elsif $your_finger_or_face == "1"
      puts "ホイ！"
      puts "----------------------------"
      puts "あなた：右"
    elsif $your_finger_or_face == "2"
      puts "ホイ！"
      puts "----------------------------"
      puts "あなた：下"
    elsif $your_finger_or_face == "3"
      puts "ホイ！"
      puts "----------------------------"
      puts "あなた：左"
    else
      puts "0〜3の数字を選択してください"
    end
      
    $opponent_finger_or_face = rand(0..3).to_s
    if $opponent_finger_or_face == "0"
      puts "あいて：上"
    elsif $opponent_finger_or_face == "1"
      puts "あいて：右"
    elsif $opponent_finger_or_face == "2"
      puts "あいて：下"
    else 
      puts "あいて：左"
    end
    
    if ($your_finger_or_face == $opponent_finger_or_face) && ($case_pattern == "win")
      puts "あなたの勝ちです"
      $finger_pointing_game_pattern = "finish"
    elsif ($your_finger_or_face == $opponent_finger_or_face) && ($case_pattern == "lose")
      puts "あなたの負けです"  
      $finger_pointing_game_pattern = "finish"
    end
  end
  
  loop do 
    janken()
    puts $case_pattern
    puts "----------------------------"
  
    case $case_pattern
    when "win"
      finger_pointing_game()
      puts "----------------------------"
    when "lose"
      finger_pointing_game()
      puts "----------------------------"
    when "draw"
      janken()
      puts "----------------------------"
    when "mistake"
      janken()
      puts "----------------------------"
    end
    if ($finger_pointing_game_pattern == "finish") || ($number == "3")
      break
    end
  end