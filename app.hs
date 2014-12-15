module App where

import Network.Wai
import Network.Wai.Handler.Warp

import Servant.Server

-- import qualified Data.ByteString as B
import Network.Wai.Middleware.RequestLogger

import Greet
import Handlers

haskapi :: Application
haskapi = serve haskApi handlers

-- Run the server.
--
-- 'run' comes from Network.Wai.Handler.Warp
runTestServer :: Port -> IO ()
runTestServer port = run port $ logStdout haskapi