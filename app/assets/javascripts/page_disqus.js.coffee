loadDisqus = ->
  disqus_thread = $('#disqus_thread')

  return  unless disqus_thread[0]

  disqus_shortname = disqus_thread.data('disqusShortname')
  disqus_url = disqus_thread.data('disqusUrl')
  disqus_identifier = disqus_thread.data('disqusIdentifier')

  dsq = document.createElement('script')
  dsq.type = 'text/javascript'
  dsq.async = true
  dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js'
  (document.getElementsByTagName('head')[0] or
   document.getElementsByTagName('body')[0]).appendChild dsq
  return

$(document).ready loadDisqus
$(document).on 'page:load', loadDisqus
