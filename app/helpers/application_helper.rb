module ApplicationHelper
    def default_meta_tags
        {
          site: '年収イッセンマンチェッカー',
          title: '年収イッセンマンチェッカー',
          reverse: true,
          separator: '|',
          description: 'ディスクリプション',
          keywords: '年収1000万',
          canonical: request.original_url,
          noindex: ! Rails.env.production?,
          icon: [
            { href: image_url('favicon.png') },
            { href: image_url('180_180.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
          ],
          og: {
            site_name: '年収イッセンマンチェッカー',
            title: '年収イッセンマンチェッカー',
            description: '年収イッセンマンチェッカーは、入力された文章から「年収イッセンマン度」をチェックするツールです。ブラックジョークが多分に含まれているため、あくまでもネタの1つとしてお楽しみください。',
            type: 'website',
            url: request.original_url,
            image: image_url('twitter_header_rails.png'),
            locale: 'ja_JP',
          },
          twitter: {
            card: 'summary_large_image',
            site: '@aose_developer',
          }
        }
      end
end
