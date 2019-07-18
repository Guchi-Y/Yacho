class Scraping

  def self.get_bird_name
    mecha = Mechanize.new
    page = mecha.get("https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E9%87%8E%E9%B3%A5%E4%B8%80%E8%A6%A7")
    page.search('dd li a').each do |ele|
      name = ele.inner_text
      bird = Bird.where(name: name).first_or_initialize
      bird.save
    end
  end
  
end