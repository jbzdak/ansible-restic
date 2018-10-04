Role Name
=========

Configures automatic backups using [restic](1). Tested using [openstack swift](1) backup but should work for other backends as well.  

[1]: https://restic.readthedocs.io/en/stable/index.html
[2]: https://docs.openstack.org/swift/latest/

How it works
------------

All backups are done using root account, script files
are in ``/root/restic`` and backup comnmand is added to crontab. 

I decided to use root as:
  
* swift upload keys are read/write by design so anyone 
  who has access to keys can delete your backups, I 
  probably using a local user would be as good
* If you mess your file ownership rights you'll still be
  able to back everything up.   
 
Requirements
------------

Linux system with installed restic program. 

See restic manual for instalation instructions.

Role Variables
--------------
 
 

    # You can upload multiple folders to multiple containers
    restic_sites:      
      # Upload site
      site1: 
        # File containing enviormental variables that 
        # configure upload permissions. 
        # If your backend is swift use your openstack-rc
        # file. 
        openrc_file_contents: | 
            export OS_AUTH_URL=https://auth.example.com/v2.0/
        # Storage password 
        restic_storage_password: "super complex password"
        # Destination for backups, see eg: https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html#openstack-swift
        restic_storage_target: "swift:container:/path"
        # What directory you want to back up
        restic_backup_target: /home/me
        # Any exclude patterns
        restic_exclude_file_contents: | 
            /home/me/.cache
        # How often backups should be ran, see special_time here: https://docs.ansible.com/ansible/latest/modules/cron_module.html?highlight=cron#parameters
        cron_run_time: hourly

License
-------

BSD
