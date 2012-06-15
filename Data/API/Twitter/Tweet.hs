{-# LANGUAGE OverloadedStrings #-}
module Data.API.Twitter.Tweet
       ( Tweet(..)
       ) where

import Control.Applicative
import Data.Aeson
import Data.Text (Text)

data Tweet = Tweet { id :: Integer
                   , idStr :: Text
                   , text :: Text
                   , truncated :: Bool
                   , favorited :: Bool
                   , retweeted :: Bool
                   , retweetCount :: Integer
                   , geo :: Maybe Value
                   , place :: Maybe Value
                   , coordinates :: Maybe Value
                   , inReplyToStatusId :: Maybe Integer
                   , inReplyToStatusIdStr :: Maybe Text
                   , inReplyToUserId :: Maybe Integer
                   , inReplyToUserIdStr :: Maybe Text
                   , inReplyToScreenName :: Maybe Text
                   , contributors :: Maybe Value
                   , source :: Text
                   , createdAt :: Text
                   -- , entities :: Value
                   -- , user :: User
                   } deriving (Show)

instance FromJSON Tweet where
  parseJSON (Object o) = Tweet
                         <$> o .: "id"
                         <*> o .: "id_str"
                         <*> o .: "text"
                         <*> o .: "truncated"
                         <*> o .: "favorited"
                         <*> o .: "retweeted"
                         <*> o .: "retweet_count"
                         <*> o .:? "geo"
                         <*> o .:? "place"
                         <*> o .:? "coordinates"
                         <*> o .:? "in_reply_to_status_id"
                         <*> o .:? "in_reply_to_status_id_str"
                         <*> o .:? "in_reply_to_user_id"
                         <*> o .:? "in_reply_to_user_id_str"
                         <*> o .:? "in_reply_to_screen_name"
                         <*> o .:? "contributors"
                         <*> o .: "source"
                         <*> o .: "created_at"
