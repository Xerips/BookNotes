# Recon Cheat Sheet

**Google Dorking**
- Advanced google searches are a powerful technique to find the resources you need quickly and accurately.
- Can be used for recon or finding POCs, Payloads, etc.
- Can be used for finding hidden admin portals, unlocked password files, and leaked authentication keys.

**Google Dorking Operators:**
- ***site***:
  - Tells Google to show you results from a certain site only.
  - ex.: to show results for print() only from python.org
    - print() site:python.org 
- ***inurl***:
  - Searches for pages with a URL that match the search string.
  - ex.: You've just learned that "/course/jumpto.php" could indicate that a site is vulnerable to RCE.
    - You can then search: inurl:"/course/jumpto.php" site:example.com
  - ex.: Search for possibly vulnerable endpoints like a Kibana dashboard:
    - site:example.com inurl:app/kibana 

- ***intitle***:
  - Finds specific strings in a page's title.
  - ex.: You want to search for file-listing pages on a web server and know that they often have "index of" in their titles.
    - intitle:"index of" site:example.com
- ***link***:
  - Searches for web pages that contain links to a specified URL.
  - ex.: You're researching the common regular expression denial-of-service (ReDos) vulnerability. You can easily pull up its definition but might have a hard time finding examples. The link operator can discover pages that reference the vulnerability's Wikipedia page to find discussions on the topic
    - link:"https://en.wikipedia.org/wiki/ReDos"
- ***filetype***
  - Searches for pages with a specific file extension. Use it to find files with extensions like .log, .php, .pwd, etc.
    - filetype:log site:example.com
- ***Wildcard(\*)***
  - Used to indicate "Any character or series of characters."
  - ex.: Replace a word in a search to find all possible matches that could replace that word.
    - "How to hack * using Google"
    - This will result in results like: "How to hack *websites* using Google," "How to hack web apps using Google," "How to hack (ext.) using Google."
  - ex. Search for all of a targets sub domains:
    - site:*.example.com
- ***Quotes (" ")***
  - Adding quotations around your search terms forces an exact match.
  - ex.: Force searches to contain all the words "How to hack," by putting them in quotes.
    - This will not guarantee that the words will be in the order of your quoted text.
- ***Or (|)***
  - Pipe character = "or"
  - | must be surrounded by spaces
  - ex.: Search for "how to hack" on two different sites:
    - "how to hack" site:(reddit.com | stackoverflow.com)
  - ex.: Search for results containing either SQLi or SQL injection:
    - (SQLi | SQL injection)
- ***Minus (-)***
  - Used to exclude search results
  - ex.: You want to search "how to hack" but exclude php hacking:
    - "how to hack websites" -php
- ***ext***
  - similar to filetype, but will look specifically for file extensions (not file types) like .php, .cfm, .asp, .jsp, .pl 
  - ex.:
    - site:example.com ext:php
    - site:example.com ext:txt password

[Google Hacking Database](https://www.exploit-db.com/google-hacking-database/) contains many search queries that could be helpful including queries that look for files containing passwords, common URLs of admin portals, pages build using vulnerable software.
**If you're sending a lot of search queries, Google will start requiring CAPTCHA challenges for visitors from your network. Don't slow down everone else using google on your network, use a VPN/VPS to a different network if you think this may happen.**
