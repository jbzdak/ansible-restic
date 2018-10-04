#!/bin/bash

source "{{ restic_scripts_dir }}/{{ site_name }}.rc"

nice -n 19 ionice -c 3 restic -r "{{ site.restic_storage_target }}" \
    --password-file "{{ restic_scripts_dir }}/{{ site_name }}.pass" \
    --exclude-file "{{ restic_scripts_dir }}/{{ site_name }}.excludes" \
    backup {{ site.restic_backup_target }}
