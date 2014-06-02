jQuery(function() {
  jQuery.getJSend = function(url, data, success) {
    var dfd = jQuery.Deferred()
    jQuery.getJSON(url, data, success).
      done(function(data, status, xhr) {
        if (data.status == 'success') {
          dfd.resolve(data.data)
        } else if (data.status == 'fail') {
          dfd.reject(data.data)
        } else if (data.status == 'error') {
          console.log("JSend error [" + (data.code || '-') + "]: " + data.message + "(" + JSON.stringify(data.data) +
                      ")")
        } else {
          console.log("Unknown JSend status " + data.status)
        }
      }).
      fail(function(xhr, status, error) {
        console.log("Ajax error [" + status + "]: " + error)
      });
    return dfd.promise();
  }
});
