# Bug Bounty Bootcamp - Vickie Li

## Table of Contents

- [Chapter 1: Picking a Bug Bounty Program](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-1-picking-a-bug-bounty-program)
- [Chapter 2: Sustaining Your Success](https://github.com/Xerips/BookNotes/blob/main/BugBountyBootcamp/BugBountyBootcamp.md#chapter-2-sustaining-your-success)
- [Chapter 3: How the Internet Works]()

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
  <pre>
  Example:                  port 80 - HTTP service  
                          /  
  browser --> web server -- port 25 - Email service  
                          \  
                            port 21 - ftp service  
  </pre>

  **Internet Ports**

- You connect to a server through a port which range in number from 0 to 65,535
- Users connect to a server through a port which is mapped to a specific service
  - This makes sending and receiving information more efficient as conventions allows for this information to all be processed in the same way

\*\* Requests and Responses
