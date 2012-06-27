module Network.API.Twitter
       ( getResponse
       ) where

import Data.Maybe (fromJust)
import Network.OAuth.Consumer
import Network.OAuth.Http.Request
import Network.OAuth.Http.Response
import Network.OAuth.Http.CurlHttpClient
import Data.Aeson

import Network.API.Twitter.Shim
import Data.API.Twitter.Query
import Data.API.Twitter.QueryResponsePair

-- reqUrl = fromJust $ parseURL "https://api.twitter.com/oauth/request_token"
-- accUrl = fromJust $ parseURL "https://api.twitter.com/oauth/access_token"
-- srvUrl = fromJust $ parseURL "http://api.twitter.com/1/people/~"
-- authUrl = ("https://api.twitter.com/oauth/authorize?oauth_token="++) . findWithDefault ("oauth_token","ERROR") . oauthParams
-- app = Application "y7mcOjAr18BvMV5KVKNW0g" "uOP2Ij1IYBwVJYotgkWj11XvtUP5aStutQieczCnuo" OOB

-- tokenM :: IO Token
-- tokenM = runOAuthM (fromApplication app) $ do
--   ignite app
--   signRq2 HMACSHA1 Nothing reqUrl >>= oauthRequest CurlClient
--   cliAskAuthorization authUrl
--   signRq2 HMACSHA1 Nothing accUrl >>= oauthRequest CurlClient
--   getToken

-- response = do
--   token <- tokenM
--   runOAuthM token $ do
--     signRq2 HMACSHA1 Nothing srvUrl >>= serviceRequest CurlClient

getResponse :: ( QueryResponsePair q r
               , Query q
               , FromJSON r
               ) => q -> IO (Maybe r)
getResponse q = fmap (decode . rspPayload) $ sendRequest $ mkRequest q

-- |sendRequest signs an already-formed request with OAuth headers and
--  sends it using Curl.
sendRequest :: Request -> IO Response
sendRequest request = runOAuthM shimToken $ (signRq2 HMACSHA1 Nothing request >>= serviceRequest CurlClient)

-- |This function creates an HTTP request from any type in the Query
--  class.
mkRequest :: (Query q) => q -> Request
mkRequest query = baseURL { pathComps = toPathComps query
                          , qString = toQueryStr query
                          }

baseURL = fromJust $ parseURL $ "http://api.twitter.com/"
