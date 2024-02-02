# = Google Adsense Helper
module AdsenseHelper
  # Parameters:
  #
  # client :: 16 digits
  # slot :: 10 digits
  # dimension :: "#{width}x#{height}", default is 336x280
  #
  # Example:
  #
  #   adsense_tag(client: 0000000000000000, slot: 1111111111, dimension: '336x280')
  #
  # Generated code:
  #
  #  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2161545441267586"
  #    crossorigin="anonymous"></script>
  # <!-- Pakflix -->
  # <ins class="adsbygoogle"
  #    style="display:block"
  #    data-ad-client="ca-pub-2161545441267586"
  #    data-ad-slot="1135382418"
  #    data-ad-format="auto"
  #    data-full-width-responsive="true"></ins>
  # <script>
  #   (adsbygoogle = window.adsbygoogle || []).push({});
  # </script>

  def adsense_tag(options = {})
    defaults = {dimension: "336x280"}
    options = options.to_h.reverse_merge(defaults).with_indifferent_access
    width, height = options[:dimension].split("x").to_a

    validate_options(options, width, height)

    tags = [
      content_tag(:script, "", async: "", src: "//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?ca-pub-#{options[:client]}"),
      content_tag(:ins, "", class: "adsbygoogle", style: "display:inline-block;width:#{width}px;height:#{height}px", "data-ad-client": "ca-pub-#{options[:client]}", "data-ad-slot": options[:slot], "data-ad-format": options[:format], "data-full-width-responsive": options[:responsive]),
      content_tag(:script, "(adsbygoogle = window.adsbygoogle || []).push({});")
    ]
    safe_join(tags)
  end

  private

  def validate_options(options, width, height)
    raise "Invalid ad client, should be 16 digits but was #{options[:client]}" unless options[:client].to_s[/^\d{16}$/]
    raise "Invalid ad slot, should be 10 digits but was #{options[:slot]}" unless options[:slot].to_s[/^\d{10}$/]
    raise "Invalid ad dimension, should be '#{width}x#{height}' but was '#{options[:dimension]}'" unless width.to_s[/^\d+$/] && height.to_s[/^\d+$/]
  end
end
