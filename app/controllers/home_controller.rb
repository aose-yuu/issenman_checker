class HomeController < ApplicationController
  def index
    session[:ref] = nil
  end

  def result
    if request.path_info != session[:ref]
      session[:ref] = request.path_info
      @top_page = root_url(only_path: false)
      sentence = Sentence.new(content: params[:content])
      @num = 0
      @nensyu = nil
      @message1 = nil
      @message2 = nil
      @message3 = nil
      count = 0
      words = Word.all
      simoneta = ['にゃーん', 'おっぱい', 'ちんちん']

      if sentence.content.length == 0
        redirect_to controller: :home, action: :index
      end

      words.each do |word|
        if sentence.content.include?(word.content)
          count += 1
        end
      end

      @num = count * 3

      if @num < 20
        @nensyu = 'ヒャクマン'
        @message1 = 'まだまだ修行が足りません。'
        @message2 = '年収イッセンマンになるためには著名人の有益な本を捨て、インフルエンサーの訳の分からない情報商材を買って駆け出しエンジニアと繋がりたいと呟きましょう。'
        @message3 = 'いつか年収イッセンマンの自称マーケター×エンジニアになれるはずです。'

      elsif @num >= 20 && @num < 30
        @nensyu = 'ニヒャクマン'
        @message1 = '絵文字の多さは意識の高さ。'
        @message2 = '最初から何でもかんでも同時進行で始めてしまい、結果的に何も身につかず「自分には向いていない」と言い訳していては、年収イッセンマンにはなれません。'
        @message3 = 'よくある情報の薄い図解ツイートを参考に、意識高い系を目指しましょう。'

      elsif @num >= 30 && @num < 40
        @nensyu = 'サンビャクマン'
        @message1 = '「もしかして：プログラミング　稼げる」'
        @message2 = 'インフルエンサーの怪しいオンラインサロンに入会するだけで自己満足して行動に移さないあなたは、誰からも重宝される優良なカm…顧客です。'
        @message3 = 'スクール選びよりも、まずはプロフィールをクッサイ経歴で武装しましょう。'

      elsif @num >= 40 && @num < 50
        @nensyu = 'ヨンヒャクマン'
        @message1 = '＃仕事観変わった, ＃迷っている人に見てほしい '
        @message2 = 'SNSのFF比率に固執してフォローと解除を何度も繰り返し行う自己顕示欲モンスターのあなたは、自己主張強めなスパム寄りのハッシュタグマスターです。'
        @message3 = '見せかけの数字に惑わされず、盛った月収報告を定期的につぶやきましょう。'

      elsif @num >= 50 && @num < 60
        @nensyu = 'ゴヒャクマン'
        @message1 = 'まだ引き返せます。'
        @message2 = '押さえきれない承認欲求と自己顕示欲が肥大化し、毎日テンプレ自己啓発ツイートを欠かさないあなたは、まるで「いいね！」を欲する生ける屍のようです。'
        @message3 = '今すぐSNSのアカウントを削除すれば、元通りの生活を過ごせるでしょう。'

      elsif @num >= 60 && @num < 70
        @nensyu = 'ロッピャクマン'
        @message1 = '今日から駆け出しインフルエンサーです。'
        @message2 = 'もはや引き返すことことのできない領域に踏み込んでしまったあなたは、口を開けば「年収イッセンマン！」と知らず知らずのうちに言ってしまうはずです。'
        @message3 = '次はオンラインサロンを作り、信者たちに独自教材を売りつけましょう。'

      elsif @num >= 70 && @num < 80
        @nensyu = 'ナナヒャクマン'
        @message1 = 'あなたの本気はこの程度ではないはずです。'
        @message2 = '最後の最後で存分に力を発揮できず、中途半端に終わってしまうのはあなたの悪い癖です。嘘です。ここまで登り詰めたのは他の誰でもない、あなた自身です。'
        @message3 = '自信をもち、口触りの良いセリフを思いつく限り並べてFIREを狙いましょう。'

      elsif @num >= 80 && @num < 90
        @nensyu = 'ハッピャクマン'
        @message1 = 'FIREまであと少しです。'
        @message2 = 'GAFAやシリコンバレーという単語が大好きなあなたは、「Rubyはオワコン」「これからはAI！機械学習！」と他言語を蔑み、妄想を他人に押し付けがちです。'
        @message3 = 'くれぐれも気持ち善がってFIRE（炎上）しないように気をつけましょう。'

      elsif @num >= 90 && @num < 100
        @nensyu = 'キュウヒャクマン'
        @message1 = '惜しい！ゴールは目の前です。'
        @message2 = '多くの駆け出しエンジニアを都合の良い言葉で誘い、餌にしてきた貪欲なあなたは一人前の立派な詐g…インフルエンサーです。もう失うものは何もありません。'
        @message3 = 'ポジショントークを語り尽くして、年収イッセンマンを目指しましょう。'

      elsif @num >= 100
        @nensyu = 'イッセンマン'
        @message1 = 'おめでとうございます！'
        @message2 = 'ここまでクッサイ香ばしい文章を恥ずかしげもなく堂々と綴れるあなたは、マーケターでもエンジニアでもなく、もはやインフルエンサーを通り越した吟遊詩人です。'
        @message3 = 'これからも歩くポエムとして、毎日積み上げツイートを心がけましょう。'
      end

      simoneta.each do |simo|
        if sentence.content.include?(simo)
          @num = 1000
          @nensyu = 'イチオクエン'
          @message1 = 'あなたはつよつよのエンジニアです。'
          @message2 = '様々な苦難を乗り越えた結果、ありとあらゆる語彙力を失い下ネタか猫語しか言えなくなってしまったあなたは、間違いなくプロフェッショナルと言えるでしょう。'
          @message3 = '蔓延る胡散臭いインフルエンサーに惑わされない精神を大切にしてください。'
        end
      end

      @text = nil
      str = "年収#{@nensyu}！あなたの「年収イッセンマン度」は#{@num}点です。#{@message1}#{@message2}"
      if str.length >= 100
        @text = "#{str.slice(0, 110)}…"
      end

    else
      redirect_to action: :index
      session[:ref] = nil
    end
  end
end
