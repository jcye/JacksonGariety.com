atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @contents.each do |item|
    next if item.updated_at.blank?

    if item.is_a?(Post)
      itemurl = post_url(item)
    elsif item.is_a?(Project)
      itemurl = item.link
    elsif item.is_a?(Video)
      itemurl = "http://player.vimeo.com/video/" + item.vimeo
    elsif item.is_a?(Photograph)
      itemurl = photograph_url(item)
    end

    feed.entry(item, :url => itemurl) do |entry|
      entry.author do |author|
        author.name("Jackson Gariety")
      end

      if item.is_a?(Post)
        entry.url post_url(item)
        entry.title item.title
        entry.content item.content, :type => 'html'
      elsif item.is_a?(Project)
        entry.url item.link
        entry.title item.title
        entry.content item.description
      elsif item.is_a?(Video)
        entry.url "http://player.vimeo.com/video/" + item.vimeo
        entry.title item.title
        entry.content "<iframe src=\"http://player.vimeo.com/video/" + item.vimeo + "\" width=\"660\" height=\"300\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe><p>" + (item.description || "") + "</p>", :type => 'html'
      elsif item.is_a?(Photograph)
        entry.url photograph_url(item)
        entry.title item.title
        entry.content "<img src=\"" + item.image_file.url + "\" />", :type => 'html'
      end
    end
  end
end