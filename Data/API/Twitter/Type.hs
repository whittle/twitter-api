{-# LANGUAGE OverloadedStrings #-}
module Data.API.Twitter.Type
       ( Tweet(..)
       , User(..)
       ) where

import Control.Applicative
import Data.Aeson
import Data.Text (Text)

data Tweet = Tweet { tweetId :: Integer
                   , tweetIdStr :: Text
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
                   , tweetCreatedAt :: Text
                   , entities :: Maybe Value
                   , user :: Maybe User
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
                         <*> o .:? "entities"
                         <*> o .:? "user"

data User = User { userId :: Integer
                 , userIdStr :: Text
                 , screenName :: Text
                 , name :: Maybe Text
                 , lang :: Maybe Text
                 , description :: Maybe Text
                 , url :: Maybe Text
                 , statusesCount :: Integer
                 , friendsCount :: Integer
                 , followersCount :: Integer
                 , favouritesCount :: Integer
                 , listedCount :: Integer
                 , geoEnabled :: Bool
                 , location :: Maybe Text
                 , timeZone :: Maybe Value
                 , utcOffset :: Maybe Value
                 , defaultProfile :: Bool
                 , defaultProfileImage :: Bool
                 , profileImageUrl :: Text
                 , profileImageUrlHttps :: Text
                 , userCreatedAt :: Text
                 , following :: Maybe Bool
                 , notifications :: Maybe Bool
                 , followRequestSent :: Bool
                 , isTranslator :: Bool
                 , contributorsEnabled :: Bool
                 , protected :: Bool
                 , verified :: Bool
                 , showAllInlineMedia :: Maybe Bool
                 , profileTextColor :: Text
                 , profileLinkColor :: Text
                 , profileBackgroundTile :: Bool
                 , profileBackgroundImageUrlHttps :: Text
                 , profileBackgroundColor :: Text
                 , profileBackgroundImageUrl :: Text
                 , profileUseBackgroundImage :: Bool
                 , profileSidebarFillColor :: Text
                 , profileSidebarBorderColor :: Text
                 , status :: Maybe Tweet
                 } deriving (Show)

instance FromJSON User where
  parseJSON (Object o) = User
                         <$> o .: "id"
                         <*> o .: "id_str"
                         <*> o .: "screen_name"
                         <*> o .:? "name"
                         <*> o .:? "lang"
                         <*> o .:? "description"
                         <*> o .:? "url"
                         <*> o .: "statuses_count"
                         <*> o .: "friends_count"
                         <*> o .: "followers_count"
                         <*> o .: "favourites_count"
                         <*> o .: "listed_count"
                         <*> o .: "geo_enabled"
                         <*> o .:? "location"
                         <*> o .:? "time_zone"
                         <*> o .:? "utc_offset"
                         <*> o .: "default_profile"
                         <*> o .: "default_profile_image"
                         <*> o .: "profile_image_url"
                         <*> o .: "profile_image_url_https"
                         <*> o .: "created_at"
                         <*> o .:? "following"
                         <*> o .:? "notifications"
                         <*> o .: "follow_request_sent"
                         <*> o .: "is_translator"
                         <*> o .: "contributors_enabled"
                         <*> o .: "protected"
                         <*> o .: "verified"
                         <*> o .:? "show_all_inline_media"
                         <*> o .: "profile_text_color"
                         <*> o .: "profile_link_color"
                         <*> o .: "profile_background_tile"
                         <*> o .: "profile_background_image_url_https"
                         <*> o .: "profile_background_color"
                         <*> o .: "profile_background_image_url"
                         <*> o .: "profile_use_background_image"
                         <*> o .: "profile_sidebar_fill_color"
                         <*> o .: "profile_sidebar_border_color"
                         <*> o .:? "status"
