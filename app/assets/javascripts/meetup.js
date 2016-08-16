$(document).ready(function() {
  function createCORSRequest(method, url) {
    var xhr = new XMLHttpRequest();

    if ("withCredentials" in xhr) {

      // Check if the XMLHttpRequest object has a "withCredentials" property.
      // "withCredentials" only exists on XMLHTTPRequest2 objects.
      xhr.open(method, url, true);

    } else if (typeof XDomainRequest != "undefined") {

      // Otherwise, check if XDomainRequest.
      // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
      xhr = new XDomainRequest();
      xhr.open(method, url);

    } else {

      // Otherwise, CORS is not supported by the browser.
      xhr = null;

    }
    return xhr;
  }

  function getApiData() {
    //TODO: Why is xhr empty?

    //var url = 'https://api.meetup.com/pitonneux/events'; //production
    var url = 'https://api.meetup.com/2/events?key=ABDE12456AB2324445&group_urlname=ny-tech&sign=true'; //test

    var xhr = createCORSRequest('GET', url);

    if (!xhr) {
      throw new Error('CORS not supported');
    }

    xhr.onload = function() {
      var allTheData = xhr.getResponseText;
      console.log("At least it loaded");
      return allTheData;
    };

    xhr.onerror = function() {
      //throw new Error('Woops, there was an error making the request.');
      throw new Error(xhr.statusText);
    };

    xhr.send();
  }

  var eventsList = getApiData();

  //TODO: Do stuff with data

});
