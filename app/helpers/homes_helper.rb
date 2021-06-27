module HomesHelper

  def movie_title(type)
    case type
    when 'popular'
      '本日の世界のトレンド'
    when 'top_rated'
      '評価の高い映画'
    when 'now_playing'
      '上映中の映画'
    else
      '本日の世界のトレンド'
    end
  end

end
