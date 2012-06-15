{-# LANGUAGE OverloadedStrings #-}
module Data.API.Twitter.User
       ( User(..)
       ) where

import Control.Applicative
import Data.Aeson
import Data.Text (Text)

data User = User { id :: Integer
                 , idStr :: Text
                 , screenName :: Text
                 , name :: Maybe Text
                 , lang :: Maybe Text
                 , description :: Maybe Text
                 , url :: Maybe Text
                 , geoEnabled :: Bool
                 , location :: Maybe Text
                 , timeZone :: Maybe Value
                 , utcOffset :: Maybe Value
                 , defaultProfileImage :: Bool
                 , profileImageUrl :: Text
                 , profileImageUrlHttps :: Text
                 -- , showAllInlineMedia :: Bool
                 -- , profileBackGroundTile :: Bool
                 -- , listedCount :: Integer
                 -- , profileSideBarFillColor :: Text
                 -- , verified :: Bool
                 -- , createdAt :: Text
                 -- , following :: Bool
                 -- , isTranslator :: Bool
                 -- , profileBackgroundImageUrlHttps :: Text
                 -- , profileBackgroundColor :: Text
                 -- , followersCount :: Integer
                 -- , statusesCount :: Integer
                 -- , protected :: Bool
                 -- , favouritesCount :: Integer
                 -- , profileBackgroundImageUrl :: Text
                 -- , followRequestSent :: Bool
                 -- , profileLinkColor :: Text
                 -- , friendsCount :: Integer
                 -- , profileUseBackgroundImage :: Bool
                 -- , profileTextColor :: Text
                 -- , defaultProfile :: Bool
                 -- , contributorsEnabled :: Bool
                 -- , profileSidebarBorderColor :: Text
                 -- , notifications :: Bool
                 , status :: Status
                 } deriving (Show)

instance FromJSON User where
  parseJSON (Object o) = User
                         <$> o .: "id"
                         <*> o .: "id_str"
                         <*> o .: "screen_name"
                         <*> o .: "name"
                         <*> o .: "lang"
                         <*> o .: "description"
                         <*> o .: "url"
                         <*> o .: "geo_enabled"
                         <*> o .: "location"
                         <*> o .: "time_zone"
                         <*> o .: "utc_offset"
                         <*> o .: "default_profile_image"
                         <*> o .: "profile_image_url"
                         <*> o .: "profile_image_url_https"
                         <*> o .: "status"

type Status = Value
