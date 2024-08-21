# FiveM Radio

This resource allows you to integrate your own radios in place of the original radios.
It's fully written in JavaScript and uses resource metadata for its configuration.

## Rewritten by Drazox
This was a small question from my friend and i wanted to relase this cuz mine resmon is 0.0ms while not use!
while in use its around 0.05ms maybe idk!
never tested it!
have fun using this hot garbage! (no offense to original creator but idea was good and it was working but resmon is not reasonable!)

## Features

* Radio wheel
* Audio file
* Audio stream
* No dependency
* Easy configuration
* Player-configurable volume

## Showcase

Video showing Los Santos Rock Radio replaced by a WebRadio and Non-Stop-Pop FM replaced by a song:
[![Showcase](https://forum.cfx.re/uploads/default/original/3X/7/b/7b6b5ce1ae1270f4885aba714ea65c1235397b12.jpg)](https://streamable.com/6hrhp "Showcase")

## Known bugs and limitations

* No MPEG or AAC support as CEF only supports open formats

## Configuration

For each custom radio, add this line in `fxmanifest.lua`:
```lua
supersede_radio "[ORIGINAL_RADIO_NAME]" { url = "[RADIO URL]", volume = 0.5, name = "[NEW RADIO NAME]" }
```

You can find the list of radio names in [`data.js`](radio/data.js) and a full example in [`fxmanifest.lua`](radio/fxmanifest.lua).

## Tips

Stream a modified `hud.ytd` (`gtav_radio_stations_texture_512`) file to replace radio logos.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
