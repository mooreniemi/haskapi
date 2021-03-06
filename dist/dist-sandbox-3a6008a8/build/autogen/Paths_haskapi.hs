module Paths_haskapi (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Alex/Documents/Code/haskell/haskapi/.cabal-sandbox/bin"
libdir     = "/Users/Alex/Documents/Code/haskell/haskapi/.cabal-sandbox/lib/x86_64-osx-ghc-7.8.3/haskapi-0.1.0.0"
datadir    = "/Users/Alex/Documents/Code/haskell/haskapi/.cabal-sandbox/share/x86_64-osx-ghc-7.8.3/haskapi-0.1.0.0"
libexecdir = "/Users/Alex/Documents/Code/haskell/haskapi/.cabal-sandbox/libexec"
sysconfdir = "/Users/Alex/Documents/Code/haskell/haskapi/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskapi_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskapi_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskapi_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskapi_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskapi_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
