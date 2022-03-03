# Prusaslicer noVNC Home Assistant Add-On

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports i386 Architecture][i386-shield]

![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]


## Overview

This is a Home Assistant Add-on that runs PrusaSlicer on a Debian container and exposes the GUI via NoVNC as a webpage.
Based on [helfrichmichael/prusaslicer-novnc](https://github.com/helfrichmichael/prusaslicer-novnc) and [Poeschl's vnc-viewer add-on](https://github.com/Poeschl/Hassio-Addons/tree/master/vnc-viewer)


## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1.  [Add our Home Assistant add-ons repository][repository] to your Home Assistant instance.
2.  Install the "PrusaSlicer NoVNC" add-on.
3.  Check the "Show in sidebar toggle.
4.  Start the "PrusaSlicer NoVNC" add-on
5.  Check the logs of the "PrusaSlicer NoVNC" add-on to see if everything went well.
6.  Open the "PrusaSlicer" tab on Home Assistant.

[:books: Read the full add-on documentation][docs]

**NOTE**: Starting the add-on might take a couple of minutes (especially the
first time starting the add-on).

**NOTE**: Do not add this repository to Home Assistant, please use:
`https://github.com/marciogranzotto/addons-repository`.

## Support

Got questions?

You can [open an issue here][issue] on GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Marcio Granzotto][marciogranzotto].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

## Links

[Prusaslicer](https://www.prusa3d.com/prusaslicer/)

[Supervisor](http://supervisord.org/)

[GitHub Source](https://github.com/helfrichmichael/prusaslicer-novnc)

[Docker](https://hub.docker.com/r/mikeah/prusaslicer-novnc)


[anchore-shield]: https://anchore.io/service/badges/image/67d1185473090e99d5ac5e1bb4d1aa2295117a9bd3d7abbf8cd8a71e331c8388

[anchore]: https://anchore.io/image/dockerhub/marciogranzotto%2Funifi%3Alatest

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg

[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-no-red.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-no-red.svg

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg

<!-- markdown-link-check-disable-next-line -->
[buymeacoffee]: https://www.buymeacoffee.com/automarcio

[commits-shield]: https://img.shields.io/github/commit-activity/y/marciogranzotto/addon-prusaslicer-novnc.svg

[commits]: https://github.com/marciogranzotto/addon-prusaslicer-novnc/commits/master

[contributors]: https://github.com/marciogranzotto/addon-prusaslicer-novnc/graphs/contributors

[dockerhub]: https://hub.docker.com/r/marciogranzotto/nightscout

[home-assistant]: https://home-assistant.io

[issue]: https://github.com/marciogranzotto/addon-prusaslicer-novnc/issues

[keepchangelog]: http://keepachangelog.com/en/1.0.0/

[license-shield]: https://img.shields.io/github/license/marciogranzotto/addon-prusaslicer-novnc.svg

[maintenance-shield]: https://img.shields.io/maintenance/yes/2022.svg

[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg

[releases-shield]: https://img.shields.io/github/release/marciogranzotto/addon-prusaslicer-novnc.svg

[releases]: https://github.com/marciogranzotto/addon-prusaslicer-novnc/releases

[repository]: https://github.com/marciogranzotto/addons-repository

[marciogranzotto]: https://github.com/marciogranzotto

[docs]: nightscout/DOCS.md