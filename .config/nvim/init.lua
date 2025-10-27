--[[ kickstart lua and help guide:
    https://learnxinyminutes.com/docs/lua/
    after understanding a bit more about lua, you can use `:help lua-guide` as a
    reference for how neovim integrates lua.
    - :help lua-guide
    - (or html version): https://neovim.io/doc/user/lua-guide.html
  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.
    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
--]]

require "config.options"
require "config.keymaps"
require "config.autocmd"
require "config.lazy"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
