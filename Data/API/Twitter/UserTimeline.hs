{-# LANGUAGE OverloadedStrings, MultiParamTypeClasses #-}
module Data.API.Twitter.UserTimeline
       ( UserTimelineQuery(..)
       , UserTimelinePage(..)
       ) where

import Data.Maybe (fromJust)
import Data.Text (Text, unpack)
import Data.Default (Default(..))
import Data.Aeson
import qualified Data.Vector as V

import Data.API.Twitter.Query
import Data.API.Twitter.QueryResponsePair
import Data.API.Twitter.Type

data UserTimelineQuery = UserTimelineQuery
                         { queryUserId :: Maybe Integer
                         , queryScreenName :: Maybe Text
                         , sinceId :: Maybe Integer
                         , count :: Maybe Integer
                         , maxId :: Maybe Integer
                         , page :: Maybe Integer
                         , trimUser :: Maybe Bool
                         , includeRts :: Maybe Bool
                         , includeEntities :: Maybe Bool
                         , excludeReplies :: Maybe Bool
                         , contributorDetails :: Maybe Bool
                         } deriving (Show)

instance Default UserTimelineQuery where
  def = UserTimelineQuery Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing

instance Query UserTimelineQuery where
  toPathSegments _ = ["statuses", "user_timeline.json"]
  toQueryItems u = [("screen_name", unpack . fromJust $ queryScreenName u)]

data UserTimelinePage = UserTimelinePage
                        { tweets :: [Tweet]
                        } deriving (Show)

instance FromJSON UserTimelinePage where
  parseJSON (Array a) = fmap (UserTimelinePage . V.toList) $ V.mapM parseJSON a

instance QueryResponsePair UserTimelineQuery UserTimelinePage
