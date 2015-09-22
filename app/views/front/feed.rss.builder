#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @site.title
    xml.description @site.description
    xml.link @site.url
    xml.language "en"
    xml.link (@site.url + "/" + "feed.rss")

    for article in @posts
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link @site.url + "/" + article.slug
        xml.guid @site.url + "/" + article.slug

		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        if article.image
            image_url = @site.url + article.image.url
            image_caption = article.title
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + "' /></p>
              "
            text = image_tag
        end
        xml.description strip_tags(article.short_description)

      end
    end
  end
end