# crontab
## What is Crontab?
Crontab (Cron Table) is a configuration file used by the Cron daemon to schedule and automate tasks in Unix-like operating systems.
- Crontab is used to scheduling and automating the task.
- It facilitates the users to run the scripts or linux command at specified times and intervals. 
- It is helpful for repetitive tasks such as system maintenance, backups, and updates.
- Crontab stands for cron table.
- It is commonly used for:
    - Automating backups
    - Running scripts or commands periodically
    - Sending automated emails

## Crontab Syntax
Each line in a Crontab file represents a scheduled task with the following syntax:
```
* * * * * command_to_run
| | | | |
| | | | +---- Day of the week (0 - 7) [Sunday = 0 or 7]
| | | +------ Month (1 - 12)
| | +-------- Day of the month (1 - 31)
| +---------- Hour (0 - 23)
+------------ Minute (0 - 59)
```

## Basic Commands
### List Crontab Entries
```bash
crontab -l
```
### Edit Crontab Entries
```bash
crontab -e
```
### Remove Crontab Entries
```bash
crontab -r
```
### List Crontab for a Specific User (Requires root privileges)
```bash
crontab -u <username> -l
```

## Cron Timing Format
Cron uses a flexible timing format to define when a task should run:
- **Minute**: `0-59`
- **Hour**: `0-23`
- **Day of Month**: `1-31`
- **Month**: `1-12`
- **Day of Week**: `0-7` (Sunday can be `0` or `7`)

### Special Strings
- `@reboot`: Run once at system startup
- `@hourly`: Run once every hour
- `@daily`: Run once every day (midnight)
- `@weekly`: Run once every week (Sunday midnight)
- `@monthly`: Run once every month (1st of the month, midnight)
- `@yearly` or `@annually`: Run once every year (January 1, midnight)

## Examples
### Run a Script Every Day at Midnight
```bash
0 0 * * * /path/to/script.sh
```
### Run a Command Every Hour
```bash
0 * * * * /path/to/command
```
### Run a Task on the First Day of Every Month
```bash
0 0 1 * * /path/to/task
```
### Run a Job Every 5 Minutes
```bash
*/5 * * * * /path/to/job
```
### Schedule a Job to Run at System Startup
```bash
@reboot /path/to/startup_task.sh
```
### Resource
- [Crontab Guru](https://crontab.guru/) - Online Crontab syntax generator and validator.
