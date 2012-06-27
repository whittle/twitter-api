{-# LANGUAGE OverloadedStrings, MultiParamTypeClasses #-}
module Data.API.Twitter.UserShow
       ( UserShowQuery(..)
       , UserShowResult(..)
       ) where

import Data.API.Twitter.Query
import Data.API.Twitter.QueryResponsePair
import Data.API.Twitter.Type

import Data.Aeson
import Data.Default (Default(..))
import Data.Maybe (isJust, fromJust, catMaybes)
import Data.Text (Text, unpack)

data UserShowQuery = UserShowQuery
                     { queryUserId :: Maybe Integer
                     , queryScreenName :: Maybe Text
                     , includeEntities :: Bool
                     } deriving (Show)

instance Default UserShowQuery where
  def = UserShowQuery Nothing Nothing False

instance Query UserShowQuery where
  toPathSegments = const ["users", "show.json"]
  toQueryItems q = catMaybes [uidTerm q, snTerm q]

uidTerm :: UserShowQuery -> Maybe (String, String)
uidTerm q | isJust $ queryUserId q = Just ("user_id", show . fromJust $ queryUserId q)
          | otherwise = Nothing

snTerm :: UserShowQuery -> Maybe (String, String)
snTerm q | isJust $ queryScreenName q = Just ("screen_name", unpack . fromJust $ queryScreenName q)
         | otherwise = Nothing

data UserShowResult = UserShowResult
                      { getUser :: User
                      } deriving (Show)

instance FromJSON UserShowResult where
  parseJSON = fmap UserShowResult . parseJSON

instance QueryResponsePair UserShowQuery UserShowResult
