# Threat Feed Automation

Small, cron-friendly automation to keep your local **threat intelligence feeds** (IP / domain / URL blocklists, etc.) up to date using a simple shell script.

The repository currently contains a single script, `auto.sh`, which you can schedule with `cron` to periodically download and refresh threat feeds that you then plug into:

- Firewalls and WAFs  
- IDS / IPS  
- SIEM rules and correlation searches  
- DNS sinks, proxy filters, etc.

Run the automation by adding the corn job

0 0 * * * sh /home/vivek/automation/auto.sh > /home/vivek/automation/cron.log
This will update the feeds every midnight


---

## Repository layout

```text
threat-feed-automation/
├── auto.sh     # Main automation script that pulls/updates feeds
└── README.md   # Project documentation (this file)
