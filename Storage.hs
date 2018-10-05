{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
module Storage where

import Database.Persist.TH
import Types

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Foo
  bar Bar1
|]
