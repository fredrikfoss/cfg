# Firefox

Make a new user profile in about:profiles, call it `user`, set it's location to `~/.mozilla/firefox/user/`, and copy `user.js` to this directory. Install uBlockOrigin, and restore it's settings with the `ublock-backup.json` file.

Add and set default search engine.

Under Privacy & Security -> Browser Privacy -> Cookies and Site Data, click on Manage Exceptions, and add some of these sites:

```
https://proton.me
https://element.io
https://simplelogin.io
https://github.com
https://reddit.com
https://discord.com
https://ziggit.dev
https://spotify.com
https://netflix.com
https://github.uio.no
https://minestudier.no
https://mail.uio.no
https://studentweb.uio.no
https://devilry.ifi.no
```

## Extensions

- [uBlock Origin](https://github.com/gorhill/uBlock)
- [Dark Reader](https://github.com/darkreader/darkreader)
- [Vimium](https://github.com/philc/vimium)
- [User-Agent Switcher and Manager](https://github.com/ray-lothian/UserAgent-Switcher)
- [Bypass Paywalls Clean](https://gitlab.com/magnolia1234/bypass-paywalls-firefox-clean)
- [Old New Reddit Redirect](https://github.com/LightningW9/old-new-reddit-redirect)
- [SponsorBlock](https://github.com/ajayyy/SponsorBlock)
- [Unhook](https://unhook.app)
- [Enchancer For YouTube](https://www.mrfdev.com/enhancer-for-youtube)

## Enable DRM content

(Maybe only on Asahi?)

Install widevine:

```
sudo dnf -y install widevine-installer
sudo widevine-installer
```

Also set useragent for required sites. One way to do this is to install the [User-Agent Switcher and Manager](https://github.com/ray-lothian/UserAgent-Switcher) addon, enter settings and in the Custom Mode field, add:

```json
{
  "netflix.com": [
    "Mozilla/5.0 (X11; CrOS aarch64 15329.44.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36"
  ]
}
```

## Search engines

- `https://start.duckduckgo.com/?q=%s`
- `https://lite.duckduckgo.com/lite/?q=%s`
- `https://html.duckduckgo.com/html/?q=%s`

## Links

- <https://github.com/yokoffing/BetterFox>
- <https://github.com/yokoffing/filterlists#guidelines>
