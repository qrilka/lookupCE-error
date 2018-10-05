{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeApplications #-}
module Types where

import Data.Proxy
import Database.Persist
import Database.Persist.Sql

newtype Bar1 = Bar1 Word
  deriving (Show, Eq, Ord, PersistField, PersistFieldSql)

newtype Bar2 = Bar2 Word
  deriving (Show, Eq, Ord)

instance PersistField Bar2 where
  toPersistValue (Bar2 a) = toPersistValue a
  fromPersistValue = fmap Bar2 . fromPersistValue
  
instance PersistFieldSql Bar2 where
  sqlType _ = sqlType (Proxy @ Word)
