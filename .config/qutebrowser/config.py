# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(True)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.tabs.position = 'top'

# Custom Configurations
c.completion.cmd_history_max_items = 500

# misc
c.downloads.location.directory = "$HOME/Downloads"
c.downloads.position = "bottom"    


# set dark mode
c.colors.webpage.preferred_color_scheme = "dark"

# font
c.fonts.default_family = '"Fira Code"'
c.fonts.default_size = '9pt'
c.fonts.completion.entry = '9pt "Fira Code"'
c.fonts.debug_console = '9pt "Fira Code"'
c.fonts.prompts = 'default_size default_family'
c.fonts.statusbar = '9pt "Fira Code"'

# colorscheme
c.colors.completion.fg = ['#a9b1d6', '#a9b1d6', '#a9b1d6']
c.colors.completion.odd.bg = '#24283b'
c.colors.completion.even.bg = '#24283b'
c.colors.completion.category.fg = '#f7768e'
c.colors.completion.category.bg = '#1a1b26'
c.colors.completion.category.border.top = '#565f89'
c.colors.completion.category.border.bottom = '#565f89'
c.colors.completion.item.selected.fg = '#bb9af7'
c.colors.completion.item.selected.bg = '#1a1b26'
c.colors.completion.item.selected.border.top = '#414868'
c.colors.completion.item.selected.border.bottom = '#414868'
c.colors.completion.item.selected.match.fg = '#7aa2f7'
c.colors.completion.match.fg = '#bb9af7'
c.colors.completion.scrollbar.fg = '#565f89'
c.colors.downloads.bar.bg = '#24283b'
c.colors.downloads.error.bg = '#f7768e'
c.colors.hints.fg = '#24283b'
c.colors.hints.match.fg = '#7aa2f7'
c.colors.statusbar.normal.bg = '#24283b'
c.colors.statusbar.insert.fg = '#7aa2f7'
c.colors.statusbar.insert.bg = '#1a1b26'
c.colors.statusbar.passthrough.bg = '#1a1b26'
c.colors.statusbar.command.bg = '#24283b'
c.colors.statusbar.url.warn.fg = '#e0af68'
c.colors.tabs.bar.bg = '#24283b'
c.colors.tabs.odd.bg = '#24283b'
c.colors.tabs.odd.fg = '#a9b1d6'
c.colors.tabs.even.bg = '#24283b'
c.colors.tabs.even.fg = '#a9b1d6'
c.colors.tabs.selected.odd.bg = '#1a1b26'
c.colors.tabs.selected.odd.fg = '#bb9af7'
c.colors.tabs.selected.even.bg = '#1a1b26'
c.colors.tabs.selected.even.fg = '#bb9af7'

