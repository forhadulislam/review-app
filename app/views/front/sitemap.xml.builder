xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url{
      xml.loc(@site.url)
      xml.changefreq("daily")
      xml.priority(1.0)
  }
  @categories.each do |category|
    xml.url {
      xml.loc @site.url + "/category/" + category.slug
      xml.lastmod category.updated_at.strftime("%F")
      xml.changefreq("weekly")
      xml.priority(0.5)
    }
  end
  @subCategories.each do |subcat|
    xml.url {
      xml.loc @site.url + "/" + subcat.category.slug + "/" + subcat.slug
      xml.lastmod subcat.updated_at.strftime("%F")
      xml.changefreq("daily")
      xml.priority(0.5)
    }
  end
  @reviews.each do |series|
    xml.url {
      xml.loc @site.url + "/" + series.slug
      xml.lastmod series.updated_at.strftime("%F")
      xml.changefreq("weekly")
      xml.priority(0.5)
    }
  end
end