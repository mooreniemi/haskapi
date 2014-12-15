{-# LANGUAGE OverloadedStrings #-}
module Main where

import App

-- Put this all to work!
main :: IO ()
main = do
  let port = 8001
  putStrLn $ "Listening on port " ++ show port
  runTestServer port