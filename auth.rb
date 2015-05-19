require 'yaml'
require 'pp'

class Client

# 各種キーをセット
  def confirm

    yaml = YAML.load_file('keys.yaml')

    # YAMLファイルからキーを配列で取り出す
    keysList = []
    i = 0
    yaml.each do |key|
      keysList[i] = key
      i += 1
    end


    j = 0
    @client = Twitter::REST::Client.new do |keys|
      keys.consumer_key        = keysList[j]; j += 1
      keys.consumer_secret     = keysList[j]; j += 1
      keys.access_token        = keysList[j]; j += 1
      keys.access_token_secret = keysList[j]
    end
  end

# タイムラインを取得
  def get

    i = 0
    usertweet = []

    @client.home_timeline.each do |status|
      usertweet[i] =
      [
        "user_name" => "#{status.user.name}",
        "screen_name" => "#{status.user.screen_name}",
        "text" => "#{status.text}"
        ]
      i += 1
    end
  end

end





=begin
# タイムラインを表示
  def viewer

  end
=end
