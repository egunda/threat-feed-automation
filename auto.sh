curl https://check.torproject.org/exit-addresses 2>/dev/null | grep -oP '(?<=ExitAddress )\d+\.\d+\.\d+\.\d+' | awk '{print $1"/32"}' > /var/www/html/iplist/torip.txt
curl https://www.spamhaus.org/drop/drop_v4.json 2>/dev/null | grep -oP '(?<="cidr":")\d+\.\d+\.\d+\.\d+' | awk '{print $1"/32"}' > /var/www/html/iplist/spamhaus_v4.txt
curl https://www.spamhaus.org/drop/drop_v6.json 2>/dev/null | grep -oP '(?<="cidr":")([0-9a-fA-F:]+)' | awk '{print $1"/128"}' > /var/www/html/iplist/spamhaus_v6.txt
curl https://www.spamhaus.org/drop/asndrop.json 2>/dev/null | grep -oP '(?<="asn":)\d+' > /var/www/html/iplist/spamhaus_asn.txt
curl -s https://rules.emergingthreats.net/fwrules/emerging-Block-IPs.txt 2>/dev/null | awk '!/^#/ && NF {print ($1 ~ /\// ? $1 : $1"/32")}' > /var/www/html/iplist/emerginthreats.txt
curl https://raw.githubusercontent.com/stamparm/maltrail/refs/heads/master/misc/worst_asns.txt 2>/dev/null | grep -oP '^\d+\.\d+\.\d+\.\d+(\/\d+)?' > /var/www/html/iplist/mailtrail.txt
curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | awk '{print $1"/32"}' > /var/www/html/iplist/ipsum.txt
curl https://raw.githubusercontent.com/MISP/misp-warninglists/main/lists/vpn-ipv4/list.json 2>/dev/null | grep -oP '(?<=\s")\d+\.\d+\.\d+\.\d+(\/\d+)?(?=")' > /var/www/html/iplist/vpn_ipv4.txt
curl https://raw.githubusercontent.com/MISP/misp-warninglists/main/lists/vpn-ipv6/list.json 2>/dev/null | grep -oP '(?<=\s")([0-9a-fA-F:]+\/\d+)(?=")' > /var/www/html/iplist/vpn_ipv6.txt
curl https://ip-ranges.amazonaws.com/ip-ranges.json 2>/dev/null | grep -oP '(?<="ip_prefix": ")\d+\.\d+\.\d+\.\d+/\d+' > /var/www/html/iplist/aws_v4.txt
curl https://ip-ranges.amazonaws.com/ip-ranges.json 2>/dev/null | grep -oP '(?<="ipv6_prefix": ")([0-9a-fA-F:.]+/\d+)' > /var/www/html/iplist/aws_v6.txt
curl https://www.gstatic.com/ipranges/cloud.json 2>/dev/null | grep -oP '(?<="ipv4Prefix": ")\d+\.\d+\.\d+\.\d+/\d+' > /var/www/html/iplist/gcp_v4.txt
curl https://www.gstatic.com/ipranges/cloud.json 2>/dev/null | grep -oP '(?<="ipv6Prefix": ")([0-9a-fA-F:.]+/\d+)' > /var/www/html/iplist/gcp_v6.txt
curl https://raw.githubusercontent.com/MISP/misp-warninglists/main/lists/ovh-cluster/list.json 2>/dev/null | grep -oP '(?<=\s")\d+\.\d+\.\d+\.\d+(?=")' | awk '{print $1"/32"}' > /var/www/html/iplist/ovh_v4.txt
curl https://raw.githubusercontent.com/MISP/misp-warninglists/main/lists/ovh-cluster/list.json 2>/dev/null | grep -oP '(?<=\s")[0-9a-fA-F:]+(?=")' | awk '{print $1"/128"}' > /var/www/html/iplist/ovh_v6.txt
curl https://docs.oracle.com/en-us/iaas/tools/public_ip_ranges.json 2>/dev/null | grep -oP '(?<="cidr": ")\d+\.\d+\.\d+\.\d+/\d+' > /var/www/html/iplist/oracle.txt
curl https://geoip.linode.com/ 2>/dev/null | grep -oP '^\d+\.\d+\.\d+\.\d+/\d+' > /var/www/html/iplist/linode_v4.txt
curl https://geoip.linode.com/ 2>/dev/null | grep -oP '^[0-9a-fA-F:]+/\d+' > /var/www/html/iplist/linode_v6.txt
