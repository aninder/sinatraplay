Sinatra by default uses the Rack::Protection gem which protects against a lot of common vulnerabilities.
You might be particularly interested in its session hijacking protection.
These are some of the things the Rack::Protection gem protects against:

Cross Site Request Forgery
Authenticity token: Only accepts unsafe HTTP requests if a given access token matches the token included in the session.
Form token: Only accepts submitted forms if a given access token matches the token included in the session. Does not expect such a token from Ajax request.
Remote token: Only accepts unsafe HTTP requests if a given access token matches the token included in the session or the request comes from the same origin.
JSON CSRF: JSON GET APIs are vulnerable to being embedded as JavaScript while the Array prototype has been patched to track data.
Checks the referrer even on GET requests if the content type is JSON.
Remote Referrer: Does not accept unsafe HTTP requests if the Referer [sic] header is set to a different host.

Cross Site Scripting
XSS Header: Sets X-XSS-Protection header to tell the browser to block attacks.
Clickjacking. Escaped Params: Automatically escapes Rack::Request#params so they can be embedded in HTML or JavaScript without any further issues.
Calls html_safe on the escaped strings if defined, to avoid double-escaping in Rails.

Clickjacking
Frame options: Sets X-Frame-Options header to tell the browser avoid embedding the page in a frame.

Directory Traversal
Unescapes '/' and '.', expands path_info. Thus GET /foo/%2e%2e%2fbar becomes GET /bar.

Session Hijacking
Tracks request properties like the user agent in the session and empties the session if those properties change.
This essentially prevents attacks from Firesheep. Since all headers taken into consideration might be spoofed, too,
this will not prevent all hijacking attempts.

IP Spoofing
Detect (some) IP spoofing attacks.

As is the case with most security related questions, it's a good idea to have a general knowledge of web security.
Unfortunately there are not a lot of good tutorials that address Sinatra security specifically.