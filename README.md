# apache-subdomain-creator
I was working on a project and we needed to create subdomain automaticlly so i created this simple bash script for it.

We were using cwp as our server controll panel so the apache config files paths are a bit different than their usual path...

Also if you have a wildcard ssl certification installed on your server you can uncomment the specified lines in the scripts.
By doing that the subdomains will have ssl cetrificate installed on them.

Example:
```bash
./subdomain.sh  subdomainName domainUser domainName ipAddress
./subdomain.sh test.test.com test test.com 127.0.0.1
```
