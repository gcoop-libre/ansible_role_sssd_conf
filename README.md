# Ansible Role: gcoop-libre.sssd_conf

This role, configure SSSD System Security Services Daemon.

## Requirements

- freeipa-client
- sssd

## Role Variables

Available variables with default values in `defaults/main/defaults.yml`.

## Dependencies

None.

## Example Playbook

If you want to configure a FreeIPA with trust Active Directory domain.

```yaml
---

- name: Configure SSSD
  hosts: [all]

  roles:
    - role: gcoop-libre.sssd_conf
      ad_domain: example.com
      ad_server_list:
        - "ad1.{{ ad_domain }}"
      ad_backup_server_list:
        - "ad2.{{ ad_domain }}"
      ipa_domain: "ipa.{{ ad_domain }}"
      ipa_server_list:
        - "ipaserver.{{ ipa_domain }}"
      default_domain_suffix: "{{ ad_domain }}"
      domains: "{{ ipa_domain }}"
      default_debug_level: 4
```

## License

GNU General Public License, GPLv3.

## Author Information

This role was created in 2019 by
 [Osiris Alejandro Gomez](http://osiux.com/), worker cooperative of
 [gcoop Cooperativa de Software Libre](http://www.gcoop.coop/).

