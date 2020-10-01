------------------------------------------------------------------------
-- import
------------------------------------------------------------------------

import XMonad hiding ( (|||) ) -- jump to layout
import XMonad.Layout.LayoutCombinators (JumpToLayout(..), (|||)) -- jump to layout
import XMonad.Config.Desktop
import System.Exit
import XMonad.Util.Cursor
import qualified XMonad.StackSet as W

-- data
import Data.Char (isSpace)
import Data.List
import Data.Monoid
import Data.Maybe (isJust)
import Data.Ratio ((%)) -- for video
import qualified Data.Map as M

-- system
import System.IO (hPutStrLn) -- for xmobar

-- util
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)  
import XMonad.Util.NamedScratchpad
import XMonad.Util.NamedWindows
import XMonad.Util.WorkspaceCompare

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.EwmhDesktops -- to show workspaces in application switchers
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat, doRectFloat) 
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.UrgencyHook

-- actions
import XMonad.Actions.CopyWindow -- for dwm window style tagging
import XMonad.Actions.UpdatePointer -- update mouse postion

-- layout 
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.GridVariants
import XMonad.Layout.ResizableTile
import XMonad.Layout.BinarySpacePartition

import Graphics.X11.Xlib.Cursor
import XMonad.Util.Cursor



------------------------------------------------------------------------
-- variables
------------------------------------------------------------------------

myModMask = mod4Mask -- Sets modkey to super/windows key
myTerminal = "termite" -- Sets default terminal
myBorderWidth = 2 -- Sets border width for windows
myNormalBorderColor = "#66005D"
myFocusedBorderColor = "#A304FF"
myppCurrent = "#9370db"
myppVisible = "#1e90ff"
myppHidden = "#268bd2"
myppHiddenNoWindows = "#93A1A1"
myppTitle = "#FDF6E3"
myppUrgent = "#DC322F"
myWorkspaces = ["1:www", "2:dev", "3:sys", "4:doc", "5:zoom", "6:vbox", "7:chat", "8:mus", "9:oth"]
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

------------------------------------------------------------------------
-- desktop notifications -- dunst package required
------------------------------------------------------------------------

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)

instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name     <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show name, "workspace " ++ idx]

------------------------------------------------------------------------
-- Startup hook
------------------------------------------------------------------------

myStartupHook = do
      spawnOnce "nitrogen --restore &" -- start urxvt terminal daemon
      setDefaultCursor xC_top_left_arrow

------------------------------------------------------------------------
-- layout
------------------------------------------------------------------------

myLayout = avoidStruts (tiled ||| full ||| grid ||| bsp)
  where
     -- tiles
     tiled = renamed [Replace "Tall"] 
           $ spacingRaw True (Border 10 0 10 0) True (Border 0 10 0 10) True 
           $ ResizableTall 1 (3/100) (1/2) []

     -- full
     full = renamed [Replace "Full"] 
          $ noBorders (Full)

     -- grid
     grid = renamed [Replace "Grid"] 
          $ spacingRaw True (Border 10 0 10 0) True (Border 0 10 0 10) True 
          $ Grid (16/10)

     -- bsp
     bsp = renamed [Replace "BSP"] 
         $ emptyBSP

     -- The default number of windows in the master pane
     nmaster = 1
     
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:
------------------------------------------------------------------------

myManageHook = composeAll
    [ isFullscreen --> doFullFloat]
    
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
------------------------------------------------------------------------

myKeys =
    [("M1-" ++ m ++ k, windows $ f i)
        | (i, k) <- zip (myWorkspaces) (map show [1 :: Int ..])
        , (f, m) <- [(W.view, ""), (W.shift, "S-"), (copy, "S-C-")]]
    ++
    [("M1-q", kill)   -- copy window to all workspaces
     , ("M-k", sendMessage MirrorExpand)
     , ("M-j", sendMessage MirrorShrink)
     , ("M-<Backspace>", sendMessage ToggleStruts)
     , ("M-p", spawn "dmenu_run") -- dmenu
     , ("M-b", spawn "brave")
     , ("M-f", spawn "nemo")
     , ("M-<Return>", spawn $ myTerminal)
     , ("M-<Space>", sendMessage NextLayout)
     , ("M-<Tab>", windows W.focusDown)
     , ("M-h", windows W.focusUp)
     , ("M-l", windows W.focusDown)
     , ("M-d", spawn "discord")
     , ("<F5>", spawn "amixer set Master 2%-")
     , ("<F6>", spawn "amixer set Master 2%+")
     , ("M-x", spawn "xournalpp")
     , ("M-s", spawn "flatpak run com.spotify.Client")
     , ("M-v", spawn "code")
     , ("M-a", spawn "krita")
     , ("<F1>", spawn "echo -e 'power on\nconnect 34:88:5D:5F:1A:54 \nquit' | bluetoothctl")
     , ("<F12>", spawn "flameshot gui")
     , ("<F8>", spawn "flatpak run com.skype.Client")
     , ("M-e", spawn "flatpak run org.kde.kdenlive")
    ]
    
------------------------------------------------------------------------
-- scratchpads
------------------------------------------------------------------------

myScratchpads = [ NS "terminal" spawnTerm findTerm manageTerm
              , NS "emacs-scratch" spawnEmacsScratch findEmacsScratch manageEmacsScratch
                ] 
    where
    role = stringProperty "WM_WINDOW_ROLE"
    spawnTerm = myTerminal ++  " -name scratchpad"
    findTerm = resource =? "scratchpad"
    manageTerm = nonFloating
    findEmacsScratch = title =? "emacs-scratch"
    spawnEmacsScratch = "emacsclient -a='' -nc --frame-parameters='(quote (name . \"emacs-scratch\"))'"
    manageEmacsScratch = nonFloating

------------------------------------------------------------------------
-- main
------------------------------------------------------------------------
main :: IO ()
main = do
    xmproc1 <- spawnPipe "xmobar -x 0 /home/mbcp/.config/xmobar/xmobarrc1"
    
    xmonad $ withUrgencyHook LibNotifyUrgencyHook $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> manageDocks <+> myManageHook <+> manageHook desktopConfig
        , startupHook        = myStartupHook
        , layoutHook         = myLayout
        , handleEventHook    = handleEventHook desktopConfig
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , terminal           = myTerminal
        , modMask            = myModMask
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook = dynamicLogWithPP xmobarPP  
                        { ppOutput = \x -> hPutStrLn xmproc1 x
                        , ppCurrent = xmobarColor myppCurrent "" . wrap "[" "]" -- Current workspace in xmobar
                        , ppVisible = xmobarColor myppVisible ""                -- Visible but not current workspace
                        , ppHidden = xmobarColor myppHidden "" . wrap "+" ""   -- Hidden workspaces in xmobar
                        , ppHiddenNoWindows = xmobarColor  myppHiddenNoWindows ""        -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor  myppTitle "" . shorten 80     -- Title of active window in xmobar
                        , ppSep =  "<fc=#586E75> | </fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor  myppUrgent "" . wrap "!" "!"  -- Urgent workspace
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        } >> updatePointer (0.25, 0.25) (0.25, 0.25)
          }
          `additionalKeysP` myKeys
