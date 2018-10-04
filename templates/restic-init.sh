#!/bin/bash

source "{{ restic_scripts_dir }}/{{ site_name }}.rc"

restic -r "{{ site.restic_storage_target }}" --password-file "{{ restic_scripts_dir }}/{{ site_name }}.pass" init
