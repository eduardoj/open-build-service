## References

* https://github.com/osixia/docker-openldap/issues/354
* https://build.opensuse.org/package/view_file/openSUSE:Containers:Tumbleweed/opensuse-openldap-image.20230411081750/README.md?expand=1



## Add schemas from msuser

### Operate inside the openldap container

Dealing and working with schemas (`cn=schema,cn_config`) is easier from inside the container.

```
✗ docker-compose exec openldap bash

```

### List current schemas

```
# ldapsearch -H ldapi:/// -b cn=schema,cn=config cn
```

### Use a reduced version of msuser schemas

Adding all the schemas from `msuser.ldif` results in an error.

Removing unneeded parts of the file workarounds the problem.

* Copy the `/etc/openldap/msuser.ldif` to `/root/msuser_small.ldif`.
* Edit the `/root/msuser_small.ldif` and search for the `sAMAccountName` string.
```
olcAttributeTypes: ( MSADat4:221            
  NAME 'sAMAccountName'
  SYNTAX '1.3.6.1.4.1.1466.115.121.1.15'               
  SINGLE-VALUE )                                          
#                                                        
```
* Keep the content of the file from the beginning until this section. Remove the rest of the lines of the file, and save.

### Add schemas from a file

```
# ldapadd -H ldapi:/// -f msuser_small.ldif
```

### Checking that msuser schemas are installed

```
# ldapsearch -H ldapi:/// -b cn=schema,cn=config cn
[...]
# {6}msuser, schema, config
dn: cn={6}msuser,cn=schema,cn=config
cn: {6}msuser
[...]
```
