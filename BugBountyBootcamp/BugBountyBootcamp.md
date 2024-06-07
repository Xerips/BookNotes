# Bug Bounty Bootcamp - Vickie Li

## Table of Contents

- [Chapter 1: Picking a Bug Bounty Program](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-1-picking-a-bug-bounty-program)
- [Chapter 2: Sustaining Your Success](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-2-sustaining-your-success)
- [Chapter 3: How the Internet Works](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#how-the-internet-works)
- [Chapter 4: Environmental Setup and Traffic Interception](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#environmental-setup-and-traffic-interception)
- [Chapter 5: Web Hacking Reconnaissance](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#web-hacking-reconnaissance)
  - [Google Dorking]()
  - [Scope Discovery]()

### Chapter 1: Picking a Bug Bounty Program

Programs: HackerOne, Bugcrowd, Synack, Cobalt, Intigriti  
History: [Bug Bounty Programs](https://en.wikipedia.org/wiki/Bug_bounty_program)

**Assets:**  
Asset = An application, website, or product that you can hac.  
Pick a program that has assets that play to your strengths, based on your skill set, experience level, and preferences

**Asset Types: **

- **Social Sites and Applications:**

  - Any website where users interact with each other.
  - A lot of potential vulnerabilities due to complexity, high level of user interaction between users and the server
  - Examples: Facebook, Twitter, Github, LINE, Discord
  - Weaknesses:
    - IDORs (Indirect Object Reverences)
    - Info Leaks (directory busting)
    - Account Take Overs (session hijacking)
    - Input validation (SQLi, XSS)
    - Large attack surface
  - Skills Needed:
    - Burpsuite/proxy usage
    - XSS
    - IDOR
    - Useful: JavaScript
  - Downside:
    - Highly targeted
    - Competitive

- **General Web Applications:**

  - Any web application that does not involve user-to-user interaction
  - Users interacts with the server to access application features
  - Low barrier to entry
  - Vary in popularity
  - Examples: Static Websites, Cloud Applications, Consumer Services (Banks, IoT web portals), Google, USDoD, Credit Karma
  - Skills Needed:
    - Server-side vulnerabilities
    - Vulnerabilities specific to the applications tech stack
    - Network vulnerabilities (Subdomain takeovers)
    - Proxy usage
    - Client-side vulnerabilities
    - Useful: Web development, programming
  - Downside:
    - Harder to hack than social Applications
    - Smaller attack surface

- **Mobile Applications (Android, iOS, and Windows):**

  - Specialize in mobile apps only after becoming proficient in hacking web applications
  - Examples: Facebook Messenger, Twitter (X) app, LINE mobile app, Yelp app, Gmail app.
  - Less popular among bug county hunters, less competitive.
  - Skills Needed:
    - Web App hacking
    - Knowledge of structure and programming techniques related to the platform (Android, iOS, Windows, etc.)
    - Attacks and Analysis strategies related to the platform (Certificate pinning bypass, mobile reverse engineering, cryptography)
    - Mobile testing lab setup (Regular device, rooted device, device emulator)
  - Downside:
    - Higher barrier to entry for skill set
    - Higher barrier to entry for equipment/lab setup

- **APIs (Application Programming Interface)**

  - Skills Needed:
    - Web application hacking
    - Mobile app hacking
    - IoT hacking
    - Data leaks
    - Injection flaws

- **Source Code and Executables:**

  - Less competitive, a very small pool of hackers working on these
  - An abundance or type and difficulty
  - Examples: Internet Bug Bounty, PHP language, the WordPress program
  - Skills Needed:
    - Advanced programming
    - Advanced reverse engineering
    - Source code analysis
    - Binary fuzzing
    - Web vulnerabilities
    - Cryptography
    - Software development
  - You don't have to be a master programmer, requires solid understanding of the project's tech stack and architecture

- **Hardware and IoT:**
  - Programs often provide free device to hack
  - Often need a pre-existing relationship with the company
  - The least competitive due to specialized skill set and device access
  - Examples: Cars, Televisions, thermostats, Tesla, Ford
  - Skills Needed:
    - Highly specific to the assets
    - Common IoT vulnerabilities
    - Web vulnerabilities
    - Programming
    - Code analysis
    - Reverse engineering
    - IoT concepts
    - Digital signing
    - Asymmetric encryption schemes
    - Cryptography
    - Wireless hacking
    - Software Development (useful)
  - Downside:
    - Higher skill set barrier to entry
    - May need the money to buy the device(s)

**Bug Bounty Platforms**

- Hosted in two ways:

  1. Bug bounty platform

  - Pros:
    - Transparency into companies
      - Company's process for dealing with reports
      - Disclosed reports
      - Metrics about triage rates, payment amounts, response times
    - Often have reputation systems to showcase experience and gain access to invite-only programs
    - More seamless communication with asset owners
    - Easier to follow up on reports
    - Payment and tax info every time you wubmit a vuln report
    - Bug bounty platforms often step in to provide conflict resolution and legal protection as a third party (getting paid, staying protected)
    - Hacker-to-hacker feedback from platforms is helpful in selecting assets
  - Cons:
    - Reports often get handled by _triagers_ who are often less familiar with a company's products security details (unskilled hackers)
      - Complaints about triagers handling reports improperly are common
    - Platforms break the direct connection between hackers and developers
    - Often more crowded than private bug bounty programs

  2. Independently hosted website

  - Often have direct access to discuss vulnerabilities with security engineers, very valuable learning/networking experience
  - Not a lot of recourse if things go wrong

**Scope, Payouts, and Response Times**

**Program Scope:**

- Defines what and how you are allowed to hack
- Two types of scope:
  1. Asset
  - Which Subdomain
  - Which Products
  - Which Applications
  2. Vulnerability
  - Which vulnerabilities the company will accept as valid bugs
    **Hacking an out-of-scope asset is illegal!!**
- Finding assets with a large scope is a great place for beginners to start
  - The larger the scope, the larger the number of target applications and web pages you can look at
  - Can often find obscure applications that are overlooked by other hackers

**Payout Amounts:**

- VDPs (Vulnerability Disclosure Programs)
  - Reputation only (no payment)
  - Great for learning if you don't need money right away
  - Less competitive, easier to find bugs
  - Still can offer interaction with security engineers for learning/networking
- Bug Bounty Programs
  - Pay per Vulnerability
  - The more critical the vulnerability, the higher the payment
  - low-impact ~$50-$500
  - Critical issues $10,000+
    - This has been increasing over time
    - Apple pays up to $1,000,000 for more sever vulnerabilities

**Response Time:**

- Prioritize programs that have fast response times
  - As a beginning you will make mistakes and having fast response times helps to be able to learn and move on as soon as possible

**Private Programs**

- Open to invited hackers only
- Hackers are selected based on skill set, track record, reputation, etc.
- Much less competitive once in
- Not incredibly difficult to get private invites once you've found a few bugs.
- Tips:
  - Submit a few bugs to public programs
  - Focus on increasing reputation points
  - Go for the highest impact bugs, chain low impact bugs to escalate
  - HackerOne: complete tutorials and solve Capture the Flag challenges
  - Don't spam
  - Be polite and courteous when dealing with security teams

**Choosing the Right Program**

- Pick a program you can succeed in from the start
  - Pick programs that more experience bug hunters pass over to avoid competition
  - Look for unpaid programs or go for programs with BIG scopes
  - Start with VDPs move to large scope increase rep for private invites
  - Dig into the company's process through disclosed Reports
    - Does the company treat its reporters well?
    - Are they respectful and supportive?
    - Do they help you learn?

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 2: Sustaining Your Success

1. Craft a Descriptive Title

- Aim for a one sentence title that sums up the issue.
- Things to consider for the title:
  - What the vulnerability is
  - Where it occurred
  - The potential severity
- Example:
  - Instead of "IDOR on Critical Endpoint"
  - "IDOR on https://example.com/change_password Leads to Account Takeover for All Users."

2. Provide a Clear Summary

- Should contain all of the information you couldn't fit in the title
  - example:
    `The https://example.com/change_password endpoint takes two POST body parameters: user_id and new_password. A Post request to this endpoint would change the password of user_id to new_password. This endpoint is not validating the user_id parameter, and as a result, any user can change anyone else's password by manipulating the user_id parameter.`

3. Include a Severity Assessment

- Ratings should be given in one line:
  - "Severity of the issue: High"
- Don't over or under state the severity
- Severity Rankings:

  - Low: The bug doesn't have the potential to cause a lot of damage. For example, an open redirect that can be used only for phishing is a low-severity bug.
  - Medium: The bug impacts users or the organization in a moderate way, or is a high-severity issue that's difficult for a malicious hacker to exploit. The security team should focus on high- and critical-severity bugs first. For example, a cross-site request forgery (CSRF) on a sensitive action such as password change is often considered a medium-severity issue.
  - High: The bug impacts a large number of users, and its consequences can be disastrous for these users. The security team should fix a high-severity bug as soon as possible. For example, an open redirect that can be used to steal OAuth tokens is a high-severity bug.
  - Critical: The bug impacts a majority of the user base or endagers the organization's core infrastructure. The security team should fix a critical-severity bug right away. For example, a SQL injection leading to remote code execution (RCE) on the production server will be considered a critical issue.

- Resources for researching severity:
  - [Common Vulnerability Scoring System (CVSS)](https://www.first.org/cvss)
  - [Bugcrowd's rating system](https://bugcrowd.com/vulnerability-rating-taxonomy)
  - [HackerOne](https://docs.hackerone.com/hackers/severity.html)

4. Give Clear Steps to Reproduce

- Bad Example:

1. Login to the site and visit https://example.com/change_password
2. Click the Change Password button
3. Intercept the request, and change the user_id parameter to another user's ID.

- Better Example:

1. Make two accounts on example.com: account A and account B.
2. Log in to example.com as account A, and visit https://example.comd/change_password
3. Fill in the desired new password in the new password field, located at the top left of the page.
4. Click the Change Password button located at the top right of the page
5. Intercept the POST request to https://example.com/change_password and change the user_id POST parameter to the user ID of account B.
6. You can now log in to account B by using the new password you've chosen.`

7. Provide a Proof of Concept

- The steps to reproduce may be sufficient for some bugs
- When bugs are more complex it may be helpful to include video, screenshots, or photos documenting your exploit in a POC file
- Examples:
  - Include an HTML file with the CSRF payload embedded. This way the only thing the security team needs to do is to open the HTML file in their browser.
  - For an XML external entity attack, include the crafted CML file that you used to execute the attack
  - For a vulnerability that requires multiple steps to reproduce, provide a screen capture of you walking through the process
  - Saving the security team time by providing payloads will help turn around time and help build a relationship
  - Provide any files, exploits, scripts, or upload files used in the exploit is best practice

6. Describe the Impact and Attack Scenarios

- The severity assessment (CVSS) describes the severity of the consequences of an attacker exploiting the vulnerability, whereas the attack scenario explains what those consequences would actually look like.
- Example:
  - `Using this vulnerability, all that an attacker needs in order to change a user's password is their user_id. Since each user's public profile page lists the account's user_id, anyone can visit any user's profile, find out their user_id, and change their password. And because user_ids are simply sequential numbers, a hacker can even enumerate all the user_ids and change the passwords of all users! This bug will let attackers take over anyone's account with minimal effort.`
  - The Impact section should take into account any mitigating factors as well as the maximum impact that can be achieved
  - It should never overstate a bug's impact or include any hypotheticals

7. Recommend Possible Mitigations

- Only provide possible mitigations if you can be clear and confident in explaining them
- If you're unsure avoid giving suggestions to avoid confusing the security team
- Example:
  - `The application should validate the user's user_id parameter within the change password request to ensure that the user is authorized to make account modifications. Unauthorized request should be rejected and logged by the application`

8. Validate the Report

- Proof read the report
- Recreate the bug by following your report
- Ensure all POC files are correct

#### **Understanding Why You're Failing**

**You participate in the Wrong Programs**

- Read publicly disclosed reports, analyze program statistics on bug bounty platforms, or talk with other hackers
  - You may be working with a company that is difficult or only lists on bug bounty platforms for publicity and don't intend to use the service
- Avoid programs with long response times and programs with low average bounties
- Pick targets carefully and prioritize companies that invest in their bug bounty Programs

**You Don't Stick to a program**

- Dig deep or search wide
  - dig deep into a single function of an application
  - search wide to find lesser known assets of the company

**You Don't Recon**

- Recon with the idea of finding new attack surfaces: new subdomains, new endpoints, and new functionality
- Finding buried treasure is a great way to avoid duplicates or competition

**You go for Only Low-Hanging Fruit**

- Using vulnerability scanners can be pretty useless. Both other hackers and the company themselves will be using vuln scanners too.
- Simplistic bugs have usually already been reported on big projects. This is because many of them have been private before they go public.
- Should still look for low-hanging fruit, but don't be discouraged or stop when you don't find anything

**You don't get into private programs**

- Most bug bounty hunters report gaining most of their rewards through private programs. Make sure you respond!

#### **What to Do When You're Stuck**

1. Take a Break!
2. Build Your Skill Set

- [OWASP](https://owasp.org/www-project-web-security-testing-guide) has testing guides that can help you build your skills towards what's most common
- Play CTFs

3. Gain a Fresh Perspective

- Diversify your targets to break up the monotony
- Look for specific things, when whose don't work, look for other specific things

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### How the Internet Works

**The Client-Server Model**

- The internet is composed of two kinds of devices: Clients and Servers.
  - Clients request resources
  - Servers provide resources
- Web servers provide:
  - HTML files to your browser to display information
  - CSS files to make that display information pretty
  - JavaScript to which enables animation, reacts to use input, resizing of of images as you scroll, validation of user input on the client side all before interacting with the server. JavaScript can also display images and videos
  - Web APIs enable applications to request the data of other systems

**The Domain Name System (DNS)**

- Functions as the phone book for the internet by translating domain names into IP addresses.  
  Example:  
   Browser -- "Where is google.com?" --> DNS server  
   DNS server -- "It's at 216.58.192.132" --> Browser  
   Browser -- "Show me google.com" --> Web Server 216.58.192.132  
   Web Server 216.58.192.132 -- "here you go, google.com" --> Browser

  **Internet Ports**

- You connect to a server through a port which range in number from 0 to 65,535
- Users connect to a server through a port which is mapped to a specific service
  - This makes sending and receiving information more efficient as conventions allows for this information to all be processed in the same way
  <pre>
  Example:                  port 80 - HTTP service  
                          /  
  browser --> web server -- port 25 - Email service  
                          \  
                            port 21 - ftp service  
  </pre>

**Requests and Responses**

- HTTP is a set of rules that specifies how to structure and interpret internet messages and how web clients and web servers should exchange info
- Types of HTTP requests:
  - GET: Retrieves information from the server
  - POST: Submits data to the server
  - OPTIONS: Requests permitted HTTP methods
  - PUT: Used to update a resource
  - DELETE: Used to delete a resource
- Examples of very simple HTTP requests and responses on page 36-37 (simplistic)

#### **Internet Security Controls**

**Content Encoding**

- Data encoding is not just used to privacy or security, it is also used to prevent data corruption
- Used to transfer binary data reliably across machines that have limited support for different content types
- When you transfer data without encoding, data may be screwed up when the internet protocols misinterpret special characters in the message
- Common Data Encoding methods:
  - Base64
  - Hex
  - URL encoding
  - Octal encoding
  - dword encoding
  - Whenever you see encoded data try to decode it to understand what the website is trying to communicate
- Tools for encoding/decoding:
  - Burpsuite
  - [Cyber Chef](https://gchq.github.io/CyberChef)
- When servers encrypt their content before transmission, the data between the client and server is secured against intercepts and eavesdropping

**Session Management and HTTP Cookies**

- Session management is the process that allows the server to handle multiple requests from the same user without asking the user to log in again
- When you log in, the server creates a new session and assigns an associated session ID to your browser that serves as proof of identity
  - Session ID's are often long and unguessable
- When you log out, the server ends the session and revokes the session ID. Session ID's may also be ended if you don't manually logout (timeout)
- Most websites use cookies to communicate session information in HTTP Requests
  - These cookies are stored in your browser
- When you log in later, a new session ID is created and sent to your browser

**Token-Based Authentication**

- Token-based authentication systems store your session ID info directly in some sort of token.
  - Instead of storing your information server-side and querying it using a session ID, tokens allow servers to deduce your identity be decoding the token itself.
  - This way applications won't have to store and maintain session information server-side
- **Risk:** If the server uses information contained in the token to determine the user's identity, couldn't users modify the information in the tokens and log in as someone else?
  - To combat token forgery, applications might encrypt their tokens, or encode the token so that it can be read by only the application itself or other authorized parties
  - This does not completely eliminate the risk of token forgery. It's harder but attackers can tamper with encrypted tokens without understanding the contents. Encoded tokens can also be decoded to read the contents
  - Signing tokens is a more reliable way to prevent token tampering as only the system with the secret signing key can generate the signature
    Example:

1. The user logs in with their credentials.
2. The server validates those credentials and provides the user with a signed token.
3. The user sends the token with every request to prove their identity.
4. Upon receiving and validating the token, the server reads the user's identity information from the token and responds with confidential data.

**JSON Web Tokens**

- JSON web token is one of the most commonly used types of authentication tokens and it has three components:
  1. A header:
  - Identifies the algorithm used to generate the signature
  - It's a base64url-encoded string containing the algorithm name
  - ex. eyBhbGcgOiBIUzI1NiwgdH1wIDogSldUIH0K
  - ex. decoded: { "alg" : "HS256", "typ" : "JWT" }
  2. A payload:
  - Contains information about the user's identity
  - It's a base64url-encoded string containing the algorithm name
  - ex. eyB1c2VyX25hbWUgOiBhZG1pbiB9Cg
  - ex. decoded: { "user_name" : "admin", },
  3. A signature
  - Calculated by concatenating the header with the payload, then signing it with the algorithm specified in the header, and a secret key
  - ex. 4Hb/6ibbViPOzq9SJflsNGPWSk6B8F6EqVrkNjpXh7M
  - Created by signing: eyBhbGcgOiBIUzI1NiwgdH1wIDogSldUIH0K.eyB1c2VyX25hbWUgOiBhZG1pbiB9Cg with HS256 algorithm using the secret key
  - The whole token is made up of each part separated by a period: eyBhbGcgOiBIUzI1NiwgdH1wIDogSldUIH0K.eyB1c2VyX25hbWUgOiBhZG1pbiB9Cg.4Hb/6ibbViPOzq9SJflsNGPWSk6B8F6EqVrkNjpXh7M
  - If done incorrectly, there are ways to bypass the security mechanism and forge arbitrary Tokens

**Manipulating the alg Field**

- Sometimes applications fail to verify a token's signature after it arrives at the server allowing an attacker to bypass the security mechanism by providing an invalid or blank signature
- Attackers do this by tampering with the "alg" field of the token header
  - Applications must restrict the algorithm type used in the JWT to stop attackers from compromising the security of the token through tampering with the "alg" field
  - If the alg field is able to be set to `none` even tokens with empty signature sections would be considered valid
  - example:
    - { "alg" : "none", "typ" : "JWT" } { "user_name" : "admin" }
    - = eyAiYWxnIiA6ICJub25lIiwgInR5cCIgOiAiSldUIiB9.eyAidXNlcl9uYW1lIiA6ICJhZG1pbiIgKQ.
- Allowing the alg field to be set to `none` was originally used for debugging, but if left on attackers can bypass security and log in as anyone
- HMAC and RSA are the most popular signing algorithms
  - If an RSA algo is being used, and the attacker can switch the "alg" field to HMAC, they might be able to create valid tokens by signing the forged tokens with the RSA public key
    - When the field is switched to HMAC the token is still verified with the RSA public key, but this time, they token can be signed with the same public key.

**Brute-Forcing the key**

- Attackers have a lot of information to start with: the algorithm used to sign the token, the payload that was signed, and the resulting signature
- If the key used to sign the token is not complex enough, it might be possible to brute-force it
- If another vulnerability exists (Directory Traversal, external entity attack (XXE), or server side request forgery (SSRF)) that allows the attacker to read the file where the key value is stored, the attacker can steal the key and sign arbitrary tokens of their choosing

**Reading Sensitive Information**

- JWT's often contain sensitive user information, if they aren't encrypted attackers can decode them to access sensative user information
- Properly implemented signature sections provide data integrity, not confidentiality
- Search JWT security issues or vulnerabilities for more examples

**The Same-Origin Policy**

- Same-Origin Policy (SOP) is a rule that restricts how a script from one origin can interact with the resources of a different origin.
  - A script from page A can access data from page B only if the pages are of the same origin
  - This rule protects modern web applications and prevents many common web vulnerabilities
- Two URLs are said to have the same origin if they share the same protocol, hostname, and port number

**Learn to program**

- Learning python or bash can help you automate repetitive tasks and safe lots of time
- Learning to read JavaScript can help you find hidden endpoints that may be vulnerable
- Recommended books:
  - _Learn Python the Hard Way_ by Zed Shaw
  - _Eloquent JavaScript, Third Edition_ by Marijn Haverbeke

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Environmental Setup and Traffic Interception

The setup section is very basic and only necessary if you've never used BurpSuite and don't have a setup for pen testing already.

**A Final Note on... Taking Notes**

- Stay organized
- Keep track of what you've tested and what you've yet to test (regardless of success)
  - Don't waste your time accidentally testing the same things
- Record details about each vulnerability:
  - theoretical concept, potential impact, exploitation steps, and sample proof-of-concept code
- Possible note taking tech:
  - Obsidian (Mark down, brain mapping)
  - XMind (mind mapping tool)
  - \*CherryTree (hierarchical note taking, good for searching through your notes and building large note bases)
  - \*NeoVim (Cuz why not? I use it for everything else)
- Note taking tips:
  - Take notes about any weird behaviors, new features, misconfigurations, minor bugs, and suspicious endpoints to keep track of potential vulnerabilities
  - Take notes to keep track of your hacking progress, the features you've tested, and those you stil have to check
  - Take notes while you learn: jot down information about each vulnerability you learn about, like its theoretical concept, potential impact, exploitation steps, and sample POC code.
  - Keep you notes organized from the get-go, so you can find them when you need to!
  - Find a note-taking and organization process that works for you, You can try out note-taking tools like Sublime Text, Obsidian, and XMind to find a tool that you prefer.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Web Hacking Reconnaissance

**Manually Walking Through the Target**
- Try to use every function the website has to offer: payments, events, create different users with different privileges, click all the links and see where they go, etc.
- You're exploring the attack surface 

#### **Google Dorking**
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

#### Scope Discovery

Always verify the target's scope which specifies which subdomains, products, and applications you're allowed to attack.  
If dev.example.com and test.example.com are out of scope, manually test around them, or exclude them when using tools that might touch these subdomains.  

**WHOIS and Reverse WHOIS**
Use whois to obtain information like: mailing address, phone number, email address, names, etc.  
- ex.: whois facebook.com
For companies using *domain privacy* you can use a reverse whois for finding more obscure information or internal domains.  
- Use ViewDNS.info (or another public tool) for reverse whois
Between whois and reverse whois you'll have a good set of top-level domains to work with.

**IP Addresses**
- Use nslookup to find the IP address associated with a domain.
  - `$ nslookup facebook.com`
- Use whois with the IP and look for the NetRange to see what range of IP addresses (range) belong to the target. If they have a range, all IP addressed within that range belong to the target.
-  You can compare Autonomous System Numbers (ASNs) to see if multiple IPs belong to the same owner as well.
  - ex.:
  - `whois -h whois.cymru.com 157.240.2.20`
    AS    | IP             | AS Name  
    32934 | 157.240.2.20   | FACEBOOK, US  
  - `whois -h whois.cymru.com 157.240.2.27`
    AS    | IP             | AS Name  
    32934 | 157.240.2.27   | FACEBOOK, US  
- The -h flag in the whois command sets the WHOIS server to retrieve information from, and whois.cymru.com is a database that translates IPs to ASNs. If the company has a dedicated IP range, and doesn't mark those addresses as out of scope, you could plan to attack every IP in that range.

**Certificate Parsing**
- An SSL certificate's Subject Alternative Name field allows cert owners to specify additional hostnames that use the same certificate. You can find those hostnames by parsing this field.
- Online Databases: crt.sh, Cert Spotter, Censys
- crt.sh can send information in JSON format, rather than HTML, for easier parsing.
  - For JSON, you can change the request to `curl https://crt.sh/?q=facebook.com&output=json`

**Subdomain Enumeration**
Tools:  
- Sublist3r: Works by querying search engines and online subdomain databases.
- SubBrute: Brute-forcing tool that guesses possible subdomains until it finds ones that exist.
- Amass: Uses a combination of DNS zone transfers, certificate parsing, search engines, and subdomain databases.
- Gobuster: Another brute-forcing and fuzzing tool.
- [Altdns](https://github.com/infosec-au/altdns/): Automates the process of discovering subdomains with names that are permutations of other subdomains.
Wordlists:  
- Daniel Miessler's [SecLists](https://github.com/danielmiessler/SecLists/) - Gotta have it, it's extensive and well organized.
- Word list Generation: 
  - [Commonspeak2](https://github.com/assetnote/commonspeak2/)
  - [CeWL](https://github.com/digininja/CeWL)
Tips, Tricks, Usages:  
- Use `sort -u wordlist1.txt wordlist2.txt -o hybridlist.txt` to remove duplicate entries in 2 wordlists.
- Gobuster subdomain brute-forcing: `gobuster dns -d target_domain -w wordlist`
- Use knowledge of the target to check for possible subdomains.
  - ex.: you know example.com uses jenkins, check jenkins.example.com to see if it's a valid subdomain.
- look for subdomains of subdomains: found dev.example.com, try also for 1.dev.example.com, etc.
  - recursively check for subdomains by brute forcing your found domains (again and again until no returns).

**Service Enumeration**
Tools:  
- nmap: Active Scanning
- masscan: Active Scanning
- Shodan: Passive Scanning
- Censys: Passive Scanning
- Projects Sonar: Passive Scanning

- Active scanning is where your system directly interacts with the target system to check if certain ports are open. Can be seen and you could have your IP address blocked, or logged, etc.  
- Passive Scanning is where you use a 3rd party to scan the target. This is a way to get information without touching the target.
- The book doesn't go into it (at least in this chapter), but nmap and masscan have a huge amount of functionality. Take a look at the documentation, tutorials, etc. to help build your own commands to create custom enumeration commands for different targets/scenarios.

**Directory Brute-Forcing**
- dirsearch example:
  - `dirsearch -u scanme.nmap.org -e php`
  - -u is the flag for the url you're dir busting, -e is the file extensions you're looking for. You can run it with multiple file extensions.
- gobuster example:
  - `gobuster dir -u target_url -w wordlist`
  - dir to specify directory busting (in contracts to the earlier dns), -u to specify the target url, -w to pass the wordlist.
Tips and Tricks:  
- Use a screenshot tool like [EyeWitness](https://github.com/FortyNorthSecurity/EyeWitness/) or [Snapper](https://github.comdxa4481/Snapper) to automatically verify that a page is hosted on each location
- EyeWitness accepts a list of URLs and takes screenshots of each page. Quickly cycle through images in an image gallery app to see if anything looks interesting.
  - Look for: Developer or Admin panels, directory listing pages, analytics pages, and pages that look outdated and ill-maintained.

**Spidering the Site**
- A web spider tool visits a page, then identifies all the URLs embedded on the page and visits them, then repeats the process.
  - This can uncover hidden endpoints in an application.
Tools:  
- OWASP Zed Attack Proxy (ZAP): Book recommends ZAP for spidering over BurpSuite. Pg. 72 for examples.
- BurpSuite: Uses the "crawler" function to perform spidering/web crawling

**Third-Party Hosting**
- Take a look at the targets third-party hosting footprint.
- Look for S3 buckets (AWS) which stands for Simple Storage Service
  - S3 buckets can contain hidden endpoints, logs, credentials, user information, source code, and other information that might be useful.
- Use Google Dorking
  - `site:s3.amazonaws.com COMPANY_NAME` and
  - `site:amazonaws.com COMPANY_NAME`
  - Naming convention: BUCKET.s3.amazonawes.com or s3.amazonaws.com/BUCKET
  - For targets with custom URLs for S3 buckets:
    - `amazonaws s3 COMPANY_NAME`
    - `amazonaws bucket COMPANY_NAME`
    - `amazonaws COMPANY_NAME`
    - `s3 COMPANY_NAME`
- You can use [GreyhatWarfare](https://buckets.grayhatwarfare.com) to search publicly exposed S3 buckets using a keyword.
  - Supply keywords related to your target, such as the application, project, or organization name, to find relevant buckets.
- [Lazys3](https://github.com/nahamsec/lazys3/) is a tool that helps to bruteforce S3 buckets using a wordlist to guess permutations of common bucket names.
- [Bucket Stream](https://github.com/eth0izzle/bucket-stream/) parses certificates belonging to an organization and finds S3 buckets based on permutations of the domain names found on the certificates. Bucket Stream also checks whether the bucket is accessible to save you time.

- You'll need to install awscli to interact with buckets you've found: `pip install awscli`  
- Configuration documentation can be found at https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html.  

Usage:  
- list the contents of a bucket you've found with:
  - `aws s3 ls s3://BUCKET_NAME/`
- Copy files to your local machine:
  - `aws s3 cp s3://BUCKET_NAME/FILE_NAME/path/to/local/directory`
- Look for anything valuable such as active API keys, personal information, passwords, etc. Report these right away.
  - Exposed s3 buckets alone are often considered vulnerabilities.
- Copy a local file to the targets s3 bucket:
  - `aws s3 cp TEST_FILE s3://BUCKET_NAME/TEST_FILE`
- Remove the TEST_FILE with:
  - `aws s3 rm s3://BUCKET_NAME/TEST_FILE`
- If you can mess with the contents of an s3 bucket, you may be able to change the web application's operations or corrupt data.
- It's best to upload a "I Wuz Here" file and remove it to prove you have access, tampering with company files may result in costly lawsuits.

**GitHub Recon**
- Find the github user names associated with your target by searching the organizations name or product names or by checking the github accounts of known employees
- Find repositories related to the projects you're testing and record them, along with the usernames of the organization's top contributors, which can help you find more relevant repositories.
- Look through the Issues and Comments sections for potential info leaks, unresolved bugs, problematic code, and the most recent code fixes and security patches.
  - New patches are more likely to contain bugs
- Look at any protection mechanisms implemented to see if you can bypass them.
- Once you've found a interesting file, check the Blame and History sections at the top-right  corner of the file's page to see how it was developed
- Look for hardcoded secrets like API keys, encryption keys, database passwords
- Use [Key Hacks](https://github.com/streaak/keyhacks/) to check if the creds are valid and learn how to use them to access the target's services
- Look for functions that deal with authentication, password reset, state-changing actions, or private info reads.
- Pay attention to code that deals with user input, database entries, file reads, and file uploads.
- Look for configuration files to gather more information about their infrastructure
- Look for old endpoints and S3 bucket URLs that you can attack.

- Outdated dependencies and the unchecked use of dangerous functions are also a huge source of bugs.
- Pay attention to dependencies and imports being used and go through the versions list to see if they're outdated.
- Search for publicly disclosed vulnerabilities that would work on your target based on these outdated dependencies and imports.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)
