-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({"ctrl"}, "f")

launch = function(appname)
  hs.application.launchOrFocus(appname)
  k.triggered = true
  k:exit()
end

-- Sequential keybindings, e.g. Hyper-a,f for Finder
a = hs.hotkey.modal.new({}, "F16")
apps = {
  {'e', 'Emacs'},
  {'f', 'Finder'},
  {'s', 'Safari'},
  {'n', 'Notational Velocity'},
  {'t', 'iTerm'},
  {'p', 'System Preferences'},
  {'v', 'Preview'},
  {'c', 'Fantastical 2'},
  {'o', 'Microsoft OneNote'},
}
for i, app in ipairs(apps) do
  a:bind({}, app[1], function() launch(app[2]); a:exit(); end)
end

-- Bind a to hyper
pressedA = function() a:enter() end
releasedA = function() end
k:bind({}, 'a', nil, pressedA, releasedA)

-- Launch Alfred with HYPER+SHIFT+A
k:bind({"shift"}, 'a', nil, function() launch('Alfred 3'); end)

-- Launch Emacs with HYPER+e
k:bind({}, 'e', nil, function() launch('Emacs'); end)

-- Launch iTerm with HYPER+t
k:bind({}, 't', nil, function() launch('iTerm'); end)

-- Launch Chrome with HYPER+c
k:bind({}, 'c', nil, function() launch('Google Chrome'); end)

-- Launch Safari with HYPER+b
k:bind({}, 'b', nil, function() launch('Safari'); end)

-- Launch Slack with HYPER+s
k:bind({}, 's', nil, function() launch('Slack'); end)

-- Launch Parallels with HYPER+p
k:bind({}, 'p', nil, function() launch('Parallels Desktop'); end)

-- HYPER+up: Act like hyper up
ufun = function()
  hs.eventtap.keyStroke({"shift", "cmd", "alt", "ctrl"}, "Up")
  k.triggered = true
  k:exit()
end
k:bind({}, 'Up', nil, ufun)

-- HYPER+left: Act like hyper left
lfun = function()
  hs.eventtap.keyStroke({"shift", "cmd", "alt", "ctrl"}, "Left")
  k.triggered = true
  k:exit()
end
k:bind({}, 'Left', nil, lfun)

-- HYPER+right Act like hyper right
rfun = function()
  hs.eventtap.keyStroke({"shift", "cmd", "alt", "ctrl"}, "Right")
  k.triggered = true
  k:exit()
end
k:bind({}, 'Right', nil, rfun)

-- HYPER+down: Act like hyper down
dfun = function()
  hs.eventtap.keyStroke({"shift", "cmd", "alt", "ctrl"}, "Down")
  k.triggered = true
  k:exit()
end
k:bind({}, 'Down', nil, dfun)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
-- pressedF18 = function()
--   k.triggered = false
--   k:enter()
-- end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
-- releasedF18 = function()
--   k:exit()
--   if not k.triggered then
--     hs.eventtap.keyStroke({}, 'ESCAPE')
--   end
-- end

-- Bind the Hyper key
-- f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
