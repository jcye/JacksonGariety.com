atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |item|
    next if item.updated_at.blank?

    feed.entry(item) do |entry|
      entry.author do |author|
        author.name("Jackson Gariety")
      end

      entry.url post_url(item)
      entry.title item.title
      entry.content item.content, :type => 'html'
    end
  end
end