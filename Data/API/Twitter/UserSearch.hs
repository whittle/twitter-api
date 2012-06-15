{-# LANGUAGE OverloadedStrings, MultiParamTypeClasses #-}
module Data.API.Twitter.UserSearch
       ( UserSearchQuery(..)
       , UserSearchPage
       ) where

import Data.Text (Text, unpack)
import Data.Default (Default(..))
import Data.Aeson
import qualified Data.Vector as V

import Data.API.Twitter.Query
import Data.API.Twitter.QueryResponsePair
import Data.API.Twitter.User

data UserSearchQuery = UserSearchQuery
                       { queryText :: Text
                       , page :: Maybe Int
                       , perPage :: Maybe Int
                       , includeEntities :: Maybe Bool
                       } deriving (Show)

instance Default UserSearchQuery where
  def = UserSearchQuery { queryText = ""
                        , page = Nothing
                        , perPage = Nothing
                        , includeEntities = Nothing
                        }

instance Query UserSearchQuery where
  toPathSegments _ = ["users", "search.json"]
  toQueryItems u = [("q", unpack $ queryText u)]

newtype UserSearchPage = UserSearchPage
                         { users :: [User]
                         } deriving (Show)

instance FromJSON UserSearchPage where
  parseJSON (Array a) = fmap (UserSearchPage . V.toList) $ V.mapM parseJSON a

instance QueryResponsePair UserSearchQuery UserSearchPage
