{-# LANGUAGE OverloadedStrings #-}
module Data.API.Twitter.User
       ( User(..)
       ) where

import Control.Applicative
import Data.Aeson
import Data.Text (Text)
import Data.API.Twitter.Tweet

data User = User { id :: Integer
                 , idStr :: Text
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
                 , createdAt :: Text
                 , status :: Tweet
                 -- , following :: Bool
                 -- , notifications :: Bool
                 -- , followRequestSent :: Bool
                 -- , isTranslator :: Bool
                 -- , contributorsEnabled :: Bool
                 -- , protected :: Bool
                 -- , verified :: Bool
                 -- , showAllInlineMedia :: Bool
                 -- , profileTextColor :: Text
                 -- , profileLinkColor :: Text
                 -- , profileBackGroundTile :: Bool
                 -- , profileBackgroundImageUrlHttps :: Text
                 -- , profileBackgroundColor :: Text
                 -- , profileBackgroundImageUrl :: Text
                 -- , profileUseBackgroundImage :: Bool
                 -- , profileSideBarFillColor :: Text
                 -- , profileSidebarBorderColor :: Text
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
                         <*> o .: "status"
