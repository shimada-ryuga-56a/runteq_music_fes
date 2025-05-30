# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: 'RUNTEQ MUSIC FES',
      title: 'RUNTEQ音楽祭 特設WEBアプリ',
      reverse: true,
      charset: 'utf-8',
      description: '5月17日に東京で開催されるRUNTEQ音楽祭の特設WEBアプリです。',
      keywords: 'RUNTEQ,オフ会,東京',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
