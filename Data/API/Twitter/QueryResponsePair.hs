{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}
module Data.API.Twitter.QueryResponsePair
       ( QueryResponsePair(..)
       ) where

class QueryResponsePair q r | q -> r where
