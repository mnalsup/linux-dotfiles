(function() {
  /* segment.io loader */
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("u7y09b0olq");

  if (window.location.hostname != "developer.atlassian.com") return;

  var pixelRatio = (window.devicePixelRatio >= 1.5) ? "high" : "normal";
  window.analytics.page({
    "Pixel Ratio": pixelRatio,
    site: "developer.atlassian.com"
  });

  window.analytics.trackClick($('.sliding-nav-list-large a'), logNavClick, {
    page: window.location.href
  });

  function logNavClick(ele) {
    return 'Navigated to ' + ele.innerText + ' from the sliding menu.';
  }

  /* */
  jQuery(function(){
    jQuery('a[href^="https://my.atlassian.com"]').click(function(){
      console.log('tracking');
      window.analytics.track("Outbound Links", {target: "my.atlassian.com"});
      setTimeout('document.location = "' + this.href + '"', 100);
      return false;
    });
  });
})();
