import os

# My configuration

# Aliases
c.aliases['fill'] = ('spawn --userscript qute-bitwarden --auto-lock 10800')
c.aliases['sync'] = 'spawn --userscript bookmarksync'
c.aliases['json'] = ('spawn --userscript format_json')

# Bindings
# LastPass fill
config.bind('<Ctrl-F>', 'fill')
config.bind('<Ctrl-F>', 'fill', mode='insert')
# mpv
config.bind('<Alt-M>', 'spawn mpv --input-ipc-server=/tmp/mpvsocket {url}')
config.bind(';m', 'hint links spawn mpv --input-ipc-server=/tmp/mpvsocket '
        '{hint-url}')
config.bind(';M', 'hint --rapid links userscript mpv-playlist')
# Give tab
config.bind('gD', 'set-cmd-text -s :tab-give')
# Open in private window
# Ctrl+Shift+N opens a private window on homepage
config.bind(',p', 'set-cmd-text -s :open -p')
# Open link in private tab with ;p
config.bind(';p', 'hint links run open -p {hint-url}')
# dmenu-open
config.bind(',o', 'spawn --userscript dmenu-open')
config.bind(',O', 'spawn --userscript dmenu-open --tab')
# Add/remove bookmark and sync
config.bind('M', 'bookmark-add ;; spawn --userscript bookmarksync')
config.bind('cM', 'bookmark-del ;; spawn --userscript bookmarksync ;; '
        'message-info "Deleted bookmark"')
# Remote add torrent
torrent_server = os.environ.get('TORRENT_SERVER')
config.bind('tf', 'hint links spawn --userscript torrent-add '
        '%s {hint-url}' % torrent_server)
config.bind(';T', 'hint --rapid links spawn --userscript torrent-add '
        '%s {hint-url}' % torrent_server)
# Open selected form field in editor
config.bind('<Ctrl-I>', 'open-editor')
config.bind('<Ctrl-I>', 'open-editor', mode='insert')
# Save current window as
config.bind('ws', 'set-cmd-text -s :session-save -o')
# Restore window
config.bind('wr', 'set-cmd-text -s :session-load -t')
# Delete saved session
config.bind('wd', 'set-cmd-text -s :session-delete ')
# Toggle adblock
config.bind(',h', 'config-cycle -t -p content.host_blocking.enabled')


# Tab title format
c.tabs.title.format = '{private}{audio}{index}: {current_title}'

# Editor command
c.editor.command = [os.environ.get('TERMINAL'), '-e', 'nvim', '{}']

# Tab title padding
c.tabs.padding = {'top': 3, 'bottom': 3, 'left': 5, 'right': 5}

# Smooth scrolling
c.scrolling.smooth = True

# Always restore open sites when qutebrowser is reopened
c.auto_save.session = True
c.session.default_name = 'default'

# Lazy restore
c.session.lazy_restore = True

# Stop hints from disappearing when page is loading
c.hints.leave_on_load = False

# Enable JavaScript clipboard access
c.content.javascript.can_access_clipboard = False

# Fonts
c.fonts.completion.category = '12pt monospace'
c.fonts.completion.entry = '12pt monospace'
c.fonts.debug_console = '12pt monospace'
c.fonts.downloads = '12pt monospace'
c.fonts.hints = '12pt monospace'
c.fonts.keyhint = '11pt monospace'
c.fonts.messages.error = '12pt monospace'
c.fonts.messages.info = '10pt monospace'
c.fonts.messages.warning = '10pt monospace'
c.fonts.prompts = '13pt sans-serif'
c.fonts.statusbar = '13pt monospace'
c.fonts.tabs = '12pt monospace'

# HiDPI configuration
c.qt.highdpi = True
# c.zoom.default = 65

# Dvorak hint characters
c.hints.chars = 'aoeuidhtn'

# Enable DRM content (qt5-webengine-widevine from AUR must be installed)
c.qt.args = ['ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so']


# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Default Dark scheme by Chris Kempson (http://chriskempson.com)

base00 = "#181818"
base01 = "#282828"
base02 = "#383838"
base03 = "#585858"
base04 = "#b8b8b8"
base05 = "#d8d8d8"
base06 = "#e8e8e8"
base07 = "#f8f8f8"
base08 = "#ab4642"
base09 = "#dc9656"
base0A = "#f7ca88"
base0B = "#a1b56c"
base0C = "#86c1b9"
base0D = "#7cafc2"
base0E = "#ba8baf"
base0F = "#a16946"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base05

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base03

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base00

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = base0A

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base00

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base00

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base00

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base01

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base0A

# Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = base0A

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = base0A

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = base0B

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base05

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base00

# Background color for the download bar.
c.colors.downloads.bar.bg = base00

# Color gradient start for download text.
c.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base0D

# Color gradient end for download text.
c.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = base08

# Font color for hints.
c.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base0A

# Font color for the matched part of hints.
c.colors.hints.match.fg = base05

# Text color for the keyhint widget.
c.colors.keyhint.fg = base05

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base05

# Background color of the keyhint widget.
c.colors.keyhint.bg = base00

# Foreground color of an error message.
c.colors.messages.error.fg = base00

# Background color of an error message.
c.colors.messages.error.bg = base08

# Border color of an error message.
c.colors.messages.error.border = base08

# Foreground color of a warning message.
c.colors.messages.warning.fg = base00

# Background color of a warning message.
c.colors.messages.warning.bg = base0E

# Border color of a warning message.
c.colors.messages.warning.border = base0E

# Foreground color of an info message.
c.colors.messages.info.fg = base05

# Background color of an info message.
c.colors.messages.info.bg = base00

# Border color of an info message.
c.colors.messages.info.border = base00

# Foreground color for prompts.
c.colors.prompts.fg = base05

# Border used around UI elements in prompts.
c.colors.prompts.border = base00

# Background color for prompts.
c.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base0A

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = base0B

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base00

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = base00

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = base0D

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = base00

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base0C

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = base00

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base03

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base05

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base00

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = base05

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base00

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = base00

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base0E

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = base00

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base0D

# Background color of the progress bar.
c.colors.statusbar.progress.bg = base0D

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base05

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = base08

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base0C

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base0B

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = base0E

# Background color of the tab bar.
c.colors.tabs.bar.bg = base00

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = base0C

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = base08

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = base05

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = base03

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = base05

# Background color of unselected even tabs.
c.colors.tabs.even.bg = base00

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = base00

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = base05

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = base00

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = base05

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = base00
