module Data.API.Twitter.Query
       ( Query(..)
       ) where

import Network.OAuth.Http.Request

class Query q where
  toPathSegments :: q -> [String]
  toQueryItems :: q -> [(String, String)]

  toPathComps :: q -> [String]
  toPathComps = (++) ["", "1"] . toPathSegments

  toQueryStr :: q -> FieldList
  toQueryStr = fromList . toQueryItems
