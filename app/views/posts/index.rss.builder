#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Codingfish"
    xml.author "Achim Fischer"
    xml.description "Software-Development, Mobiles Devices, Photography"
    xml.link "https://www.codingfish.com"
    xml.language "en"

    for post in @posts
      xml.item do
        if post.title
          xml.title post.title
        else
          xml.title ""
        end
        xml.author "Achim Fischer"
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link "https://www.codingfish.com/blog/" + post.id.to_s + "-"
        xml.guid post.id

        description = post.description
		# if you like, do something with your content description here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        # if post.image.exists?
        #     image_url = post.image.url(:large)
        #     image_caption = post.image_caption
        #     image_align = ""
        #     image_tag = "
        #         <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
        #       "
        #     description = description.sub('{image}', image_tag)
        # end
        xml.description "<p>" + description + "</p>"

      end
    end
  end
end
