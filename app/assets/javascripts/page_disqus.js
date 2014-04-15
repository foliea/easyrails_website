var loadDisqus = function() {
  var disqus_thread = $('#disqus_thread');

  if (!disqus_thread[0]) return;

  var disqus_shortname = disqus_thread.data('disqusShortname');
  var disqus_url = disqus_thread.data('disqusUrl');
  var disqus_identifier = disqus_thread.data('disqusIdentifier');

  var dsq = document.createElement('script');
      dsq.type = 'text/javascript';
      dsq.async = true;
      dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
  (document.getElementsByTagName('head')[0] ||
   document.getElementsByTagName('body')[0]).appendChild(dsq);
};

$(document).ready(loadDisqus);
$(document).on("page:load", loadDisqus);
