xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'Rubylab is OP'
    xml.author 'The Greatest Warrior'
    xml.description 'Software-Development, Mobiles Devices, Photography'
    xml.link 'https://localhost:3000'
    xml.language 'en'

    if @posts.any?
      @posts.each do |post|
        xml.item do
          if post.title
            xml.title post.title
          else
            xml.title ''
          end
          xml.author post.user.email
          xml.pubDate post.created_at.to_s(:rfc822)
          xml.link 'https://www.codingfish.com/blog/' + post.id.to_s + '-'
          xml.guid post.id

          description = post.description
          # if you like, do something with your content description here e.g. insert image tags.
          # Optional. I'm doing this on my website.
          if post.image.exists?
            image_url = post.image.url(:large)
            image_tag = "
                <p><img src='" + image_url + "' /></p>
              "
            description = description.sub('{image}', image_tag)
          end
          xml.description '<p>' + description + '</p>'
        end
      else
        "<p> There are no posts yet :,(</p>"
      end
    end
  end
end
