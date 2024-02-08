#!/usr/bin/env bash
#
# Replace Hoppscotch, HTTPie and Postman with good old cURL.
# - https://developer.mozilla.org/en-US/docs/Web/HTTP
#
# @author rrednoss

set -Eeuo pipefail

#
# curl
#
# --header   Extra header to include in information to send.
#            HTTP:
#             - Accept:         Used to define the media type that the client is able to accept from the server.
#             - Authorization:  Used to send the client's credentials to the server when attempting to access a protected resource.
#                               - Basic Authentication: $ echo -n "user:pass" | base64
#             - Cache-Control:  Used to control caching behavior in the client’s browser or intermediate caches.
#             - Content-Length: Used to specify the size of the response body in bytes, which can help to anticipate how much data to receive.
#             - Content-Type:   Used to identify the media type of the content in the request body.
#             - Cookie:         The client can use the Cookie header to send previously stored cookies back to the server. 
#             - Server:         The Server header includes the name and version of the server software that generated the response.
#             - Set-Cookie:     Used to instruct the client to store a cookie with the specified name, value, and additional attributes.
#             - User-Agent:     Used to identify the web browser or client application, that is making the request.
#
# --location If the server reports the requested resource has moved to another location, redo the request on the new place.
# 
# --request  Change the method to use when starting the transfer.
#            HTTP:
#             - CONNECT         Establishes a tunnel to the server identified by the target resource.
#             - DELETE          Deletes the specified resource.
#             - GET             Requests a representation of the resource.
#             - HEAD            Asks for a response identical to a GET request, but without the request body.
#             - OPTIONS         Describes the communication options for the target resource.
#             - PATCH           Applies partial modifications to a resource.
#             - POST            Submits an entity to the specified resource, often causing a change in state or side effects on the server.
#             - PUT             Replaces all current representations of the target resource with the request payload.
#             - TRACE           Performs a message loop-back test along the path to the target resource.
# 
# --silent   Silent or quite mode. Do not show progress meter or error messages.
#
# --url      Specify a URL to fetch.
# 
# --verbose, Useful for debugging and seeing what's going on "under the hood".
#


echo "select the request to execute:"
echo " 0: GET https://echo.hoppscotch.io"
echo " 1: PUT https://echo.hoppscotch.io"
echo ""
read req

case "${req}" in
  0)
    curl \
      --location \
      --request GET \
      --silent \
      --url https://echo.hoppscotch.io | jq
    ;;
  1)
    curl \
      --location \
      --request PUT \
      --silent \
      --url https://echo.hoppscotch.io | jq
    ;;
  *)
    echo "no request selected"
    exit 1
    ;;
esac

