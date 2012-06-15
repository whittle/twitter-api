module Network.API.Twitter.Shim
       ( shimToken
       ) where

import Network.OAuth.Consumer (Token)
import Data.Binary (decode)
import Data.ByteString.Lazy.Char8 (pack)

shimToken :: Token
shimToken = decode $ pack shimStr

shimStr = "\STX\NUL\NUL\NUL\NUL\NUL\NUL\NUL\SYNy7mcOjAr18BvMV5KVKNW0g\NUL\NUL\NUL\NUL\NUL\NUL\NUL*uOP2Ij1IYBwVJYotgkWj11XvtUP5aStutQieczCnuo\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\ACK\NUL\NUL\NUL\NUL\NUL\NUL\NUL\auser_id\NUL\NUL\NUL\NUL\NUL\NUL\NUL\b22679264\NUL\NUL\NUL\NUL\NUL\NUL\NUL\vscreen_name\NUL\NUL\NUL\NUL\NUL\NUL\NUL\asighawk\NUL\NUL\NUL\NUL\NUL\NUL\NUL\SOoauth_verifier\NUL\NUL\NUL\NUL\NUL\NUL\NUL\a8810269\NUL\NUL\NUL\NUL\NUL\NUL\NUL\voauth_token\NUL\NUL\NUL\NUL\NUL\NUL\NUL222679264-TAVU4694pTsSTEttvuDQI52ryUyFAHt4yxc6udN07\NUL\NUL\NUL\NUL\NUL\NUL\NUL\DC2oauth_token_secret\NUL\NUL\NUL\NUL\NUL\NUL\NUL*C714hivzCDbXVq2oSG45d5UiUOPfNI3MqZJhOGZWtQ\NUL\NUL\NUL\NUL\NUL\NUL\NUL\CANoauth_callback_confirmed\NUL\NUL\NUL\NUL\NUL\NUL\NUL\EOTtrue"
