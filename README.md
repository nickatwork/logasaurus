

    ██╗      ██████╗  ██████╗  █████╗ ███████╗ █████╗ ██╗   ██╗██████╗ ██╗   ██╗███████╗
    ██║     ██╔═══██╗██╔════╝ ██╔══██╗██╔════╝██╔══██╗██║   ██║██╔══██╗██║   ██║██╔════╝
    ██║     ██║   ██║██║  ███╗███████║███████╗███████║██║   ██║██████╔╝██║   ██║███████╗
    ██║     ██║   ██║██║   ██║██╔══██║╚════██║██╔══██║██║   ██║██╔══██╗██║   ██║╚════██║
    ███████╗╚██████╔╝╚██████╔╝██║  ██║███████║██║  ██║╚██████╔╝██║  ██║╚██████╔╝███████║
    ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝


![LOGASAURUS](./logasaurus.gif)

## Description

Logging modules to simply logging scenarios. Send a log message to SumoLogic, . StatHat, DataDog, MS Teams, email, slack, or a local log file formatted a logfmt or JSON. Capture Windows application screen events.

## Requirements


+ [![Everybody wins with Windows](https://img.shields.io/badge/Powershell_Core-6.2-blue.svg)](https://github.com/powershell/)
+ [![Everybody wins with Windows](https://img.shields.io/badge/Powershell_Core-7.0_Preview_3-blue.svg)](https://github.com/powershell/)


## Up and Running

### Installation

`git clone https://github.com/nickatwork/logasaurus.git`

### Functions

* [get-log](./Docs/get-log.md)
* [send-datadog](./Docs/send-datadog.md)
    * Sends logfmt or JSON formatted message to DataDog
* [send-sumo](./Docs/send-sumo.md)
    * Sends logfmt or JSON formatted message to SumoLogic
* [send-email](./Docs/send-email.md)
    * Legacy SMTP messaging
* [send-mailkit](./Docs/send-mailkit.md)
    * Modern SMTP messaging
* [send-teams]()
    * Send a message to MS Teams
* [send-slack](./Docs/send-slack.md)
    * Send a message to a Slack channel
* [start-PSRCapture](./Docs/start-PSRCapture)
    * Log GUI events on Windows Applications
* [stop-PSRCapture](./Docs/stop-PSRCapture)
    * Log GUI events on Windows Applications

## Contributing

