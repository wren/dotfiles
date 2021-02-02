
-- NOTE: This variable doesn't exist before barbar runs. Create it before
--       setting any option.

-- Enable/disable animations
g.bufferline['animation'] = true

-- Enable/disable icons
-- if set to 'numbers', will show buffer index in the tabline
-- if set to 'both', will show buffer index and icons in the tabline
g.bufferline['icons'] = true

-- Configure icons on the bufferline.
g.bufferline['icon_separator_active'] = ''
-- g.bufferline['jcon_separator_inactive'] = ''
-- g.bufferline['icon_close_tab'] = ''
g.bufferline['icon_close_tab_modified'] = '●'

-- Enable/disable close button
g.bufferline['closable'] = true

-- Enables/disable clickable tabs
--  - left-click: go to buffer
--  - middle-click: delete buffer
g.bufferline['clickable'] = true

-- If set, the letters for each buffer in buffer-pick mode will be
-- assigned based on their name. Otherwise or in case all letters are
-- already assigned, the behavior is to assign letters in order of
-- usability (see order below)
g.bufferline['semantic_letters'] = true

-- New buffer letters are assigned in this order. This order is
-- optimal for the qwerty keyboard layout but might need adjustement
-- for other layouts.
g.bufferline['letters'] = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'

-- Sets the maximum padding width with which to surround each tab
g.bufferline['maximum_padding'] = 4
