
I've been waiting for [Let's Encrypt](https://letsencrypt.org/) for a long time. For those of you, who haven't heard of it, Let's Encrypt is a free service providing SSL certificates so everyone can afford to protect their websites using SSL. It was finally released a short while ago and now on my Christmas vacation I had time to play around with it.

There were some gotchas and problems so I decided to write a short article how I overcame them.

This website is running on [Digital Ocean's](https://www.digitalocean.com/) virtual machine with Ubuntu 15.10. Some Linux distributions hae Let's Encrypt software available from the distribution's own repositories but I ended up cloning from [the master branch](https://github.com/letsencrypt/letsencrypt).

    git clone https://github.com/letsencrypt/letsencrypt
    cd letsencrypt/

Problem #1 was that I hadn't set up a proper CNAME record for my domain. In other words my website could only be reached from [http://villesalonen.fi](http://villesalonen.fi) but not from [http://www.villesalonen.fi](http://www.villesalonen.fi). This was quickly fixed from Digital Ocean's excellent control panel. Unfortunately propagation of DNS records takes sometime so I couldn't immediately request for a certificate for both villesalonen.fi and www.villesalonen.fi. More on this later on.

Problem #2 was that if I had Apache for webserver I could have tried automatic Apache module of Let's Encrypt but as I'm using nginx I had to go in another direction. Let's Encrypt provides a way of requesting the certificate by placing automatically generated file under www root so I decided to give it a try:

    ./letsencrypt-auto certonly --webroot -w /var/www/villesalonen/ -d villesalonen.fi -d www.villesalonen.fi

This failed and the last error message on the screen referenced www.villesalonen.fi so I thought it was related to slow DNS propagation of the new CNAME record. I tried to pinpoint the problem further by only using the definitely working villesalonen.fi domain but that didn't work either.

This brings us to problem #3. Let's Encrypt generates the file in /path/to/webroot/.well-known/acme-challenge with a random-esque filename but this file couldn't be found via HTTP request. First instinct was to blame the directory name preceded with dot. These are typically automatically hidden on Apache server. I quickly ruled that out:

    cp -r .well-known well-known

The problem persisted. After intense staring for a few seconds I ventured into my web root folder and found out that I had forgotten how [Jekyll](https://jekyllrb.com/) places statically generated HTML files in a subdirectory named _site. To make sure that everything went as I expected I used more manual version of Let's Encrypt setup:

    ./letsencrypt-auto certonly --manual

This manual version instructed me to manually generate the file with the expected content:

    printf "%s" bmrPK6IaftQeaVxuhTvjR-EA-bY4M5KmTJZXPeQqxTk.a62iCD1lFDqBBWtXP2FIsBCNwSiwvJGaKJffJNhxeEk > /var/www/villesalonen/_site/.well-known/acme-challenge/bmrPK6IaftQeaVxuhTvjR-EA-bY4M5KmTJZXPeQqxTk

After making sure that the file could indeed by found I completed the setup and lo and behold, I finally successfully generated the certificates. Certificates were automatically placed in /etc/letsencrypt/live/. My first and poorly copy-pasted version of nginx configuration file with certificates looked like this:

    server {
        listen 443;
     
        server_name villesalonen.fi;
     
        ssl_certificate /etc/letsencrypt/live/villesalonen.fi/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/villesalonen.fi/privkey.pem;
     
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_ciphers AES256+EECDH:AES256+EDH:!aNULL;
     
        location / {
            root /var/www/villesalonen/_site/;
        }
    }
     
    server {
        listen 80;
        server_name villesalonen.fi;
        return 301 https://$host$request_uri;
    }

Only part of this configuration that actually worked was redirect from port 80 to port 443. Port 443 only gave me an error page from Chrome that something went wrong with the SSL connection. Problem #4 had presented itself. /var/log/nginx/error.log didn't give any recent errors and access.log entries looked like this:

    91.157.67.239 - - [30/Dec/2015:12:11:01 +0200] "\x16\x03\x01\x00\xCA\x01\x00\x00\xC6\x03\x03\xA9\x0B}\xEA\xE1A\xAB\xF5\xF6\xFA\xCC\xC5{U\xC9\xA61\x16\xFF\x83Q\xDB\x05\xA1\x96R\xC57q3\x80\x9E\x00\x00\x1E\xC0+\xC0/\x00\x9E\xCC\x14\xCC\x13\xC0" 400 181 "-" "-"
    91.157.67.239 - - [30/Dec/2015:12:11:02 +0200] "\x16\x03\x01\x00\xA3\x01\x00\x00\x9F\x03\x02\xD5\x1CK]\xC6x8_\xF6\xAE,\xEB\xED\xDF-1\xB1I!C\xD3\xFA/H\xC6\x11{\xDF<k\xD7~\x00\x00\x14\xC0" 400 181 "-" "-"
    91.157.67.239 - - [30/Dec/2015:12:11:02 +0200] "\x16\x03\x01\x00\xA3\x01\x00\x00\x9F\x03\x01\xC2E\xE8\x86G\x7F\x14\xDD0:\xF2%9\xAE\xCC\x13\xFC#\xBFJ<t[W\x17\xF4$h\xAE\xA9\x1C\x10\x00\x00\x14\xC0" 400 181 "-" "-"

Values "400" on each row would have given a clue to a more knowledgeable person but for me, I didn't realize the problem from this alone. I decided to increase logging verbosity and added the following line to my nginx configuration:

    error_log /var/log/nginx/debug debug;

After reloading nginx with /etc/init.d/nginx reload I finally got the relevant error in a more human-readable form:

    2015/12/30 12:14:28 [info] 1383#0: *48 client sent invalid method while reading client request line, client: 91.157.67.239, server: villesalonen.fi, request: "▒▒t▒▒Q▒▒,N▒▒N▒▒s"
    2015/12/30 12:14:28 [debug] 1383#0: *46 HTTP/1.1 400 Bad Request

This led me to double-check my nginx configuration and I found the problematic line:

    # listen 443;   # BROKEN
    listen 443 ssl; # This works

In plain English this meant that the browser was sending secure HTTPS requests because it was connecting port 443 but the server thought that it should have received non-secure HTTP requests. After this fix I finally had a working SSL connection. Yay!

By this time the DNS changes had propagated so I requested a new certificate with both villesalonen.fi and www.villesalonen.fi domains. Let's Encrypt's manual wizard asked whether I wanted to expand the current certificate with new subdomain and I confirmed the change. Now I had working SSL connection for both domains.

Before deeming the operation successful I decided to have a final look on what Chrome thought of my certificate and I was disappointed to notice that according to Chrome the server used obsolete cipher suite. After a quick googling I found Mozilla's recommended SSL configurations for the most common server software from [Mozilla SSL Configuration Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/). The generated configuration had ssl_ciphers values in correct order which made Chrome a happy camper. After solving the problem #6 with these changes my final nginx configuration looked like this:

    server {
        listen 443 ssl;

        server_name villesalonen.fi, www.villesalonen.fi;

        # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
        ssl_certificate /etc/letsencrypt/live/villesalonen.fi/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/villesalonen.fi/privkey.pem;
        ssl_session_timeout 1d;
        ssl_session_cache shared:SSL:50m;
        ssl_session_tickets off;

        # Diffie-Hellman parameter for DHE ciphersuites, recommended 2048 bits
        ssl_dhparam /etc/ssl/certs/dhparam.pem;

        # modern configuration. tweak to your needs.
        ssl_protocols TLSv1.1 TLSv1.2;
        ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK';
        ssl_prefer_server_ciphers on;

        # HSTS (ngx_http_headers_module is required) (15768000 seconds = 6 months)
        add_header Strict-Transport-Security max-age=15768000;

        # OCSP Stapling ---
        # fetch OCSP records from URL in ssl_certificate and cache them
        ssl_stapling on;
        ssl_stapling_verify on;

        location / {
            root /var/www/villesalonen/_site/;
        }
    }

    server {
        listen 80;
        server_name villesalonen.fi, www.villesalonen.fi;
        return 301 https://$host$request_uri;
    }

Last required step was the generation of /etc/ssl/certs/dhparam.pem but this was done quickly using the following commands:

    cd /etc/ssl/certs
    openssl dhparam -out dhparam.pem 2048

One final check with SSL Labs and I was elated to find that I was graded A+! Mission complete!

Let's Encrypt certificates are valid for 3 months. Fortunately the problems have now been solved so hopefully I should be able to renew certificates with a single command below. I quickly tried it out and the certificates were renewed and the site still works so I'm fairly confident that it will work 3 months from now as well.

    ./letsencrypt-auto certonly --webroot -w /var/www/villesalonen/_site/ -d villesalonen.fi -d www.villesalonen.fi
