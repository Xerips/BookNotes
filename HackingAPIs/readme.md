# Hacking APIs: Breaking Web Application Programming Interfaces - Corey J. Ball

Note: You can use the Table of Contents on the top right menu bar adjacent to readme.md to navigate this document.

## Chapter 0: Preparing for Your Security Tests

"API security testing does not quite fit into the mold of a general penetration test, nor does it fit into that of a web application penetration test. Due to the size and complexity of many organizations' API attack surfaces, API penetration testing is its own unique service."

- The content in this chapter will help you to guage the amount of activity required for an engagement, help you plan to test all of the feature of the API, and help avoid trouble.
- You need a clear scope for API testing.
- Scoping an API security test requires:
  1. Your methodology.
  2. The magnitude of the testing.
  3. The target features.
  4. Any restrictions on testing.
  5. Report requirements.
  6. Whether you'll conduct remediation testing.

### Receiving Authorization

- It's extremely important that you receive a signed contract that includes the scope of the engagement and grants you authorization to attack the client's resources.
  - This should also include a time frame.
  - Can be a Statement of Work (SOW), that lists approved targets, exclusions, agreed time for conducting testing.
  - Make sure the person signing the contract works for the target company and has the authority to authorize testing.
  - Make sure the assets to be tested all belong to the company you're engaged with. If not, you will need to reach a similar agreement with 3rd parties.
  - Is the authorizing individual in a position to authorize testing on both hardware and software?
- If the client is too restrictive, you may need to discuss with them how malicious hackers don't have a scope or limitations.
- Meet with the client:
  - Spell out what will happen during the test.
  - Document the above in the contract, reminder emails, and or notes.
- Stick to the agreement for the services requested and you should be operating legally and ethically.
  - You may want to consult with a lawyer to be extra safe.

### Threat Modeling an API Test

"_Threat modeling_ is the process used to map out the threats to an API provider."

- If you model the testing on a relevant threat you can choose tools and techniques directed at that attack.
  - Testing for relevant threats saves times and produces higher quality testing results.
- _Threat Actors_:
  - An unskilled member of the public who stumbles upon the API.
  - A customer using the application.
  - A rogue business partner.
  - An insider.
  - A malicious hacker (of varying skill and determination).
- If the threat actor knows nothing about the API, they will need to conduct research to target the application.
- A rogue business partner or insider might know quite a bit about the application without reconnaissance.
- Depending of what perspective your client wants you to assume, there are 3 different levels of testing:
  - **Black Box**: No information given to the tester.
    - Use OSINT to learn more about the company.
    - Map attack surface with search engine research, social media, public financial records, DNS information.
    - Once you've created your target list of IP addresses, URLs, and API-endpoints, you should have the client authorize them for testing.
  - **Grey Box**: Some information given to the tester.
    - The client will do this to avoid spending time (and money) on reconnaissance.
    - This test level will mimic a better informed hacker.
    - Usually includes which targets are inside and outside of scope.
    - Could provide access to API documentation.
    - May be giving a specifically permissioned account.
    - Maybe be able to bypass some network perimeter security controls.
    - BugBounty programs often fall between black box and grey box.
      - Bug Hunters get to decide how much time to spend on reconnaissance in comparison to other techniques.
  - **White Box**: As much information as possible is disclosed.
    - Access to source code (generally).
    - Design information.
    - Software Development Kit (SDK) used to develop the application.
    - Models the threat of an insider attack.
    - The more information is provided, the more thorough the testing.
- The customer's decision to go with Black, Grey, or White box testing should be based on a threat model and threat intelligence.
  - Work with the client using threat modelling to determine the most likely attacker.
- ex. A small business that is politically inconsequential, isn't part of a supply chain for a larger company, and doesn't provide an essential service.
  - This company is not likely to encounter an Advanced Persistent Threat (APT) like a nation-state.
  - Using APT techniques on this company would be like using a drone strike on a petty thief.
  - Use thread modelling to craft a realistic threat.
  - Most likely threat would be an opportunistic, medium-skilled individual who stumbled upon the clients site.
    - They're more likely to use published exploits against known vulnerabilities.
  - Best level fit: Limited Black Box testing.
- **Conduct a survey with the client**
  Should include the clients:
  - Scope of exposure to attacks.
  - Their economic significance.
  - Political involvement.
  - What supply chains they're involved with.
  - If they offer essential services.
  - If there are motives for a criminal to attack them.
  - Put your own survey together or user [MITRE ATT&CK](https://attack.mitre.org) or [OWASP](https://cheatsheatseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html).

### Which API Features You Should Test

- One of the main goals of scoping an API security test is to discover the quantity of work you'll have to do.
- You'll need to find out:
  - How many unique API endpoints, methods, versions, features, authentication and authorization mechanisms, and privilege levels you'll need to test.
  - Determine the magnitude of testing through client interviews, reviewing relevant API documentation, and access to API collections.
  - Use this to determine how many hours it will take to effectively test the client's API.

#### API Authenticated Testing

- Determine how the client wants testing of authenticated and unauthenticated users to be done.
  - The client may want you to test different API users and roles to see if there are vulnerabilities present at any of the different privilege levels.
- Client may want you to test a process used for authentication and authorization.
- Many of the API vulnerabilities are discovered in authentication and authorization.

#### Web Application Firewalls

- If white box testing, you will want to know about the clients web application firewalls (WAFs).
  - A WAF is a device that controls the network traffic that reaches the API.
- If the WAF is setup correctly, you should lose access to the API after performing a simple scan.
- An effective WAF will detect the frequency of requests or request failures and ban your testing device.
- Grey box and white box testing should reveal the WAF to you.
- It's debatable whether you should ask for the security team to relax the WAF for you to make testing easier.
  - It won't be relaxed for the threat actor, but given enough time an APT or advanced hacker may be able to enumerate the WAF and find bypasses.
  - The book seems to point towards time efficiency and it seems that having a portion of the testing done with the full strength of the WAF is good to be able to test against it, but given time restrictions, it may be best to perform some testing while the WAF is relaxed in order to test what an more advanced threat actor may get access to after finding a bypass.
  - Mixing relaxed and full strength WAF testing will help verify the effectiveness of the WAF as well as ensure the application is thoroughly tested in the event that an attacker finds a bypass the WAF.

#### Mobile Application Testing

- Mobile apps often rely on APIs to transmit data within the app and to supporting servers.
- Test these APIs through manual code review, automated source code analysis, and dynamic analysis.
  - **Manual Code Review** involves accessing the mobile application's source code and searching for potential vulnerabilities.
  - **Automated Source Code Analysis** is similar, except it uses automated tools to assist in the search for vulnerabilities and interesting artifacts.
  - **Dynamic analysis** is the testing of the application while it is running. This includes intercepting the mobile app's client API requests and the server API responses and then attempting to find weaknesses that can be exploited.

#### Auditing API Documentation

- API documentation can be full of inaccuracies, outdated information, and information disclosure vulnerabilities.
- In grey and black box testing, an API documentation audit should be included within the scope.
  - A review of the documentation should expose any weaknesses of the API including business logic flaws.

#### Rate Limit Testing

- _Rate limiting_ restricts the number of requests an API consumer can make within a given time frame.
- Rate limiting is enforced by an API provider's web servers, firewall, or WAF and serves two important purposes:
  1. It allows for the monetization of API
  - Because rate limiting is essential to monetizing APIs, it should be included in your scope.
  2. It prevents the overconsumption of the provider's resources.
- ex. A business allows a free-tier API user to make one request per hour.
  - If a consumer pays a fee, they can make 1+X requests per hour.
- If there are not adequate controls in place, a non-paying API consumer could find a way to skip the toll and consume as much data as often as they want.
- Rate limit testing in APIs is not the same as DoS testing.
  - DoS Rate limit testing is about testing resiliency of the computing resources of a target. Can it be overwhelmed to the point of crashing/freezing?
- Organizations typically publish their API request limits in their API documentation and often look like this:
  _You may make X requests within Y time frame. If you exceed this limit, you will get a Z response from our web server._
- If insufficient security controls are in plce to limit access to an API, the API provider will lose money from consumers cheating the system, incur additional costs due to the use of additional host resources, and find themselves vulnerable to DoS attacks.

### Restrictions and Exclusions

- **Unless otherwise explicitly specified**, you should assume you are not authorized to conduct DoS and DDoS attacks.
  - It would be rare for this to be in scope.
- **Pen testing** and **Social Engineering** are also typically kept as separate exercises.
  - Check whether you can use social engineering attacks or not.
    - Phishing, vishing, smishing.
- By default, Bug Bounty Programs do not accept social engineering, DoS, or DDoS attacks, attacks of customers, and access of customer data.
  - If you find a feature that could be used to attack a user, create multiple accounts and attack your own test accounts.
- Certain aspects of an API might be considered a security finding, but are intended as a convenience feature.
  - ex. A login error might display whether it was your username or password that was incorrect, which could allow an attacker to brute-force valid usernames. This may be an accepted risk of the client.
- A program may allow for testing of specific sections of a giver API and may restrict certain paths within an approved API.
  - ex. A banking API provider may share resources with a third party and may not have authorization to allow testing.
    - You may be able to attack `/api/accounts` but not `/api/shared/accounts`.

#### Security Testing Cloud APIs

- When you attack a cloud-hosted application, you are actually attacking the physical servers of the cloud provider (Amazon, Google, Microsoft).
  - Each have their own set of penetration testing terms and services that you'll want to become familiar with.
  - As of 2021, these cloud providers have become more friendly to penetration tester, and fewer of them require authorization submissions.
  - Still, some cloud-hosted web applications and APIs will require you to obtain penetration testing authorization, such as an organizations Salesforce APIs.
- **Policies of the most common providers**:
  - Amazon Web Services (AWS): "AWS has greatly improved its stance on penetration testing, As of this writing, AWS allows its customers to performa all sorts of security testing, with the exception of DNS zone walking, DoS or DDoS attacks, simulated DoS or DDoS attacks, port flooding, protocol flooding, and request flooding. For any exception to this, you must email AWS and request permission to conduct testing. If you are requesting an exception, make sure to include your testing dates, any accounts and assets involved, your phone number, and a description of your proposed attack."
  - Google Cloud Platform (GCP): "Google simply states that you do not need to request permission or notify the company to perform penetration testing. However, Google also states that you must remain compliant with its acceptable user policy (AUP) and terms of service (TOS) and stay within your authorized scope. The AUP and TOS prohibit illegal actions, phishing, spam, distributing malicious or destructive files (such as viruses, worms, and Trojan horses), and interruption to GCP services."
  - Microsoft Azure: " Microsoft takes the hacker-friendly approach and does not require you to notify the company before testing. In addition, it has a "Penetration Testing Rules of Engagement" page that spells out exactly what sort of penetration testing is permitted (https://www.microsoft.com/en-us/msrc/pentest-rules-of-engagement)."
- Stay up to date on these terms and you should be fine.

#### DoS Testing

- DoS attacks represent a huge threat against the security of APIs.
- A successful DoS attack (intentional or unintentional) will result in an unplanned business interruption which would motivate the organization to pursue legal action (seeking damages).
  - ie. They lose money, and want to take it back from those who caused the stoppage of service.
- Whether or not a client is interested in testing for DoS vulnerabilities depends on their _risk appetite_.
- Cutting edge security teams may have a higher risk appetite and allow for a more open scope.
- Certain other companies may have a low risk appetite and working on their systems will be like walking on egg shells where only certain machines are in scope and every exploit run must be first approved.

### Reporting and Remediation Testing

- The report is the most valuable aspect of your testing which should effectively communicate your findings about the effectiveness of their API security controls.
- The report should spell out the vulnerabilities you've discovered and explain to the client how they can perform remediation to improve the security of their APIs.
- The final thing to scope with the client is whether they would like remediation testing.
  - Once the client has the report, they will attempt to fix their vulnerabilities.
  - Performing a re-test will help to verify that the fixes implemented by the client were effective.
  - This could be a test of the specific vulnerabilities found, or it could be an entire system retest to see if the fixes introduced new vulnerabilities.

### Note on Bug Bounty Scope

- On top of bug bounty platforms like BugCrowd and HackerOne, Google, Microsoft, Apple, Twitter, and GitHub all have their own bug bounty programs.
- With bug bounty programs, pay attention to two contracts:
  1. The Terms of Service for the bug bounty provider.
  - Contains important information about earning bounties, reporting findings, and the relationship between the bounty provider, testers, researchers, hackers who participate, and the target.
  2. The Scope of the program.
  - Equips you with the target APIs, descriptions, rewards amounts, rules of engagement, reporting requirements, and restrictions.
  - For API bug bounties, the scope will often include the API documentation or a link to the docs.
  - Violating either of these contracts could result in getting banned from the bug bounty provider, and also legal trouble as well.
- If you're new to bug hunting, the author recommends checking out BugCrowd University.
  - Bug Crowd's page dedicated to API security testing by [Sadako](https://bugcrowd.com/resources/webinars/api-security-testing-for-hackers).
- Make sure you understand the potential rewards, if any, of each type of vulnerability before you spend time and effort on it.
  - ex. There are bug bounties that have been claimed for valid exploitation of rate limiting that the bug bounty host considered spam.
  - Review past disclosure submissions to see if the organization was combative or unwilling to pay out for what seemed like valid submissions.
  - Focus on successful submissions that receive bounties.
  - What type of evidence did the bug hunter provide, and how did they report their finding in a way that made it easy for the orgranization to see the bug as valid?

## Chapter 1: How Web Applications Work

"Before you can hack APIs, you must understand the tehcnologies that support them. In this chapter, I will cover everything you need to know about web applications, including the fundamental aspects of HyperText Transfer protocol (HTTP), authentication and authorization, and common web server databases. Because web APIs are powered by these tehcnologies, understanding these basics will prepare you for using and hacking APIs."

### Web App Basics

- Web apps function on the client/server model:
  - Your web browser, the client, generates requests for resources and sends these to machines called web servers.
  - The web servers send resources to the clients over a network.
- _Web application_ refers to software running on a web server like Wikipedia, LinkedIn, Twitter, Gmail, GitHub, etc.
- Web apps are designed for end-user interactivity.
- Websites, alternatively, are typically read-only and provide one-way communication from the web server to the client.
  - Web apps allow communication to flow in both directions, from server to client and from client to server.
- For an end user to begin using a web application, a conversation must take place between the web browser and a web server.
  - The end user initiates this conversation by entering a URL into their browser address bar.

#### The URL

- The _Uniform Resource Locator (URL)_ is the address used to locate unique resources on the internet.
- All URLs include the protocol used, the hostname, the port, the path, and any query parameters:
  `Protocol://hostname[:port numer]/[path]/[?query][parameters]`
- _Protocols_ are the set of rules computers use to communicate.
  - Primary URL protocols: HTTP, HTTPS, FTP.
- _Ports_ are numbers that specifies a communication channel and are only included if the host does not automatically resolve the request to the proper port.
  - HTTP typically communicates over port 80.
  - HTTPS typically communicates over port 443.
  - FTP typically communicates over port 21.
  - To access a web app that is hosted on a nonstandard port, you can include the port number in the URL.
    - ex. `https://www.example.com:8443`
    - Port 8080 and 8443 are common port alternatives for HTTP and HTTPS respectively.
- _Paths_ on the web server point to the location of the web pages and files specified in the URL.
  - These are the same as the file paths located on your computer, as web servers share a similar file system.
- _Queries_ are an option part of the URL used to perform functionalities such as searching, filtering, and translating the language of the requested information.
  - The web app may also used the query strings to track certain information such as the URL referer, session ID, or user email.
  - They start with a question mark (?) and contain a string that the server is programmed to process.
- _Query Parameters_ are the values that describe what should be done with the given query.
  - ex. The query parameter `lang=en` following the query `page?` might indicate to the web server that it should provide the requested page in English.
  - A query can contain multiple parameters separated by an ampersand (&).
- ex. `https://twitter.com/search?q=hacking&src=typed_query`
  - Protocol: `HTTPS`
  - Hostname: `twitter.com`
  - Path: `search`
  - Query: `?q `
  - Parameters: `hacking`, and `src=typed_query`

#### HTTP Requests

This is all very basic information. Skipped.

## Chapter 2: The Anatomy of Web APIs

"Most of what the average user knows about a web application comes from what they can see and click in the graphical user interface (GUI) of their web browser. Under the hood, APIs perform much of the work. In particular, web APIs provide a way for applications to use the functionality and data of other applications over HTTP to feed a web application GUI with images, text, and videos."

### How Web APIs Work

- Web APIs rely on HTTP to facilitate a client/server relationship between the host of the API (_provider_) and the system or person making an API request (_consumer_).
- ex. Examples of API endpoints:
  `https://example.com/api/v3/users/`
  `https://example.com/api/v3/customers/`
  `https://example.com/api/updated_on/`
  `https://example.com/api/state/1/`

- _Resources_ are the data being requested.
- A _singleton_ resource is a unique object.
  - ex. `/api/user/{user_id}`
- A _collection_ is a group of resources.
  - ex. `/api/profiles/users`
- A _subcollection_ refers to a collection within a particular resource.

  - ex. `/api/user/{user_id}/settings` is the endpoint to access the _settings_ subcollection of a specific (singleton) user.

- When a consumer requests a resource from a provider, the request passes through an API _gateway_, which is an API management component that acts as an entry point to a web application.
- The API gateway filters bad requests, monitors incoming traffic, and routes each request to the proper service or microservice.

  - It also handles security controls such as authentication, authorization, encryption in transit using SSL, rate limiting, and load balancing.

- A _microservice_ is a modular piece of a web application that handles a specific function.
- Microservices use APIs to transfer data and trigger actions.
  - ex. A web app with a payment gateway may have several different features on a single web page: a billing feature, a feature that logs customer account information, and one that emails receipts upon purchase.
  - This application's back end design might be monolithic, meaning all the services exist within a single application.
  - Or, it could have a microservice architecture where each service functions as its own standalone application.
- These should be spelled out in the API _contract_ which is human-readable documentation that describes how to use the API and how you can expect it to behave.
  - Often includes descriptions for: authentication requirements, user permission levels, API endpoints, required request parameters.
- From a hackers perspective, the documentation can reveal which endpoints to call for customer data, which API keys you need in order to become an administrator, and even business logic flaws.
- For a high quality example of API documentation you can look at [GitHub's documentation](https://docs.github.com/en/rest/reference/apps) for the `/applications/{client_id}/grants/{access_token}` endpoint.

  - This documentation includes a description of the purpose of the API request, the HTTP request method to use when interacting with the API endpoint, and the endpoint itself (_/applications_), followed by variable.

- _CRUD_ stands for _Create, Read, Update, Delete_ and describes the primary actions and methods used to interact with APIs.

  - _Create_ is the process of making new records, and is done with POST requests.
  - _Read_ is data retrieval, done through GET requests.
  - _Update_ is how currently existing records are modified without being overwritten and is accomplished with POST or PUT requests.
  - _Detele_ is the process of erasing records, which can be done with the POST or DELETE requests.
  - CRUD is a best practice, but is not always adhered to by developers. You will need to test beyond CRUD when hacking APIs.

- By convention: curly brackets mean that a given variable is necessary within the path parameters.
  - The {client_id} variable must be replaced with an actual client's ID, and the {access_token} variable must be replaced with an actual access token.
  - Tokens are what API providers use to identify and authorize requests to approved API consumers.
  - API documentation may also specify variables with a colon or square brackets:
    `/api/v2/:customers/` or `/api/[collection]/[client_id]`
- The "Parameters" section lays out the authentication and authorization requirements to perform the described actions, including the name of each parameter value, the type of data to provide, where to include the data, and a description of the parameter value.

### Standard Web API Types

- APIs come in a few standard types and generally a given API will use only one type.
  - The type of API is chosen relative to their standard rules, functions, and purposes.
  - You may encounter endpoints that don't match the format and structure of the others of that type, or don't match a standard type at all.
- Being able to recognize typical and atypical APIs will help you know what to expect and test for as an API hacker.
  - Most APIs are self-service, and so the API provider will often let you know the type of API you'll be interacting with.
- Two API types this book looks at:
  - RESTful APIs
  - GraphQL

#### RESTful APIs

- _Representational State Transfer (REST)_ is a set of architectural constraints for applications that communicate using HTTP methods.
  - APIs that use REST are called RESTful or REST APIs.
- REST relies entirely on the use of HTTP.
  - Primarily uses GET, POST, PUT, DELETE, to accomplish CRUD.
- The 6 constraints of the REST design (these are "shoulds" not "musts"):
  1. **Uniform interface:** REST APIs should have a uniform interface. The requesting client device should not matter; a mobile device, an IoT device, and a laptop must all be able to access a server in the same way.
  2. **Client/Server:** REST APIs should have a client/server architecture. Clients are the consumers requesting information, and servers are the providers of that information.
  3. **Stateless:** REST APIs should not require stateful communications. REST APIs do not maintain state during communication; it is as though each request is the first one received by the server. The consumer will therefore need to supply everything the provider will need in order to act upon the request. This has the benefit of saving the provider from having to remember the consumer from one request to another. Consumers often provide tokens to create a state-like experience.
  4. **Cacheable**: The response from the REST API provider should indicate whether the response is cacheable. _Caching_ is a method of increasing request throughput by storing commonly requested data on the client side or in a server cache. When a request is made, the client will first check its local storage for the requested information. If it doesn't find the information, it passes the request to the server, which checks its local storage for the requested infromation. If the data is not there either, the request could be passed to other servers, such as database servers, where the data can be retrieved.
     Making REST APIs cacheable by default is a way to improve overall REST performance and scalability by decreasing response times and server processing power. APIs usually manage caching with the use of headers that explain when the requested information will expire from the cache.
  5. **Layered System:** The client should be able to request data from an endpoint without knowing about the underlying server architecture.
  6. **Code on Demand (optional):** Allows for code to be sent to the client for execution.
- REST is a style rather than a protocol, so each RESTful API may be different.
  - There may be methods beyond CRUD enabled,
  - It's own set of authentication requirements.
  - Subdomains instead of paths for endpoints.
  - Different rate-limit requirements.
  - Etc.
- Organizations may refer to their API as "RESTful" without adhering to the standard.

- Example of a REST API GET request:
  ```
  GET /api/v3/inventory/item/pillow HTTP/1.1
  HOST: rest-shop.com
  User-Agent: Mozilla/5.0
  Accept: application/json
  ```
- Providers response to the above request:

  ```
  HTTP/1.1 200 OK
  Server: RESTfulServer/0.1
  Cache-Control: no-store
  Content-Type: application/json

  {
  "item": {
    "id": "00101",
    "name": "pillow",
    "count": 25
    "price": {
  "currency": "USD",
  "value": "19.99"
  }
    },
  }
  ```

- The request queries the store's inventory for pillows.
- The server responds with JSON indicating the item's ID, name, and quantity.
- If there were an error in the request, the server would respond with an HTTP error code in the 400 range.
- This request provided all the information it had about the resource "pillow", if the consumer's application only needed the name and value of the pillow, the consumer would need to filter out the additional information.

  - What information returned to the consumer depends on how the API provider has programmed its API.

- Common RESTful API headers:

  - These are identical to HTTP headers but are more commonly seen in REST API request than in other API types (Good for identifying REST APIs).
  - Headers, naming conventions, and data interchange format used are normally the best ways to identify API type.
  - **Authorization**:
    - `Authorization` headers are used to pass token or credentials to the API provider.
    - Format: `Authorization: <type> <token/credentials>`
      - ex. `Authorization: Bearer Ab4dtok3n`
    - Different authorization types:
      - _Basic_ uses base64-encoded credentials.
      - _Bearer_ uses an API token.
      - _AWS-HMAC-SHA-256_ uses an access key and secret key (AWS authorization).
  - **Content Type**:
    - `Content-Type` headers are used to indicate the type of media being transferred.
    - Different from `Accept` headers which state the media type you want to receive.
    - `Content-Type` headers describe the media you're sending.
    - Common `Content-Type` headers for REST APIs:
      - `application/json`: Used to specify JavaScript Object Notation (JSON) as a media type.
        - JSON is the most common media type for REST APIs.
      - `application/xml`: Used to specify XML as media type.
      - `application/x-www-form-urlencoded`: A format in which the values being sent are encoded and separated by an ampersand (&), and an equal sign (=) is used between key/value pairs.
  - **Middleware (X) Headers**:
    - `X-<anything>` headers are known as _middleware headers_ serve a multitude of purposes (found outside of APIs as well):
    - `X-Response-Time` used for indicating how long a response took to process.
    - `X-API-Key` used as an authorization header for API keys.
    - `X-Powered-By` used to provide additional information about backend services.
    - `X-Rate-Limit` used to tell the consumer how many requests they can make within a given time frame.
    - `X-RateLimit-Remaining` used to tell consumer how many requests remain before the violate rate-limit-enforcement.
    - Plus a lot more.
    - These headers can provide a lot of useful information to API consumers and hackers alike.

- Recognizing encoding schemes:
  - ex. "hAPI hacker" encoded in:
    - Unicode UTF-8: `\x68\x41\x50\x49\x20\x68\x61\x63\x6B\x65\x72`
    - Unicode UTF-16: `\u{68}\u{41}\u{50}\u{49}\u{20}\u{68}\u{61}\u{63}\u{6b}\u{65}\u{72}`
    - base64-encoded: `aEFQSSBoYWNrZXI=`

#### GraphQL

- Short for _Graph Query Language_.
- GraphQL is a specification for APIs that allow clients to define the structure of the data they want to request from the server.
- GraphQL is RESTful as it follows the six constraints of REST APIs.
- Additionally, GraphQL is _query-centric_ because it is structured to function similarly to a database query language (like SQL).
- To access a GraphQL API you'll typically access the URL where it is hosted and submit an authorized request that contains query parameters as the body of a POST request:
  ```
  query {
    users {
      username
      id
      email
    }
  }
  ```
  - This query would provide you with the usernames, IDs, and emails of the requested resources.
  - The response to this may look like:
  ```
  {
    "data": {
      "users": {
        "username": "hapi_hacker",
        "id": 1111,
        "email": "hapihacker@email.com"
      }
    }
  }
  ```
- GraphQL improves on typical REST APIs in several ways:
  - REST APIs return whatever data the server is programmed to return from an endpoint, nothing more, nothing less.
  - REST APIs are resource based. Consumers may need to make several requests to get all of the information they require.
  - Conversely, consumers may only need a specific value from the API provider, and subsequently need to filter out the extraneous data from the REST APIs response.
  - GraphQL refines this by enabling consumers to use a single request to get the exact data they want.
  - GraphQL lets consumers request specific fields from a resource.
  - GraphQL also uses HTTP and typically depends on a single entry point (URL) using the POST method.
- In a GraphQL request, the body of the POST request is what the provider processes:

  ```
  POST /graphql HTTP/1.1
  HOST: graphql-shop.com
  Authorization: Bearer ab4dtok3n

  {query {
    inventory (item:"Graphics Card", id: 00101) {
  name
  fields {
  price
  quantity} } }
  }
  ```

- The GraphQL request body begins with the `query` operation which is the equivalent to a GET request and used to obtain information from the API.
- The GraphQL node we are querying for ("inventory"), is known as the root query type.
- Nodes, like objects, are made up of fields, similar to key/value pairs in REST.

  - The difference between REST and GraphQL is that we can specify the exact fields we're looking for.
  - In the above example, we're looking for the "price" and "quantity" fields.

- Response to the above:

  ```
  HTTP/1.1 200 OK
  Content-Type: application/json
  Server: GraphqlServer

  {
  "data": {
  "inventory": { "name": "Graphics Card",
  "fields": [
  {
  "price": "999.99"
  "quantity": 25 } ] } }
  }
  ```

- The GraphQL response only returns the provided fields from the request for the specified "Graphics Card".
  - REST APIs would return something like: item ID, item name, and other superfluous information.
- GraphQL still functions using CRUD, which may sound confusing because it relies on POST requests.
- GraphQL uses 3 operations within the POST request to interact with GraphQL APIs:
  - **query**:
    - _Query_ is an operation to retrieve data (read).
  - **mutation**:
    - _Mutation_ is an operation used to submit and write data (create, update, and delete).
  - **subscription**:
    - _Subscription_ is an operation used to send data (read) when an event occurs.
    - _Subscription_ is a way for GraphQL to listen to live updates from the server.
- GraphQL uses _schemas_ which are collection of the data that can be queried within the given service.
  - Having access to a GraphQL schema is similar to having access to a REST API collection.
  - A GraphQL schema will provide you with the info you need in order to query the API.
- You can interact with GraphQL using a browser if there is a GraphQL IDE, like GraphiQL in place.
  - Otherwise, you need a GraphQL client:
    - Postman
    - Apollo-Client
    - GraphQL-Request
    - GraphQL-CLI
    - GraphQL-Compose

**Seemingly random info bubble about SOAP p. 37-38**:

#### SOAP: An Action-Oriented API Format

- _Simple Object Access Protocol (SOAP)_ is a type of action-oriented API that relies on XML. SOAP is one of the older web APIs, originally released as XML-RPC back in the late 1990s, so we won't cover it in this book.
- SOAP works over HTTP, SMTP, TCP, and UDP - It was primarily designed for use over HTTP.
- When used over HTTP, all requests are made using HTTP POST request.
- ex. SOAP Request:

  ```
  POST /Inventory HTTP/1.1
  Host: www.soap-shop.com
  Content-Type: application/soap+xml; charset=UTF-8
  Content-Length: nnn

  <?xml version="1.0"?>

  <soap:Envelope
  xmlns:soap="http://www.w3.org/2003/05/soap-envelope/"
  soap:encodingStyle="http://www.w3.org/2003/05/soap-encoding">

  <soap:Body xmlns:m="http://www.soap-shop.com/inventory">
    <m:GetInventoryPrice>
      <m:InventoryName>ThebestSOAP</m:Inventoryname>
    </m:GetInventoryPrice>
  </soap:Body>

  </soap:Envelope>
  ```

- ex. SOAP response:

  ```
  HTTP/1.1 200 OK
  Content-Type: application/soap+xml; charset=UTF-8
  Content-Length: nnn

  <?xml version="1.0"?>

  <soap:Envelope
  xmlns:soap="http://www.w3.org/2003/05/soap-envelope/"
  soap:encodingStyle:"http://www.w3.org/2003/05/soap-encoding">

  <soap:Body xmlns:m="http://www.soap-shop.com/inventory">
  <soap:Fault>
  <faultcode>soap:VersionMismatch</faultcode>
      <faultstring, xml:lang='en">
        Name does not match Inventory record
      </faultstring>
  </soap:fault>
  </soap:Body>

  </soap:Envelope>
  ```

- SOAP API messages are made up for four parts:
  - The envelope (necessary).
    - An XML tag at the beginning of the message that signifies that the message is a SOAP message.
  - The header (necessary).
    - Can be used to process a message.
    - `Content-Type` request header lets the SOAP provider know the type of content being sent in the POST request (`application/soap+xml`).
    - Headers essentially form an agreement between consumer and provider concerning the expectations within the request.
  - The body (optional).
    - The primary payload, the data being sent to the application.
  - The fault (optional).
    - Used to provide error messaging.

### REST API Specifications

- _API specifications_, AKA description languages, are frameworks that help organizations design their APIs.
  - Automatically create consistent human-readable documentation.
  - Help developers and users know what to expect regarding the API's functionality and results.
  - Without specifications, it would be much harder to create consistency between APIs.
    - Consumers would have to learn how each APIs documentation was formatted and adjust their application to interact with each API.
- With API specifications, consumers can program their application to ingest different specifications and so easily interact with any API using that given specification.
  - Analogy: Specification are like electrical outlet in a house.
    - Instead of having a unique electric socket for every appliance, your house has a single consistent format throughout that allows you to plug in (almost) any appliance you want with no hassle.
    - Specifications are similar, they standardize the interactions to allow for a more "plug and play" experience.
- _OpenAPI Specification 3.0 (OAS)_, previously known as Swagger, is one of the leading specifications for RESTful APIs.
  - OAS organizes and manages APIs by allowing developers to describe endpoints, resources, operations, and authentication and authorization requirements (in a standardized form).
  - Developers can use OAS to create human- and machine-readable API documentation, formatted as JSON or YAML.
  - Standardized API documentation is good for users and developers.
- _RESTful API Modeling Language (RAML)_ is another way to consistently generate API documentation.
  - RAML is an open specification that works exclusively with YAML for document formatting.
  - Designed was designed to document, design, build, and test REST APIs (similar to OAS).
  - More info about [RAML](https://github.com/raml-org/raml-spec).

### API Data Interchange Formats

- APIs use several formats to facilitate the exchange of data.
  - Specifications use these different formats to document APIs.
  - Some APIs require a specific format (SOAP), others allow the client to specify the format to use in the request and response body.

#### JSON

- _JavaScript Object Notation (JSON)_ is the primary data interchange format we'll use throughout this book - It is widely used for APIs.
- JSON organizes data in a way that is both human-readable and easily parsable by applications.
  - Many programming languages can turn JSON into data types they can use.
- JSON represents objects as key/value pairs separated by commas, within a pair of curly brackets.
  - ex.
  ```
  {
    "firstName": "James",
    "lastName": "Lovell",
    "tripsToTheMoon": 2,
    "isAstronauth": true,
    "walkedOnMoon": false,
    "comment" : "This is a comment",
    "spacecrafts": ["Gemini 7", "Gemini 12", "Apollo 8", "Apollo 13"],
    "book": [
      {
        "title": "Lost Moon",
        "genre": "None-fiction"
      }
    ]
  }
  ```
  - Everything between the first curly bracket and the last is considered the object.
  - Within the object are several key/value pairs.
    - `"firstName": "James"`, `"lastName:" "Lovell"`, etc.
  - The first entry is the key, and describes the value pair.
  - The second is the value, and is the data representation of an acceptable data type.
    - Can be a string, integer, Boolean, Null, array, or another object.
    - `"book"` is a nested object and contains its own set of key/value pairs.
  - JSON does not allow inline comments.
    - Any sort of comment-like communication must take place as a key/value pair like `"comment" : "This is a comment."`
    - You can also find comments in the API documentation or the HTTP response.

| Type           | Description                                                                                                                | Example                                                                                             |
| -------------- | -------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Strings        | Any combination of characters within double quotes                                                                         | {<br> "Motto":"Hack the planet",<br> "Drink":"Jolt",<br> "User":"Razor"<br> }                       |
| Numbers        | Basic integers, fractions, negative numbers, and exponenets. Notice that the multiple items are comma-separated.           | {<br> "number_1" : 101,<br> "number_2" : -102,<br> "number_3" : 1.03,<br> "number_4" : 1.0E+4<br> } |
| Boolean values | Either true or false                                                                                                       | {<br> "admin" : false,<br> "privesc" : true<br> }                                                   |
| Null           | No Value                                                                                                                   | {<br> "value" : null<br>}                                                                           |
| Arrays         | An ordered collection of values. Collections of values are surrounded by brackets ([]) and the values are comma-separated. | {<br> "uid" : ["1","2","3"]<br> }                                                                   |
| Objects        | An ordered set of value pairs inserted between curly brackets ({}). An object can contain multiple key/value pairs.        | {<br> "admin" : false,<br> "key" : "value",<br> "vulnerabilities" : "galore"<br> }                  |

- ex. JSON data from a Twitter API response:
  ```
  {
  "id":1278533978970976256,
  "id_str":"1278533978970976256",
  "full_text":"1984: William Gibson published his debut novel, Neuromancer. It's a cyberpunk tale about Henry Case, a washed up computer hacker who's offered a chance at redemption by a mysterous dude named Armitage. Cyberspace. Hacking. Virtual reality. The matrix. Hacktivism. A must read. https:\/\/t.co\/R9hm2LOKQi",
  "truncated":false
  }
  ```
  - This shows key value pairs with numbers, strings, and booleans.

#### XML

- _Extensible Markup Language (XML)_ format has been around a long time.
- XML is characterized by the descriptive tags it uses to wrap data.
- REST APIs can use XML, but it's usually used in SOAP APIs.
  - SOAP APIs can _only_ use XML.
- The twitter example above looks like this in XML:
  ```
  <?xml version="1.0" encoding="UTF-8" ?>
  <root>
      <id>1278533978970976256</id>
    <id_str>1278533978970976256</id_str>
    <full_text>1984: William Gibson published his debut novel, Neuromancer. It&#x27;s a cyberpunk tale about Henry Case, a washed up computer hacker who&#x27;s offered a chance at redemption by a mysterous dude named Armitage. Cyberspace. Hacking. Virtual reality. The matrix. Hacktivism. A must read. https://t.co/R9hm2LOKQi </full_text>
    <truncated>false</truncated>
  </root>
  ```
- XML always begins with a _prolog_ that contains information about the XML version and encoding used.
- _elements_ are the most basic parts of XML.
  - An element is any XML tag or information surrounded by tags.
  - \<id_str>1278533978970976256\<id_str> is an example of one of the elements.
  - XMl must have a root element (like \<root>) and can contain child elements.
  - ex. of the child element \<BookGenre>:
    ```
    <LibraryBooks>
      <BookGenre>SciFi</BookGenre>
    </LibraryBooks>
    ```
- Comments in XML are surrounded by two dashes.
  - `<!--XML comment example-->`
- Key differences between XML and JSON are JSON's descriptive tags, character encoding, and length.
  - XML takes much longer to convey the same information, a difference of 565 bytes in the previous examples.

#### YAML

- YAML stands for _YAML ain't markup language_.
- It was created as a more human- and computer-readable format for data exchange.
- YAML documents also contain key/value pairs.
  - Values can be: numbers, strings, Booleans, null values, and sequences.
- ex.
  ```
  ---
  id: 1278533978970976256
  id_str: 1278533978970976256
  full_text: "1984: William Gibson published his debut novel, Neuromancer. It's a cyberpunk tale about Henry Case, a washed up computer hacker who's offered a chance at redemption by a mysterous dude named Armitage. Cyberspace. Hacking. Virtual reality. The matrix. Hacktivism. A must read. https://t.co/R9hm2LOKQi"
  truncated: false
  ...
  ```
  - Nice isn't it?
  - YAML documents start with --- and end with ...
  - Quotes around strings are optional.
  - URLs don't need to be encoded with backslashes.
  - YAML uses indentation instead of curly brackets to represent nesting.
  - Allows comments to begin with #.
- API specifications are often formatted in JSON or YAML because of the human-readability.
- More of YAML in action @ [https://yaml.org](https://yaml.org).

### API Authentication

- APIs may allow public access to users without authentication, but when APIs allow access to proprietary or sensitive data, it will use some form of authentication and authorization.
- The API authentication process should validate that users are who they claim to be, and the auth process should grant them the ability to access the data they are allowed to access.
- The common principle: Users send information to the provider (API Gateway?) when making a request, and the provider (API Gateway?) must link that info to a user that exists before granting or denying access to a resource.
- Authentication is the process of providing and verifying an identity.
  - In a web-app authentication is proving you are a valid user to the server.
  - Often done through credentials which consist of a unique ID and a password.
  - If the credentials are acceptable (they match the credentials stored on the server), the web server will create a user session and often issue a cookie to the client.

#### Basic Authentication

- _HTTP basic authentication_ is the simplest form of web authentication.
  - The user sends their username and password in a header or the body of a request.
  - The credentials are either sent in plaintext (`username:password`) or are encoded in base64 to save space.
  - Encoded data is not encrypted, and if captured can easily be decoded.
- HTTP Basic authentication has no inherent security and completely depends on other security controls.
  - Can be compromised through capturing HTTP traffic, performing a man-in-the-middle attack, tricking the user into providing their creds through social engineering, and brute-forcing attacks.
- APIs are often stateless, so those using HTTP basic authentication require the consumer to provide credentials in every request.
  - If used, API providers will often use basic authentication for the first request, then issue an API key or other token for all other requests.

#### API Keys

- _API keys_ are unique strings that API providers generate and grant to authorize access for approved users.
  - Users provide this key whenever specified by the provider (API documentation, specifications?).
  - Typically, the provider (API Gateway?) will require the consumer (user) to pass the key in query string parameters, request headers, body data, or as a cookie when they make a request.
- ex. An API key included in a query string to a URL: `/api/v1/users?apikey=ju574n3xmpl34p1k3y`
- ex. An API key included as a header: `"API-Secret": "17813fg8-46a7-5006-e235-45be7e9f2345"`
- ex. An API key passed in as a cookie: `Cookie: API-Key= 4n07h3r4p1k3y`
- API keys can be more secure than basic authentication:
  - Keys can be long, complex, and randomly generated which makes them resistant to brute-forcing.
  - Can have set expiry dates to limit the length of time they are valid.
- Associated risks to using API keys:
  - If the API key is generated using user data, the way in which they are constructed could be guessed, and an attacker could use this info to forge API keys.
  - Could be exposed in online repositories, left in code comments, intercepted when transferring over non-encrypted connections, stolen through phishing, etc...

#### JSON Web Tokens

- _JSON Web Tokens (JWT)_ are a type of token commonly used in API token-based authentication.
  - They work like this:
    - The API user authenticates to the API provider with a username and password.
    - The provider (authentication server) generates a JWT and sends it back to the user.
    - The consumer (user) adds the provided JWT to the `Authorization` header in all API requests.
- JWTs consist of three parts, all of which are base64-encoded:
  - The header: Includes information about the algorithm used to sign the token.
  - The payload: The data included within the token (username, time-stamp, issuer).
  - The signature: Encoded and encrypted message used to validate the token.

_Note: The signature field is not a literal encoding of HMACSHA512 ...; rather, the signature is created by calling the encryption function HMACSHA512(), specified by "alg": "HS512", on the encoded header and payload, and then encoding the result_

| Component | Content                                                                                                                             |
| --------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Header    | {<br> "alg": "HS512",<br> "typ": "JWT"<br> }                                                                                        |
| Payload   | {<br> "sub": "1234567890",<br> "name": "hAPI hacker",<br> "iat": 1516239022<br> }                                                   |
| Signature | HMACSHA512(<br> &nbsp;&nbsp;base64UrlEncode(header) + "." +<br> &nbsp;&nbsp;base64UrlEncode(payload),<br> SuperSecretPassword<br> ) |
| JWT       | eyJhbGci...n4jm0Q                                                                                                                   |

- JWTs are secure if implemented properly.
- Things that make JWTs insecure:
  - If implemented without encryption.
  - Chapter 10 for more on hacking JWTs.

#### HMAC

- _Hash-based message authentication code (HMAC)_ is the primary API authentication method used by Amazon Web Services (AWS).
- When using HMAC the provider creates a secret key and shares it with the consumer (user).
  - When a consumer (user) interacts with the API, an HMAC hash function is applied to the consumer's (user's) API request data and secret key.
  - The resulting hash (message digest) is added to the request and sent to the provider (web server, API Gateway).
  - The provider calculates the HMAC, as the user did, by running the message and key through the hash function.
    - If the users hash value and the servers hash value are the same, then the server determines that the user is authorized to make the request.
    - If they don't match, it would indicate the user's key is incorrect of the message was tampered with.
- The level of security of the message digest depends on the cryptographic strength of the hash function and secret key.
  - Stronger hash mechanisms generally produce longer hashes.
- You may notice some applications using HMAC-SHA1 or HMAC-MD5.
  - This is not the same as using SHA1 or MD5 which have known vulnerabilities.
  - As of the writing, both HMAC-MD5 and HMAC-SHA1 are considered (mostly) secure. They are both not recommended for use despite not being easily exploited.
  - Use SHA-256 or SHA_512 as they are cryptographically stronger.
- The security of HMAC depends on keeping the secret key private.
- The decision of which hash function to use is made by comparing the organizations priorities between performance and security.
  - More secure functions are slower.

#### OAuth 2.0

- _OAuth 2.0 (OAuth)_ is an authorization standard that allows different services to access each other's data. often using APIs to facilitate the service-to-service communication.
- ex. If you automatically share your Twitter (X) tweets on LinkedIn, Twitter would be the service provider and LinkedIn would be the application or client.
  - To accomplish this, LinkedIn will need authorization to access your Twitter information.
  - Both twitter and LinkedIn implement OAuth, and so you can go to LinkedIn and authorize Twitter.
    - Doing this will send you to `api.twitter.com` to authorize LinkedIn to access your Twitter account.
  - Once authorized, Twitter generates a limited, time-based access token for LinkedIn.
  - LinkedIn then provides that token to Twitter to post on your behalf.
    - You do not need to have LInkedIn your Twitter credentials.
- The process looks like this:
  1. LinkedIn sends an authorization request to the resource owner (Twitter).
  2. Twitter sends an authorization grant back to LinkedIn.
  3. LinkedIn sends the authorization grant to Twitter's authorization server.
  4. Twitters authorization server sends an access token back to LinkedIn.
  5. LinkedIn sends the access token to Twitters resource server.
  6. Twitters resource server sends the protected resource back to LinkedIn.
- OAuth is one of the most trusted forms of API authorization.
  - OAuth adds security to the authorization process, but it also increases the attack surface.
  - Security flaws, however, are most often due to how the API provider implements OAuth than how OAuth itself works.
  - Poor implementation of OAuth can lead to token injection, authorization code reuse, cross-site request forgery, invalid redirection, and phishing.

#### No Authentication

- It is sometimes perfectly acceptable for an API to have no authentication.
- If an API doesn't handle sensitive data and only provides publicly available information, the provider could make the case that no authentication is necessary.

### APIs in Action: Exploring Twitter's API

1. Once you've entered a URL into your browser, the browser submits an HTTP GET request to the web server at `twitter.com`

```
GET / HTTP/1.1
Host: twitter.com
User-Agent: Mozilla/5.0
Accept: text.html
--snip--
Cookie: [...]
```

2. Twitter web app receives the request and responds to the GET request by issuing a successful 200 OK response:

```
HTTP/1.1 200 OK
cache-control: no-cache, no-store, must-revalidate
Connection: close
content-security-policy: content-src 'self'
content-type: text/html; charset=utf-8
server: tsa_a
--snip--
x-powered-by: Express
x-response-time: 56

<!DOCTYPE html>
<html dir="ltr" lang="en">
--snip--
```

- This response header contains the status of the HTTP connection, client instructions, middleware information, and cookie-related information.

  - _Client instructions_ tell the browser how to handle the requested information, such as caching data, the content security policy, and instructions about the type of content that was sent.

- ex. A user looks up "hacking" using twitter's search bar.
  - Starts by issuing a POST request to Twitter's API - Twitter uses APIs to distribute requests and seamlessly provide requested resources to many users.
  ```
  POST /1.1/jot/client_event.json?q=hacking HTTP/1.1
  Host: api.twitter.com
  User-Agent: Mozilla/5.0
  --snip--
  Authorization: Bearer AAAAAAAAAAAAAAA...
  --snip--
  ```
  - The Twitter API responds with JSON containing the search results, which includes tweets and information about each tweet such as user mentions, hashtags, and post times.
  ```
  "created_at": [...]
  "id": 1278533978970976256
  "id_str": "1278533978970976256"
  "full-text": "1984: William Gibson published his debut novel..."
  "truncated": false,
  --snip--
  ```
  - Seeing as the Twitter API adheres to CRUD, API naming conventions, tokens for authorization, _application/x-www-form-urlencoded_, and JSON as a data interchange makes it pretty clear that this API is a RESTful API.

## Chapter 3: Common API Vulnerabilities

- Chapter contains most of the vulnerabilities included in the Open Web Application Security Project (OWASP) API Security Top 10 list, plus information disclosures and business logic flaws.

### Information Disclosure

- When an API and its supporting software share sensitive information with unprivileged users it has a _information disclosure_ vulnerability.
- Places to look:
  - API responses, code repositories, search results (google dorking), news, social media, the targets website, API documentation, public API directories.
- What to look for:
  - Any information that attackers can leverage to exploit the application.
  - ex. A site using the WordPress API may unknowingly share user information with anyone who navigates to the API path _/wp-json/wp/v2/users_ which returns all of the WordPress usernames (or slugs).
  - Request: `GET https://www.example.com/wp-json/wp/v2/users`
  - Might return: `[{"id":1, "name":"Administrator", "slug":"admin"}],` as well as others like: `[{"id":2, "name":"Vincent Valentine", "slug":"Vincent"}]`.
  - Once attackers have some valid usernames, they can attempt brute-forcing, credential-stuffing, or password-spraying attacks.
- Error messaging can also lead to information disclosures.
  - A classic attack using error messaging would be to brute for usernames from a list with a known incorrect password.
    - If the error message returns something like "Username doesn't exist" when an invalid username is used, and "Incorrect Password" when a valid username is used with an incorrect password, an attacker can find valid usernames using a username list and a tool like burpsuite to quickly submit the usernames then sort for response length to find valid usernames.
- The author doesn't do a great job of explaining this, but essentially I think he wanted to say: Finding software names and versions, operating system name and version, system logs (wow, must be nice), and searching them for known vulnerabilities is a common attack vector for hackers. Having this information be publicly discoverable sets up the application for attacks if they aren't up to date on patching and a known vulnerability exists for their software suite.
- API responses can reveal information within headers, parameters, and verbose errors.
- Other good sources of information are API documentation and resources gathered during recon.

### Broken Object Level Authorization

- One of the most prevalent vulnerabilities in APIs is _broken object level authorization (BOLA)_.
- Occur when an API provider allows an API consumer access to resources they are not authorized to access.
- If no object-level access controls exist, no checks will be conducted to ensure the users can only access their own resources.
  - If missing, User A will be able to request User B's resources.
- APIs user a value such as names or numbers to identify various objects.
  - When you discover an object ID, you should test it to see if you can interact with the resources of other users when unauthenticated and when authenticated as a different user.
- ex. Sending a GET request to access the user Cloud Strife's user information:
  - `https://bestgame.com/api/v3/users?id=5501`
  - From which we receive:
  ```
  {
    "id": "5501",
    "first_name": "Cloud",
    "last_name": "Strife",
    "link": "https://www.bestgame.com/user/strife.buster.97",
    "name": "Cloud Strife",
    "dob": "1997-01-31",
    "username": "strife.buster.97"
  }
  ```
  - This is no problem if you're authorized to access Cloud's information, but if you are able to access another users information in the same way without authentication it is a big problem.
  - An attacker could start iterating from the known users user ID to see if they can bring up other users information.
  - `https://bestgame.com/api/v3/users?id=5502` and it returns some other users information without authenticating to that user with:
  ```
    "id": "5502",
    "first_name": "Zack",
    "last_name": "Fair",
    "link": "https://www.bestgame.com/user/shinra-number-1",
    "name": "Zack Fair",
    "dob": "2007-09-13",
    "username": "shinra-number-1"
  ```
  - In this case Cloud has discovered a BOLA.
- Detecting patterns within API paths and parameters should help you to predict other potential resources.
  - Examples:
  - `GET /API/resource/1`: 1 is something to test.
  - `GET /user/account/find?user_id=15`: Test on the 15.
  - `POST /company/account/Apple/balance`: Try replacing Apple with Google, or other online payment providers.
  - `POST /admin/pwreset/account/90`: Mess with the 90 value to see what happens.

### Broken User Authentication

- _Broken user authentication_ refers to _any_ weakness within the API authentication process.
- This vulnerability occurs when an API provider either doesn't implement an authentication protection mechanism or implements a mechanism incorrectly.
- API authentication can be complex systems that include several processes, which means a larger attack surface.
- To remain stateless (a requirement of RESTful APIs), APIs often require a registration process in order to issue a unique token that can be included with each request made to the API to demonstrate they're authorized to make such requests.
  - As a result, the registration process, token handling, and the system used to generate the token become potential targets for attack.
  - To determine if the token generation process is weak, you could collect a sampling of tokens and analyze them for similarities.
    - If the token generation process doesn't have sufficient entropy, you may be able to forge your own or hijack someone else's.
  - Token handling could include the storage of tokens, the method of transmitting tokens across a network, the presence of hardcoded tokens, etc.
    - Look for hardcoded tokens in JavaScript source files or capture them as you analyze the web application.
    - Once you've captured a token, you can use it to gain access to previously hidden endpoints or bypass detection.
  - The registration system will generally have features like password reset, multifactor authentication features, etc.
    - These are all features that should be tested for vulnerabilities.
    - ex. A password reset feature requires your email and a six-digit code to reset your password.
      - If the API doesn't restrict the amount of requests you can make before locking you out, you could brute force the six-digit code within one million requests. If the code was only four-digits, you could brute force it within 10,000 requests.
      - This is not a large amount of requests when you use a tool or script to submit the codes.
- Watch for API keys, tokens, and credentials used in URLs, a lack of rate-limiting restrictions when authenticating, and verbose error messages.
- GitHub is a treasure trove of accidentally submitted or hard coded API keys. (Look at Bug Bounty Boot Camp for way to search github for these)
- Because RESTful APIs are stateless, finding exposed API keys is equivalent to finding a username and password.

### Excessive Data Exposure

- _Excessive data exposure_ is when an APi endpoint responds with more information than is needed to fulfill a request.
- This often happens when the API provider expects users to filter results.
  - The API provider responds to requests for X by sending all the information in the object that X is located in.
- ex. You request your user information with `GET /api/v3/account?name=Cloud+Strife` and get back the response:

  ```
  {
    "id": "5501",
    "fist_name": "Cloud",
    "last_name": "Strife",
    "privilege": "user",
        "representative": [

        "name": "Don Corneo",
        "id": "2003"
        "email": "dcorn@gmail.com",
        "privilege": "super-admin"
        "admin": true
        "two_factor_auth": false,
        }
  ```

  - A single user's account information was requested, and the provider responded with information about the person who created the account as well - including some juicy information about the account.

- These can be very juicy and require no real effort to access potentially sensitive information just by reviewing the response from the API.

### Lack of Resources and Rate Limiting

- _Lack of resources and rate limiting_ are the more important vulnerabilities to test for.
- Rate limiting plays an important role in monetization and availability.
  - Effective rate limiting ensure you won't be vulnerable to DoS attacks by ensuring your resources do not become overloaded.
  - Bypassing rate limits can also allow attackers to skip pay walls and essentially steal resources.
- If rate limiting is functioning correctly, you should receive a response indicating that you've hit your request limit.
  - This is often done with an HTTP 429 status code.
- Things to try while testing:
  - Can you bypass rate limits by adding or removing a parameter?
  - Using a different client?
  - Altering your IP address?

### Broken Function Level Authorization

- _Broken function level authorization (BFLA)_ is a vulnerability where a user of one role or group is able to access the API functionality of another role or group.
- API providers will often have different rolls for different types of accounts:
  - Public users
  - Merchants
  - Partners
  - Administrators
  - etc.
- A BFLA is present if you are able to use the functionality of another privilege level or group.
  - Could be a lateral move, where you use the functions of a similarly privileges group
  - Could be privilege escalation where you can use the functions of a more privileged group
  - Looking at functions that deal with sensitive information, resources that belong to another group, and administrative functionality are good places to look for high yield bounties.
- BFLA is similar to BOLA, except instead of an authorization problem involving accessing resources, it is an authorization problem for performing actions.
  - ex. Banking API example BOLA:
    - A BOLA is present in the API, you might be able to access the information of other accounts, such as payment histories, usernames, email addresses, and account numbers.
    - A BFLA is present in the API, you might be able to transfer money and actually update the account information.
    - BOLA is about unauthorized _access_, BFLA is about unauthorized _actions_.
- If an API has different privilege levels or roles, it may use different endpoints to perform privileged actions.
  - ex. Of differently permissioned endpoints:
    `/{user}/account/balance`
    `/admin/account/{user}`
  - If the application doesnt have access controls implemented correctly, we'll be able to perform administrative actions from a non-admin account to the admin endpoint.
- If the APIs functionality is based off of HTTP request methods, and the provider doesn't restrict the HTTP methods, a consumer may be able to make unauthorized requests with a different method.

  - This would be a BFLA.

- When hunting for BFLA, look for functionality like:
  - Altering user accounts
  - Accessing user resources
  - Accessing restricted endpoints
  - Can you add yourself to another user group?
  - If you can, can you access their data once added?
  - Find administrative API documentation and send requests as an unprivileged user to test admin functions and capabilities.
    - If you get 401 Unauthorized or 403 Forbidden responses, it indicates that access controls are in place.

### Mass Assignment

- _Mass assignment_ occurs when an API consumer includes more parameters in their requests than the application intended and the application adds these parameters to code variables or internal objects.
  - In these attacks, a consumer may be able to edit object properties or escalate privileges.
- ex. An API is called to create an account with parameters for "User" and "Password":
  ```
  {
  "User": "scuttleph1sh",
  "Password": "GreatPassword123"
  }
  ```
  - You read the API docs and find there is a key called "isAdmin", use a proxy to add in the found key with value true:
  ```
  {
  "User": "scuttleph1sh"
  "Password": "GreatPassword123"
  "isAdmin": true
  }
  ```
  - If the request is not sanitized and the key value pair is accepted, a mass assignment exists.
    - On the backend, the vulnerable web app will add the key/value attribute {"isAdmin": true} to the user object and escalate the privileges of the account to administrator.
- Find mass assignment vulnerabilities by finding parameters in API documentation and then adding those parameters to a request.
- Parameters to look for:
  - Params involved in user account properties.
  - Critical functions
  - Administrative actions.
  - Intercepting API requests and responses could also reveal parameters worthy of testing.
  - Fuzz for undocumented parameters.

### Security Misconfigurations

- \*Security misconfigurations include all the mistakes developers could make within the supporting security configurations of an API.
- Severe misconfigurations lead to sensitive information disclosures or even complete system takeover.
- Unpatched vulnerabilities are considered security misconfigurations and can often be exploited with public exploits for partial or full system take over.
- **Includes**:

  - **Unpatched vulnerabilities**
  - **Misconfigured headers**
    - Can lead to sensitive information disclosure, downgrade attacks, and cross-site scripting attacks.
    - It is common for additional services that are configured to work with the API to add headers to requests for metrics. Those headers also provide extra information to the researcher/attacker.
  - **Misconfigured transit encryption**
    - All APIs providing sensitive information to consumers should use _Transport Layer Security (TLS)_.
    - If data is not encrypted in transit API users may pass sensitive information across the network and cleartext causing vulnerability to man-in-the-middle attacks.
      - The attacker would need to have access to the network and use a network protocol analyzer like wireshark, but it's possible.
  - **The use of default accounts and creds**
    - If there are default accounts that can be accessed with default creds, and they are know, an attacker could takeover these accounts and use what ever permissions they are provisioned with.
  - **The acceptance of unnecessary HTTP methods**
    - Increased risk of the application not handling these methods properly and leading to unintended behavior.
  - **Lack of input sanitization**
    - Can allow for malicious payloads to be uploaded that are either automatically executed, or executed by a user.
    - Can also lead to unexpected behavior on the part of the application.
  - **Verbose error messaging**

- ex. Headers for extra information about the API:

  ```
  HTTP/ 200 OK
  --snip--
  X-Powered-By: VulnService 1.11
  X-XSS-Protection: 0
  X-Response-Time: 566.43
  ```

  - X-Powered-By headers reveal backend technology. Search these technologies and versions for known vulnerabilities.
  - X-XSS-Protection header indicates there is XSS protection on the API, the 0 value indicates that this protection is turned off.
  - X-Response-Time header is middleware that provides usage metrics.

    - If not configured correctly, it can become a side channel used to reveal existing resources.
    - X-Response-Time has a consistent response time for nonexistent records, but increases its response time for existing records.
    - ex.

      ```
      HTTP/UserA 404 Not Found
      --snip--
      X-Response-Time: 25.5

      HTTP/UserB 404 Not Found
      --snip--
      X-Response-Time: 25.5

      HTTP/UserC 404 Not Found
      --snip--
      X-Response-Time: 510.00
      ```

    - This can enable you to brute force user accounts based on response time.

- You can detect a number of these security misconfigurations with web app vuln scanners like Nessus, Qualys, OWASP ZAP, Nikto, etc.
  - These scanners automatically check the web server version information, headers, cookies, transit encryption configuration, and parameters for misconfigurations.
  - Manually inspect Headers, SSL certificates, cookies, and parameters.

### Injections

- _Injection flaws_ exist when a request is passed to the API's supporting infrastructure and the API provider doesn't filter the input to remove unwanted characters (_input sanitization_).
  - This results in the infrastructure treating data from the request as code to execute.
  - Leads to: SQL injection, NoSQL injection, system command injection (RCE).
  - The API delivers your unsanitized payload to the underlying operating system running the application, or the database.
- Verbose error messaging, HTTP response codes, and unexpected API behavior can help determine if you've found an injection flaw.
- ex. SQL injection

```
POST /api/v1/register HTTP 1.1
Host: example.com
--snip--
{
"Fname": "hAPI",
"Lname": "Hacker",
"Address": "' OR 1=0--",
}
```

- If this request returns a response with something like "Error: You have an error in your SQL syntax..." it would indicate that you're communicating directly with the database and the SQL injection was successful.

- ex. API GET request to a weak query parameter. Query parameter passes any data in the query portion of the request directly to the underlying system without sanitization:
  `GET http://10.10.78.181:5000/api/v1/resources/books?show=/etc/passwd`
  - If the request returns the contents of /etc/passwd

### Improper Asset Management

- _Improper asset management_ takes place when an organization exposes APIs that are either retired or still in development.
  - Old API versions are more likely to contain vulnerabilities as they are no longer being maintained.
  - APIs that are still in development may contain developer backdoors, unimplemented security features, verbose error messaging, and bypasses used for debugging and development.
- **Can lead to**:
  - Excessive data exposure
  - Information disclosure
  - Mass assignment
  - Improper rate limiting
  - API injections
- **To find them look for**:
  - Out dated API documentation
    - If the API documentation hasn't been updated along with the API endpoints, the outdated docs could point to portions of the API that are no longer supported.
    - Look for previous versions by changing endpoints /v1/, /v2/, /v3/, /v4/ paths or look for /alpha/, /beta/, /test/, /uat/, or /demo/.
  - Changelogs
    - Changelogs may reveal why previous versions are no longer supported, if you can access older version the changelogs are a great place to look for vulnerabilities.
  - Version history on repositories
- Fuzzing and brute-forcing are great ways to find outdated endpoints that are improper asset management vulnerabilities.

### Business Logic Vulnerabilities

- _Business logic vulnerabilities_ are intended featurs of an application that attackers can use maliciously.
- These vulnerabilities usually come from the assumption that API consumers will follow directions, be trustworthy, or only use the API in a certain way.
  - (IMO) These also come from organizations prioritizing business features over security or wanting the application to be fast and powerful without investing the proper amount of development or investment in security.
- Ex. Experian partner API leak, 2021:
  - An Experian partner was authorized to use the Experian API to perform credit checks.
  - The partner added the APIs credit check functionality to their website so their customers could use the API, but with partner level permissions.
  - A request could be intercepted while performing a credit check using the partners site and the name and address fields could be manipulated to return any individuals credit score and credit risk factors of any name and address put into it.
  - Experian trusted the partner not to expose the API.
- Credentials, like API keys, API tokens, and passwords are constantly being stolen and leaked by 3rd parties who use the Providers APIs.
- Search the API documentation for signs of business logic vulnerabilities by looking for statements that resemble the following:
  - "Only use feature X to perform function Y."
  - "Do not do X without endpoint Y."
  - "Only admins should perform request X."
  - Make sure to disrespect these requests to test for the presence of security controls.
- Some APIs assume you will only use a web browser to access their API, and intercepting the requests with a proxy will immediately show weaknesses or leaked information.
- ex.
  ```
  POST /api/v1/login HTTP 1.1
  Host: example.com
  --snip--
  UserID=hapihacker&password=arealpassword!&MFA=true
  ```
  - There is a chance you could bypass MFA by setting its value to false.
- Testing Business logic flaws can be challenging because each business is unique and they can be resistant to automated scanners because the flaws are part of the APIs intended use.

## Chapter 4: Your API Hacking System

### Kali Linux

The Author uses Kali Linux, and suggests looking up a guide to install it.

### Analyzing Web Apps with DevTools

- To use DevTools in Chrome, or in a chromium based browser hit `CTRL+SHIFT+I` or `F12`.
- Under the **Network panel**, you should be able to see various resources requested from APIs.
  - This is a good place to start when looking for APIs to test.
  - Use this panel to drill down into each request to see the request method that was used, the response status code, the headers, and the request body. To do this, just click the name of the URL you're interested in under the name column.
    - This opens up a panel on the right side of the DevTools.
    - From here you can review the request that was made under the Headers tab, and see the servers response under the Response Tab.
- Under the **Sources panel**, you can inspect the source files being used by the app.
  - In CTFs and sometimes in the wild, you may find API keys or other hard-coded secrets here.
  - Has a strong search functionality that will help you discover the inner workings of the application.
- Under the **Console panel**, you will be able to run JavaScript and debugging commands.
  - Use it to detect errors, view warnings, and execute commands.
- The above panels are what we will use most often.
- You can use the **Performance panel** to observe at what point a web application interacts with an API.
  - You can use this panel to watch for API interactions being triggered and then correlate that with actions you've taken on the page.
    - This can help you understand what the web application is using an API for.
- DevTools helps you gather information about a web application. And the more information you have before attacking and API, the more likely you are to find something.
- Read more at: [https://developers.google.com/web/tools/chrome-devtools](https://developers.google.com/web/tools/chrome-devtools)

| Panel       | Function                                                                                                                                       |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Elements    | Allows you to view the current page's CSS and Document Object Model (DOM), which enables you to inspect the HTML that constructs the web page. |
| Console     | Provides you with alerts and lets you interact with the JavaScript debugger to alter the current web page.                                     |
| Sources     | Contains the directories that make up the web application and the content of the source files.                                                 |
| Network     | Lists all the source file requests that make up the client's perspective of the web application.                                               |
| Performance | Provides a way to record and analyze all the events that take palce when loading a web page.                                                   |
| Memory      | Lets you record and analyze how the browser is interacting with your system's memory.                                                          |
| Application | Provices you with the application manifest, storage items (like cookies and session information), cache, and background services.              |
| Security    | Provides insight regarding the transit encryption, source content origins, and certificate details.                                            |

### Capturing and Modifying Requests with Burp Suite

- Burp Suite, everyone is using it.
- _Spidering/Web Crawling_: Burpsuite (and ZAP - some say ZAP is better for this), will do spidering which means that Burp Suite is scanning the HTML of the webpage for hyperlinks in order to map out the website.
  - This will not find hidden paths or paths that do not have links found within the web pages.
    - Kiterunner is a tool that will perform directory brute-force attacks to try and find hidden paths.
- Burp Suite professional is a huge upgrade from Burp Suite Community. The free edition will throttle your attacks making them so slow they're unrealistic to attempt. There is also a huge increase in powerful features like the Collaborator server that will allow you to conduct out-of-band attacks.
  - Author says buy Burp Suite Pro as soon as you get your first bounty, or as soon as you can convince your employer to get it. Good advice.
  - Once you're ready to start finding bounties, do the free 30 day trial of Burp Pro and use it to pay for the yearly subscription!

#### Setting Up FoxyProxy

- Foxy Proxy has been dumped on lately for not working properly and not being updated or maintained very well. When the author wrote the book, it was still the go to for proxy switching, but times they be a changing.
- I'm trying out Proxy SwitchyOmega, but there are a few other options out there if you search about.
- You can also set up and manage your proxies through the settings page of your web browser. Just search Proxy and you should be able to find them and configure them. The down side: you will need to do this every time you want to turn the proxy on and off or change your proxy settings.
- Proxy settings you want for Burp:
  127.0.0.1 for proxy address
  Port 8080 (Burps Default)

#### Adding the Burp Suite Certificate

1. Start Burp
2. Open your browser of choice (won't work with brave browser)
3. Turn on your proxy with the above settings (local host, 8080).
4. Navigate to http://burpsuite
5. Click CA Certificate in the top right of the screen to download the certificate.
6. In Chrome open settings, search for certificates, More > Manage Certificates > Authorities > import the certificate, expand to "all certificates" if you don't see the one that's saved.

- Instead of setting up your browser to user Burp Suite, which you may not be able to do easily if you're sandboxing your web browser, using an unsupported browser like brave, or just don't want to mess with switching proxies on and off, you can use the built in Burp Suite browser by going to the proxy tab once you've started burp, then on the far right you can click the Open browser button.
- This browser is well integrated into burp and also allows you to add profiles or extensions.
- It's not easy to find from their homepage, but you can read the Burp Suite documentation at [https://portswigger.net/burp/documentation/](https://portswigger.net/burp/documentation/).

#### Navigating Burp Suite

- This section goes through the different tabs inside Burp Suite.
- If you're not already familiar you should read the docs.

#### Intercepting Traffic

- How to use the intercept function.

#### Altering Requests with Intruder

- How to use the Add and clear functions and selecting different attacks.

#### Extending the Power of Burp Suite

- One of the major benefits of Burp Suite is that you can install custom extensions.
- Notable extensions:
  - AUTORIZE:
    - An extension that helps automate authorization testing, particularly for BOLA vulnerabilities. You can add the tokens of UserA and UserB accounts and then perform a bunch of actions to create and interact with resources as UserA.
    - Can automatically attempt to interact with UserA's resources with the UserB account.
    - Highlights any interesting requests that may be vulnerable to BOLA.
  - JSON Web Tokens:
    - Helps you dissect and attack JSON Web Tokens.
  - InQL Scanner:
    - Aids in attacks against GraphQL APIs.
  - IP Rotate:
    - Allows you to alter the IP address you are attacking from to indicate different cloud hosts in different regions.
    - Very useful against APIs that block attacks based on IP addresses.
  - Bypass WAF:
    - Adds some basic headers to your requests in order to bypass some web application firewalls (WAFs).
    - Some WAFs can be tricked by the inclusion of certain IP headers in the request.
    - WAF Bypass save you from manually adding headers such as X-Originating-IP, X-Forwarded-For, X-Remote-IP, and X-Remote-Addr.
    - These headers normally include an IP address and you can specify an address that you believe to be permitted, such as the target's external IP address, or an address you suspect to be trusted.

### Crafting API Requests in Postman, an API Browser

- Postman functions like a web browser for APIs.
- It was originally created as a REST API client, it now has all sorts of capabilities for interacting with REST, SOAP, and GraphQL.
  - Creates HTTP requests, receives responses, scripting capability, ability to chain requests together, creating automated testing, and managing API documentation.
- We will use Postman for sending API requests to the target server, rather than Firefox or Chrome.

#### Installation

- The author suggests the following method for installing Postman on Kali Linux:
  `sudo wget https://dl.pstmn.io/download/latest/linux64/ -O postman-linux-x64.tar.gz`
  `sudo tar -xvzf postman-linux-x64.tar.gz -C /opt`
  `sudo ln -s /opt/Postman/Postman /usr/bin/postman`
- If you're running Arch linux (I use arch, btw), you can follow the same method, or use the AUR with an AUR helper like yay.
  - Benefit of this is that you can update the application through yay by running `yay -Syu`.
  - Make sure you download the right version. There were multiple orphaned and outdated versions of Postman when I ran `yay -Ss postman`.
    - Look for aur/postman-bin <the current version of postman>
    - Yay does a good job of letting you know what's out dated or Orphaned, so pay attention when you search for the package and don't download packages without first searching them.
  - **Tip:** If you're using a combination of pacman and yay to install packages, create an "update" alias to run yay for system updates. Yay will update both your pacman packages and your aur packages.
- Once you have it installed, open the application and sign up for a free account.

#### The Request Builder

- When you click the + in the main window of Postman, it will open up a new tab.
  Request Builder:  
  [!request-builder](https://github.com/Xerips/BookNotes/tree/main/HackingAPIs/Request-builder.png)
- The request builder contains several tabs useful for precisely constructing the parameters, headers, and body of a request.
- **Params tab**:
  - Here you can add query and path parameters to a request.
  - Allows you to enter in various key/value pairs along with a description of those parameters.
  - Leverage the power of variables when creating a request.
    - If you import an APi and it contains a variable like `:company` in `http://example.com/:company/profile`, Postman will automatically detect this and allow you to update the variable to a different value, such as the actual company name.
- **Authorization tab**:
  - Includes many standard forms of authorization headers for you to include in your request.
  - If you've saved a token in an environment, you can select the type of token and use the variable's name to include it.
  - Hover your mouse over a variable name and you can see the associated credentials.
  - Several authorization option are available under the Type field that wil help you automatically format the authorization header.
  - Authorization types include several expected option such as no auth, API key, Bearer Token, and Basic Auth.
  - You can use the authorization that is set for the entire collection by selecting **inherit auth from parent**.
- **Headers tab**:

  - Includes the key and value pairs required for certain HTTP requests.
  - Postman has some built-in functionality to automatically create necessary headers and to suggest common headers with preset options.

- In Postman, values for parameters, headers, and parts of body can be added by entering information within the Key column and the corresponding Value column
  - Several headers with automatically be created, but you can add your own headers when necessary.
- Within the keys and values, you also have the ability to use collection variables and environmental variables.
- The request builder can also run pre-request scripts, which can chain together different requests that depend on each other.
  - If request 1 issues a resource value that is needed for the following request, you can script that resource value to automatically be added to request 2.
- You can use several panels to craft proper API requests and review responses.
- Once you've crafted your request, the response will show up in the response panel.
  - You can set the response panel either to the right or below the request panel, switch between single-pane and split-pane views with `CTRL+ALT+V`.

| Panel               | Purpose                                                                                                                                                                                                                                                         |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Request             |                                                                                                                                                                                                                                                                 |
| HTTP request method | The request method is found to the left of the request URL bar. It will also support COPY, LINK, UNLINK, PURGE, LOCK, UNLOCK, PROPFIND, and VIEW - Once you type these into the request method drop down, they will be available to select from the drop down.  |
| Body                | Allows for adding body data to the request, which is primarily used for adding or updating data when using PUT, POST, or PATCH.                                                                                                                                 |
| Body options        | Body options are the format of the response. These are found below the Body tab when it is selected. The options currently include none, form-data, x-www-form-urlencoded, raw, binary, and GraphQL. These options let you view response data in various forms. |
| Pre-request script  | JavaScript-based scripts that can be added and executed before a request is sent. This can be used to create variables, help troubleshoot errors, and change request parameters.                                                                                |
| Test                | This space allows for writing JavaScript-based tests used to analyze and test the API response. This is used to make sure the API responses are functioning as anticipated.                                                                                     |
| Response            |                                                                                                                                                                                                                                                                 |
| Response body       | The body of the HTTP response. If Postman were a typical web browser, this would be the main window to view the requested information                                                                                                                           |
| Cookies             | This shows all the cookies, if any, included with the HTTP response. This tab will include information about the cookie type, cookie value, path, expiration, and cookie security flags.                                                                        |
| Headers             | This is where all the HTTP response headers are located.                                                                                                                                                                                                        |
| Test results        | If you created any tests for your request, this is where you can view the results of those tests.                                                                                                                                                               |

#### Environments

- An _environment_ provides a way to store and use the same variables across APIs.
- An _environment variable_ is a value that will replace a variable across an environment.
- ex. You're attacking a production API but discover a _test_ version of the production API as well; You'll likely want to use an environment to share values between your requests to the two APIs.
  - This is valuable because there is a chance that the production and test APIs share values such as API tokens, URL paths, and resources IDs.

To create environment variables:

- Find **Environment** at the top right of the request builder (the drop-down that says "No Environment").
  - Use `CTRL+N` to bring up the _Create New_ panel and select **Environment**.
- You can give an environment variable both an initial value and a current value.
- An _initial value_ will be shared if you share your Postman environment with a team, whereas a current value is not shared and is only stored locally.
  - ex. If you have a private key, you can store the private key as the current value.
    - Then you will be able to use the variable in places where you would have to paste the private key.

#### Collections

- _Collections_ are groups of API requests that can be imported into Postman.
- If an API provider offers a collection, you won't have to physically type in every single request. Instead you can just import the providers collection.
- You can explore and download public collections to Postman from [https://www.postman.com/explore/collections](https://www.postman.com/explore/collections).
- The **Import** button lets you import collections, environments, and API specifications.
  - At the time of writing Postman supported: OpenAPI 3.0, RAML 0.8, RAML 1.0, GraphQL, cURL, WADL, Swagger 1.2, Swagger 2.0, Runscope, and DHC.
  - You can make your testing quite a bit easier if you can import your target API specification. Doing this will save you the time of having to craft all the API requests by hand.
  - Collections, environments, and specifications can all be imported as a file, folder, link, or raw text or through a linked GitHub account.

Steps to importing:

1. Click the **Import** button found at the top left of Postman.
2. Select the Link tab (or whatever way you wish to import).
3. Paste the URL to the APi specification and click **Continue**.
4. On the Confirm Your Import screen, click **Import**.
5. You should now have whatever collection you imported saved in Postman.

- Test it out by selecting one of the requests in the collection and clicking send.
- For the request to work, you might need to check the collection's variables and make sure they're set to the correct values.
  - To see and edit variables navigate to the **Edit Collection** window by selecting the "..." drop down on the top right, then selecting edit, then click the **Variables** panel.
  - If you notice a variable like `{{baseUrl}}` you will need to update the variable to the full URL of the public API.
  - This should allow you to start sending the requests.
- Whenever you import a collection and run into issues, this is how you will troubleshoot variables.
  - Also check that you haven't omitted any authorization requirements.

#### The Collection Runner

- The _Collection Runner_ allows you to run all the saved requests in a collection. You can select the collection you want to run, the environment you want to pair it with, how many times you want to run the collection, and a delay in case there are rate-limiting requirements.
- Requests can be put into a specific order.
- Once Collection Runner has run, review the _Run Summary_ to see how each request was handled.
  - ex. Open Collection Runner, select Twitter API v2, and run the Collection Runner. This gives you an overview of all API requests in that collection.

#### Code Snippets

- On the right sidebar menu, you will find the "</>" code snippet icon.
- This is used to translate the built request into many different formats: cURL, Go, HTTP, JavaScript, NodeJS, PHP, and Python.
- This feature is helpful when you craft a complicated API request in Postman and then need to pivot to another tool.
- You can craft a complicate API request in Postman, generate a cURL request, and then use that with other command line tools.

#### The Test Panel

- The _Tests panel_ allows you to create scripts that will run against responses to your requests.
- Postman has prebuilt code snippets available on the right side of the Test panel for those who lack programming skills.

- Suggested code snippets to check out:
  `Status code: Code is 200`
  `Reponse time is less than 200ms`
  `Response body: contains string`

Test for status code 200 JavaScript:

```
pm.test("Status code is 200", function () {
  pm.response.to.have.status(200);
});
```

- You can make changes to these tests, like changing the response code number, then changing the test name to reflect the changes.
- After your tests are configured, you can check the **Test Results** tab of a response to see if the tests succeeded or failed.
  - A good practice with tests is to make sure the tests can fail. They are only effective if they pass and fail when they're supposed to.
- Check out the [Postman Test scripts documentation](https://learning.postman.com/docs/writing-scripts/test-scripts).
- [Postman's learning centre](https://learning.postman.com)
- [Postman's Documentation](https://learning.postman.com/docs/getting-started/introduction).

### Configuring Postman to Work with Burp Suite

- Postman is useful for interacting with APIs, and Burp Suite is a powerhouse for web application testing. If you combine these applications, you can configure and test an API in Postman and then proxy the traffic over to Burp Suite to brute-force directories, tamper with parameters, and fuzz al the tings.

1. Open Postman settings by pressing `CTRL+,` or navigating to File > Settings.
2. Click the **Proxy** tab.
3. Click the checkbox for adding a custom proxy configuration.
4. Make sure to set the proxy server to 127.0.0.1.
5. Set the proxy server port to 8080.
6. Select the **General** tab and turn SSL certificate verification **Off**.
7. In Burp Suite, select the **Proxy** tab.
8. Click the button to turn Intercept On.

- Send a request using Postman, if it is intercepted by Burp Suite, you've properly configured everything.
- Leave the proxy on and toggle Burp Suites "turn Intercept on" function when you want to capture requests and responses.

### Supplemental Tools

- This section is aimed at providing some tools that will compensate for using Burp Suite Community Edition instead of the Pro version.

#### Performing Reconnaissance with OWASP Amass

- _OWASP Amass_ is an open-source information-gathering tool that can be used for passive and active reconnaissance.
- With only a target's domain name, Amass can scan through many internet sources for your target's associated domains and subdomains to get a list of potential target URLs and APIs.

**Installation**:

- On Kali Linux: `sudo apt-get install amass`
- On Arch Linux: `yay -Syu amass-bin` (the aur/amass package has an issue with installation at time of writing. Use aur/amass-bin instead.)

**Configuring API keys**:

- Comes pretty powerful out of the box, still, you can increase it's effectiveness by adding API keys with accounts from GitHub, Twitter (X), and Censys.
- The books methods for adding API keys is no longer current. API keys aren't set up in config.ini anymore, they're stored in datasources.yaml and the new config file is config.yaml.
- Take a look at the [documentation](https://github.com/owasp-amass/amass/blob/master/doc/user_guide.md).
- Although time consuming, it would greatly increase the functionality of Amass to set up all the API keys that are free.

To get you started:

1. Create an amass directory for the configs: `mkdir ~/.config/amass`
2. Copy the sample configs to `~/.config.amass` with: `cp /usr/share/amass/examples/* ~/.config/amass/`

- After installing amass the sample configs should be in `/usr/share/amass/examples/` if not, you can download them at `https://github.com/owasp-amass/amass/tree/master/examples`.
- Amass default config is configured to use wordlists from the examples repo, you should change this to use seclists, which if you download using a package manager, will update the lists as they get worked on.
- When configuring API keys, it's best practice to create a dedicated account for amass to use.
  - ex. Instead of using the GitHub account that you publish content to generate an API key, create a new account specifically for Amass.

#### Discovering API Endpoints with Kiterunner

- _Kiterunner_ is a content discovery tool designed specifically for finding API resources.
- Can scan at 30,000 requests per second, and also takes into account that load balancers and WAFs will likely enforce rate limiting.
- Kiterunner outperforms dirbuster, dirb, Gobuster, and dirsearch for content discovery with APIs because it was built with API awareness.
- It's wordlists, request methods, parameters, headers, and path structures are all focused on finding API endpoints and resources.
  - the tool includes data from 67,500 Swagger files.
- Built to detect the signature of different APIs: Django, Express, FastAPI, Flask, Nginx, Spring, Tomcat, and more.
- You can supply kiterunner with various wordlists, which it then uses as payloads for a series of requests.
  - These requests will help you discover interesting API endpoints.
- Allows you to use Swagger JSON files, Assetnote's .kite files, and .txt wordlists.
  - All Assetnote's wordlists are hosted at [https://wordlists.assetnote.io](https://wordlists.assetnote.io). Care, it's over 2 gigs.
  - You can download all of the wordlists at once with: `wget -r --no-parent -R "index.html*" https://wordlists-cdn.assetnote.io/data/ -nH -e robots=off`.

**Installation**:

- On Kali Linux with git clone (also works on arch):
  `git clone https://github.com/assetnote/kiterunner.git`
  `cd kiterunner`
  `make build`
  `sudo ln -s $(pwd)/dist/kr /usr/local/bin/kr`
- On Arch using yay (or other AUR helper):
  `yay -Syu aur/kiterunner-bin`
  - Make sure to check the version to ensure it matches the same one as the github page!
- Check if it installed correctly by running kiterunner from the command line: `kr`

#### Scanning for Vulnerabilities with Nikto

- _Nikto_ is a command line web application vulnerability scanner that is quite effective at information gathering.
- Nikto will provide you with information about the target web server, security misconfigurations, and other web application vulnerabilities.
- Will show allowed HTTP methods, header information, potential API endpoints, and other directories that could be worth checking out.
- Scan a domain: `nikto -h https://example.com`
- I've used Nikto in the past, and I think while working through 100ish vulhub boxes, it found something useful once. It should be interesting to see if it has better results with API testing.

#### Scanning for Vulnerabilities with OWASP ZAP

- ZAP has two components:
  - Automated Scan:
    - Performs web crawling, detects vulnerabilities, tests web app responses by altering request parameters.
    - Great for detecting surface directories of a web application including API endpoints.
    - To run it, enter the target URL into the ZAP interface and click the button to start the attack.
    - Once the scan is complete, you receive a list of alerts categorized by severity.
    - Can be riddled with false positives.
    - Limited to surface of the web app unless unintentionally exposed directories exist.
    - Cannot infiltrate beyond authentication requirements.
  - Manual Explore:
    - Useful for exploring beyond the surface of the web app.
    - AKA ZAP HUD (Heads up display) can be enabled.
    - When launching ZAP HUD it will look like normal browsing, but ZAP alerts and functions will overlay the page.
    - This allows you to have more control over when to start crawling, when to run active scans, and when to turn on "attack mode."
    - ex.
      - run through the user account creation process and authentication/authorization process with the ZAP scanner running to automatically detect flaws in these processes.
      - Vulnerabilities will pop up like gaming achievements.
      - We use ZAP HUD to discover APIs.

#### Fuzzing with Wfuzz

- Wfuzz will perform 900 requests per minute.
- Basic request formate for Wfuzz:
  - `fwuzz option -z payload,params url`
  - `fwuzz -z file,/usr/share/wordlists/list.txt http://targetname.com/FUZZ`
    - -z option specifies a type of payload followed by the actual payload.
    - In the above, we specified a file payload located at the following path.
  - `wfuzz -X POST -z list,admin-dashboard-docs-api-test http://targetname.com/FUZZ`
    - -X option specifies the HTTP request method.
    - Using the `list` option means that we will specify the payload in the request.
    - The above tests an endpoint for a list of HTTP verbs.
  - `wfuzz -z range,500-1000 http://tagetname.com/account?user_id=FUZZ`
    - Easily test for a series of numbers, like user_ids.
  - `wfuzz -z list,A-B-C -z range,1-3 http://targetname.com/FUZZ/user_id=FUZZ2`
    - The above shows how to fuzz for 2 separate parameters.
- Wfuzz show filter options:
  - --sc Only shows responses with specific HTTP response codes.
  - --sl Only shows responses with a certain number of lines.
  - --sw Only shows responses with a certain number of words.
  - --sh Only shows responses with a certain number of characters.
  - ex. `wfuzz -z file,/usr/share/wordlists/list.txt -sc 200 http://targetname.com/FUZZ`
    - The above will only show results that include a status code 200.
- Wfuzz hide filter options:
  - --hc Hides responses with specific HTTP status codes.
  - --hl Hides reponses with a specific number of lines.
  - --hw Hides responses with a specified number of words.
  - --hh Hides responses with a specified number of characters.
- ex. `wfuzz -z file,/usr/share/wordlists/list.txt -sc 404 -sh 950 http://targetname.com/FUZZ`
  - This scan will hide all results that have a status code of 404 and hide results that have 950 characters.
- [Documentation](https://wfuzz.readthedocs.io/en/latest/)

#### Discovering HTTP Parameters with Arjun

- An open source Python-based API fuzzer developed specifically to discover web application parameters.
- Used to discover basic API functionality, find hidden parameters, and test API endpoints.
- A good first scan for an API endpoint during black box testing or as an easy way to see how well API documentation parameters match up with the scan's findings.
- Comes preconfigured with a 26,000 parameter wordlist and does some of the filtering for you using it's anomaly detection.
- Arjun has built in suggestions for when a target does not cooperate.

Installation:

- `mkdir /opt/arjun/`
- `cd /opt/arjun/`
- `sudo python3 -m venv .`
- `source /opt/arjun/bin/activate`
- `sudo chown -R $(whoami):$(whoami) /opt/arjun`
- `pip3 install arjun`

Usage:

- `python3 /opt/arjun/bin/arjun -u https://target_address.com`
- `python3 /opt/arjun/bin/arjun -u https://example.com -o arjun-results.json`: specify the file extension for different formats.
- `python3 /opt/arjun/bin/arjun -i burp_targets.txt`: pass a list of targets.

### Lab #1: Enumerating the User Accounts in a REST API

**Lab Goal**: Find the total number of user accounts in `reqres.in` which is a REST API designed for testing.

- Navigate to `https://reqres.in`
- The landing page shows the API documentation and the first endpoint is `LIST USERS`. We will ignore this for the purposes of the lab.
- We use the ` SINGLE USER` endpoint because it will help build the skills needed to discover vulnerabilities like BOLA and BFLA.

- When we click on the `SINGLE USER` endpoint, we can see that a GET request is being sent to `/api/users/2` and it appears then that user accounts are organized in the `user` directory by their `id` numbers.

Testing the Theory:

- Set up the API request using Postman:
  - Set the request method in Postman to `GET`, and add the URL `https://reqres.in/api/users/1`, then click Send.
    - If you've set up Postman to work with Burp Suite with "Use custom proxy configuration" in settings, turn this off to sent requests directly.
  - Should return a response with the user G.B.
- Send the request over to Burp Suite by enabling the "Use custom proxy configuration" in Postman and then opening Burp Suite, Proxy tab, and turn intercept on.

  - Resend the request using Postman, and it should be intercepted in Burp Suite.

- Once the request has been intercepted by Burp Suite, send the request to the intruder tab with `CTRL+I` or right clicking the request in Burp Suite and selecting "send to intruder."
- Clear the payload positions, if anything is highlighted with the § character.
- Add the 1 from /api/users/1 to the payload positions by highlighting it and clicking add.
- You can change it from §1§ to §WhateverYouWant§, the contents of § § is a placeholder for the payload.
- Once the position we're going to attack is highlighted, go to the payloads tab, change "Simple list" to "Numbers"
- Update the "Number range" to "From: 0" "To: 25" "Step: 1".
- Click "Start attack" highlighted in orange to start the attack on the endpoint.
  - The attack results in a bunch of 404 and 200 responses.
  - The 404 responses are failures to identify a user at the specific endpoints.
  - The 200 responses return valid users if you click on them to see the response.
  - You can cycle through the responses by clicking on them or using the arrow keys to navigate. Make sure you're on the Response tab and not the Request tab to see the contents of the response.
  - Using this technique we find there are 12 users.

## Chapter 5: Setting Up Vulnerable API Targets

_Note_: This lab contains deliberately vulnerable systems. These could attract attackers and introduce new risks to your home or work networks. Do not connect these machines to the rest of your network; make sure the hacking lab is isolated and protected. In general, be aware of where you host a network of vulnerable machines.

#### Creating a Linux Host

- Use either a hyper-visor or a cloud solution for hosting.
- Guides on building a home hacking lab:
  - Cybrary, ["Tutorial: Setting Up a Virtual Pentesting Lab at Home"](https://www.cybrary.it/blog/0p3n/tutorial-for-setting-up-a-virtual-penetration-testing-lab-at-your-home)
  - Black Hills Information Security, ["Webcast: How to Build a Home Lab"](https://www.blackhillsinfosec.com/webcast-how-to-build-a-home-lab)
  - Null Byte, ["How to Create a Virtual Hacking Lab"](https://null-byte.wonderhowto.com/how-to-back-like-pro-create-virtual-hacking-lab-0157333)
  - Hacking Articles, ["Web Application Pentest Lab Setup on AWS"](https://www.hackingarticles.in/web-application-pentest-lab-setup.on-aws)
- Use these to set up your Linux Machine.

### Installing Docker and Docker Compose

- Follow the instructions at https://docs.docker.com/engine/install/ubuntu (if you're using an ubuntu host).
- The official documentation for installing Docker Compose: https://docs.docker.com/compose/install.

### Installing Vulnerable Applications

- OWASP crAPI
- OWASP Juice Shop
- OWASP DevSlop's Pixi
- Damn Vulnerable GraphQL

- These apps will help you develop essential API hacking skills such as discovering APIs, fuzzing, configuring parameters, testing authentication, discovering OWASP API Security Top 10 vulnerabilities, and attacking discovered vulnerabilities.

#### The completely rediculous API (crAPI)

- crAPI was meant to demonstrate the most critical API vulnerabilities.
- Contains a modern web application, an API, and Mail Hog email server.
- This one has a lot to learn.

#### OWASP DevSlop's Pixi

- MongoDB, Express.js, Angular, Node (MEAN) stack web application.
- Designed with deliberately vulnerable APIs.
- Is a social media platform with a virtual payment system.
  - Hack the user information, administrative functionality, and payment system.
- Easy to get up and running:
  - `git clone https://github.com/DevSlop/Pixi.git`
    `cd Pixi`
    `sudo docker-compose up`
  - Browse to http://localhost:8000 to view the landing page.

#### OWASP Juice Shop

- Designed to include vulnerabilities from both the OWASP top 10 and OWASP API Security Top 10.
- Tracks your hacking progress and includes a hidden scoreboard.
- Built using: Node.js, Express, and Angular.
  - JavaScript application powered by REST APIs.
- Very supported.
- Install:
  `docker pull bkimminich/juice-shop`
  `docker run --rm -p 80:3000 bkimminich/juice-shop`

#### Damn Vulnerable GraphQL Application

- DVGA
- Install:
  `sudo docker pull dolevf/dvga`
  `sudo docker run -r -p 5000:5000 -e WEB_HOST=0.0.0.0 dolevf/dvga`

### Adding Other Vulnerable Apps

| Name                        | Contributor    | GitHub URL                                             |
| --------------------------- | -------------- | ------------------------------------------------------ |
| VAmPI                       | Erev0s         | https://github.com/erev0s/VAmPI                        |
| DVWS-node                   | Snoopysecurity | https://github.com/snoopysecurity/dvws-node            |
| DamnVulnerableMicroServices | ne0z           | https://github.com/ne0z/DamnVulnerableMicroServices    |
| Node-API-goat               | Layro01        | https://github.com/layro01/node-api-goat               |
| Vulnerable GraphQL API      | AidanNoll      | https://github.com/CarveSystems/vulnerable-graphql-api |
| Generic-University          | InsiderPhD     | https://github.com/InsiderPhD/Generic-University       |
| vulnapi                     | tkisason       | https://github.com/tkisason/vulnapi                    |

## Chapter 6: Discovery

- The first step in the discovery process is to locate APIs and validate whether they are operational.
  - In the process you'll want to try to find credential information (keys, secrets, usernames, and passwords), version information, API documentation, and information about the API's business purpose.
- APIs are meant to be used either internally, by partners and customers, or publicly.
  - If an API is intended for public or partner use, it's likely to have developer-friendly documentation that describes the API endpoints and instructions for using it.
  - If an API is used for select customers or internal use, you'll have to rely on other clues like naming conventions, HTTP response header information such as `Content-Type: application/json`, HTTP responses containing JSON/XML, and information about JavaScript source files that power the application.

### Passive Recon

- The main goal to passive recon is to find and document the target's attack surface without making the target aware of your investigation.
  - The attack surface is the total set of systems exposed over a network from which it may be possible to extract data, through which you could gain entry to other systems, or to which you could cause an interruption in the availability of systems.
- Passive recon generally leverages OSINT.

#### Phase one: Cast a Wide Net

- Leverage search engines like google, Shodan, and ProgrammableWeb to find general information about the API such as usage, design, architecture, documentation, and business purpose, as well as information about the about the industry the target operates within.
- Use tools like DNS Dumpster and OWASP Amass.
  - DNS Dumpster performs DNS mapping by showing all the hosts related to the target's domain name and how they connect to each other.

#### Phase two: Adapt and Focus

- Use your findings from phase one and drill deeper into what you've found.
  - Increase the specificity of your searches.
  - Combine information found from different tools to gain insights.
  - Search github with tools like PastHunter to find exposed sensitive info.

#### Phase three: Document the Attack Surface

- Document and take screen captures of all interesting findings.
- Create a task list of the passive reconnaissance findings that could prove useful throughout the rest of the attack.

#### Google Hacking

- Check out the section on google hacking in my "BugBountyBootCamp" book review, or visit [Offensive Security's Google Hacking Database](https://www.exploit-db.com/google-hacking-database).

#### ProgrammableWeb's API Search Directory

- [ProgrammableWeb](https://www.programmableweb.com) is the go to for API-related information - See API University.
- Use the API directory to search the database of over 23,000 APIs.
  - Expect to find API endpoints, version information, business logic information, the status of the API, source code, SDKs (Software Development Kits), articles, API documentation, and changelogs.
- if you find that your target is using an API like Medici Bank API, you can search ProgrammableWeb API directory to search the database for that particular API.

#### Shodan

- Use Shodan to discover external-facing APIs and get information about your target's open ports, making it useful if you have only an IP address or an organization's name to work with.
- You can search Shodan with general search queries, or you can use search parameters as you would when writing Google Dorks.

| Shodan queries                   | Purpose                                                                                                                                                                       |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| hostname:"tagetname.com"         | Using `hostname` will perform a basic Shodan search for your target's domain name. This should be combined with the following queries to get results specific to your target. |
| "content-type: application/json" | APIs should have their `content-type` set to JSON or XML. This query will filter results that respond with JSON                                                               |
| "content-type: application/xml"  | This query will filter results that respond with XML.                                                                                                                         |
| "200 OK"                         | Add this to show only successful requests. Care, if an API does not accept the format of Shodan's request, it will likely issue a 300 or 400 response.                        |
| "wp-json"                        | This will search for web applications using the WordPress API.                                                                                                                |

- ex. `"ewise.com" "content-type: application/json"`

#### OWASP Amass

- If set to active mode, Amass will collect information directly from the target by requesting its certificate information.
- If passive, it collects data from search engines (such as Google, Bing, and HackerOne), SSl certificate sources (GoogleCt, Censys, and FacebookCT), search APIs (such as Shodan, AlienVault, Cloudflare, and GitHub), and the web archive Wayback.
- ex. `amass enum -passive -d twitter.com | grep api`
- ex. `amass intel -addr <Target IP>`
  - Collects SSl certificates, reverse whois, and finds ASN IDs associated with the target.
- ex. `amass intel -d <target domain> -whois`
  - Domains from the previous example can be used to perform a reverse Whois on those domains.
- ex. `amass enum -passive -d <target domain>`
  - Once you've collected a list of interesting domains, start using enum to begin enumerating subdomains. Passive refrains from direct interaction.
- ex. `amass enum -active -d <target domain>`
  - Active enum will perform the same as passive with the addition of domain name resolution, attempt DNS transfers, and grab SSL certificate info.
- ex. `amass enum -active -brute -w /usr/share/wordlist/API_superlist -d <target domain> -dir <directory name>`
  - Use a wordlist to brute force sub domains to a directory of your choice.
- ex. `amass viz -enum -d3 -dir <directory name>`
  - Visualize relationships between the data amass returns with viz. This creates an HTML export of the data found.
  - This will show the types of DNS records, dependencies between different hosts, and the relationships between different nodes.

### Active Recon

#### Phase Zero: Opportunistic Exploitation

- If you discover a vulnerability at any point in the active recon process, you should take the opportunity to attempt exploitation.
  - Through experience, you will learn when to dive into an exploit and when to avoid potential rabbit holes.

#### Phase One: Detection Scanning

- The goal of detection scanning is to reveal potential starting points for your investigation.
- As soon as a scan detects an API service, move into phase two while the scans continue to run.

#### Phase Two: Hands-on Analysis

- Hands-on analysis is the act of exploring the web application using a browser and API client.
- Learn about all the potential levers you can interact with and test them out.
- Examine the website, intercept requests, look for API links and documentation, and develop an understanding of the business login.

- Consider the application from three perspectives:
  - Guests:
    - How would a new user use this site?
    - Can new users interact with the API?
    - Is API documentation public?
    - What actions can this group perform?
  - Authenticated Users:
    - What can you do when authenticate that you couldn't do as a guest?
    - Can you upload files?
    - Can you explore new sections of the web application?
    - Can you use the API?
      How does the web application recognize that a user is authenticated?
  - Site Administrators:
    - Where would site administrators log in to manage the web app?
    - What is in the page source?
    - What comments have been left around various pages?
    - What programming languages are in use?
    - What sections of the website are under development or experimental?
- If the site hosts public information and does not need to authenticate users, it may only have guest users.

- Next, analyze the app as a hacker by intercepting the HTTP traffic with Burp Suite.
- When you use the web app's search bar or attempt to authenticate, the app might be using API requests to perform the requested action.
  - Look for these requests in Burp Suite.
- When you run into road blocks, it's time to review new results from the phase one scans and move onto phase three.

#### Phase Three: Targeted Scanning

- Refine your scans and use tools that are specific to the target.
- Detection Scanning (Phase One) casts a wide net.
- Targeted scanning should focus on the specific type of API, it's version, the web application type, and service versions discovered.
  - Whether the app is on HTTP or HTTPS, any active TCP ports, and other information gleaned from understanding the business logic.
  - ex. If you discover that an API is running over a nonstandard TCP port, you can set your scanners to take a closer look at that port.
  - ex. If you find that the web app was made with WordPress, check whether the WordPress API is accessible by visiting /wp-json/wp/v2.
- At this point, you should know the URLs of the web application and can begin brute-forcing uniform resource identifiers (URI) to find hidden directories and files.
- Once these tools are up and running, review results as they flow in to perform a more targeted hands-on analysis.

### Tools and Techniques

#### Baseline Scanning with Nmap

- Good for phase 1 and for phase 3.
- For API discovery you should run two Nmap scans in particular:
  - General detection:
    - Uses default scripts and service enumeration against a target and saves the output in all 3 formats (XML, Nmap, Greppable) with the -oA flag.
    - `nmap -sC -sV <target address of network range> -oA nameofoutput`
  - All Port:
    - `nmap -p- <target address> -oA allportscan`
- Once you discover a web server, open a browser and begin analysis.

#### Hidden Paths in Robots.txt

- If you find this file, it contains everything the developers don't want web crawlers (like google) to find and list on their search engines.
- If they don't want Google looking there, you should definitely be looking there.

#### Finding Sensitive Information with Chrome DevTools

- Contains highly underrated web application hacking tools.
- Follow these steps to find sensitive information in page sources by systematically filtering through thousands of lines of code.
- Open dev tools with F12 or CTRL+SHIFT+I.
- Select the Network tab and refresh the page.
- Look for interesting files (anything labelled API is a good start), right click JavaScript files that look interesting and select Open in Sources Panel to view their source code.
  - You can click XHR to see the Ajax requests being made.
  - Search for key terms like "API," "APIkey," "secret," "password," etc.

**Memory Tab**

- Make use of the DevTools Memory tab which allows you to take a snapshot of the memory heap distribution.
- Static JavaScript files include all sorts of information and thousands of lines of code, so it may not be entirely clear exactly how the web app leverages an API.
- Use the Memory panel to record how the web application is using resources to interact with an API.
- Click the Memory tab, under Select profiling Type, choose Heap Snapshot. Then under Select JavaScript VM Instance, choose the target to review. Then click the take Snapshot button.
  - Once the file has been compiled under the Heap Snapshots section on the left, select the new snapshot and use CTRL+F to search for potential API paths.
  - Try searching for terms using the common API path terms like "api," "v1," "v2," "v3," "swagger," "rest," and "dev."
  - Check out [Assetnote API wordlists](https://wordlists.assetnote.io) for more inspiration.
- The Memory module can help you discover the existence of APIs and their paths. Additionally, you can use it to compare different memory snapshots.
  - This can help you see the API paths used in authenticated and unauthenticated states, in different parts of a web application, and in its different features.

**Performance tab**

- Use the Performance tab to record certain actions (such as clicking a button) and review them over a timeline broken down into milliseconds.
  - This lets you see if any event you initiate on a given web page is making API requests in the background.
  - Just click the circular record button, perform actions on the webpage, and stop the recording.
- You can review the triggered events and investigate the initiated actions.
- Under "Main," you can see that a click event occurred, initiating a POST request to the URL `/identity/api/auth/login` (example from the book), a clear indication that you've discovered an API.
- To help you spot activity on the timeline, consult the peaks and valleys on the graph located near the top.
  - A peak represents an event, such as a click.
  - Navigate to a peak and investigate the events by clicking the timeline.

#### Validating APIs with Burp Suite

- To validate APIs using Burp, intercept an HTTP request sent from your browser and then use the Forward button to send it to the server.
- Next, send the request to Repeater.
- If the response contains a 401 Unauthorized status code, try sending a gibberish request so you can determine what a response from a non-existent resource returns, should return a 404.
  - ex. A gibberish request `GET /user/test098765`
- You may be able to find a verbose error message with this technique which will be found under the `WWW-Authenticate` header, or something similar, and could reveal the path of an existing API endpoint.

#### Crawling URIs with OWASP ZAP

- One of the objectives of active reconnaissance is to discover all of a web site's directories and files, AKA _uniform resource identifiers_ or URIs.
- There are two ways to do this, Crawling and brute-forcing. ZAP uses Crawling.
- From the Quick Start tab, enter the target URL and click **Attack**.
- You can watch the live results using the Spider or Sites tab.
- You may discover API endpoints in these tabs.
- If you don't find any obvious APIs, use the Search Tab, and look for terms like "API," "GraphQL," "JSON," "RPC," and "XML."
- Once you've found a section of the site you want to investigate, begin manual exploration using the ZAP HUD to interact with the web application's buttons and user input fields.
  - While you do this, ZAP performs additional vuln scans.
- Navigate to the Quick Start tab and select Manual Explore (you may need to click the back arrow to exit the automated scan).
- Launch your browser of choice from the selection screen and the ZAP HUD should be enabled.
  - Click Continue to Your Target in the ZAP HUD welcome screen.
- While doing this ZAP will look for additional vulnerabilities, as well as search for additional paths while you navigate.
- The colored flags represent page alerts, which include vulnerabilities and interesting anomalies.

#### Brute-Forcing URIs with Gobuster

- Gobuster can be used to brute-force URIs and DNS subdomains from the command line.
- Provides URL paths and HTTP status response codes.
- Gobuster is much faster than Burp Suite community at doing this.
- Consider using /api/wordlists from Chapter 4 to specifically target APIs instead of using a longer wordlist designed for general purpose.
- ex. `gobuster dir -u http://<target>:<port> -w /path/to/api/wordlists/common_apis_160`
- Once you've found API directories, you can use Burp Suite to investigate them further.
- To ignore certain response status codes, use the option `-b` if you want to see additional status codes, use `-x`.
- ex. `gobuster dir -u http://<target> -w /path/to/wordlists/api_list/common_apis_160 -x 200,202,301 -b 302`

#### Discovering API Content with Kiterunner

- The best tool for discovering API endpoints and resources.
- Unlike Gobuster, Kiterunner not only relies on standard HTTP GET requests, but also utilizes all HTTP request methods common with APIs and also mimics common API path structures.
- ex. `kr scan http://<target>:<port> -w /path/to/kiterunner/routes-large.kite`
- You can use Kiterunner's brute option instead of scan if you want to brute force with a wordlists instead of a .kite file.
  - ex. `kr brute <target> -w /path/to/wordlist.txt`
- If you have multiple targets, you can save a list of line-separated targets as a text file and use that file as the target.
- One of the coolest Kiterunner features is the ability to replay requests.
  - This allows you to be able to dissect exactly why a request is interesting.
  - In order to replay a request, copy the entire line of content into Kiterunner, paste it using the kb replay option, and include the wordlist you used.
  - ex. `kr kb replay "GET    414 [   183,    7,    8] http://<target>:<port>/api/end/point ocf6841be7ac8badc6e237ab300a90ca873d571" -w /path/to/kiterunner/routes-large.kite`
- You can review interesting results and then pivot to testing them using Postman and Burp Suite.

**Book Lab** Performing Active Recon for a Black Box Test.

## Chapter 7: Endpoint Analysis

- Critical vulnerabilities or data leaks sometimes present during this stage of testing. These are early wins!
- APIs are special targets because you may not need advanced skills to bypass firewalls and endpoint security; instead, you may just need to know how to use an endpoint as it was designed.

### Finding Request Information

- If you're used to attacking web applications, your hunt for API vulnerabilities should be somewhat familiar.
  - The primary difference is that you no longer have obvious GUI cues such as search bars, login fields, and buttons for uploading files.
- API hacking relies on the backend operations of those items that are found in the GUI.
  - GET requests with query parameters and most POST/PUT/UPDATE/DELETE requests.
- Before you craft requests to an API, you'll need an understanding of its endpoints, request parameters, necessary headers, authentication requirements, and administrative functionality.
- Documentation will often point you to those elements.
  - To succeed in API hacking, you'll need to know how to read and use API documentation, as well as how to find it.
- If you find a specification for an API, you can import it directly into Postman to automatically craft requests.
- If you're doing a black box API test, and the documentation is not available, you'll have to reverse engineer the API requests on your own.
  - To do this, thoroughly fuzz your way through the API to discover endpoints, parameters, and header requirements in order to map out the API and its functionality.

#### Finding Information in Documentation

- ex. Common locations for documentation:
  `https://example.com/docs`
  `https://example.com/api/docs`
  `https://docs.example.com`
  `https://dev.example.com/docs`
  `https://developer.example.com/docs`
  `https://api.example.com/docs`
  `https://example.com/developers/documentation`

- If the documentation is not available publicly, create and account and search for the documentation while authenticated.
- Authors wordlist for brute-force API documentation: https://github.com/hAPI-hacker/Hacking-APIs.
  - You can use the subdomains_list and dir_list to brute-force web applications subdomains and domains and potentially find API docs hosted on the site.
- There's a good chance you'll find documentation during recon and application scanning.
- If you can't find any, try Google Dorking it, or use the Wayback Machine to see if it was ever posted.
  - Archived docs from Wayback will often be outdated, but it could give you an idea of the authentication requirements, naming schemes, and endpoint locations. Try looking up any changelogs or previous versions, patches, etc. to glean more out of the outdated resources.
- If permitted, try social engineering tactics to get the organization to share its documentation.
  - _Idea: Sales teams will often go to great lengths to get your business. If the business models allows it, see if you can get their sales team to send you their API documentation for you to give to your engineers for a review of fit._

_Note: API documentation is only a starting point. Never trust that the docks are accurate and up-to-date or that they include everything there is to know about the endpoints. Always test for methods, endpoints, and parameters that are not included in documentation. Distrust and verify._

- Elements to look out for in API documentation:
  - _Overview_ is typically the first section of the documentation.
    - Provides a high-level introduction of how to connect and use the API.
    - Could contain info about authentication and rate limiting.
  - Look for _functionality_ or the actions that you can take using the given API.
    - These are represented by a combination of a request method (GET, PUT, POST, DELETE) and an endpoint.
    - Look for functionality related to user account management, options to upload and download data, different way to request information, etc.
  - Make note of request _requirements_.
    - Could include some form of authentication, parameters, path variables, headers, and information included in the body of the request.
    - The documentation should tell you what it requires and mention in which part of the request that information belongs.
    - Use examples to help craft requests.

| Convention | Example                                                                                                     | Meaning                                                                                                                                                                                                                  |
| ---------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| : or {}    | /user/:id<br>/user/{id}<br>/user/2727<br>/account/:username<br>/account/{username}<br>/account/scuttleph1sh | The colon or curly brackets are used by some APIs to indicate a path variable. In other words, ":id" represents the variable for an ID number and "{username}" represents the account username you are trying to acccess |
| \[ ]       | /api/v1/user?find=\[name]                                                                                   | Square brackets indicate that the input is optional                                                                                                                                                                      |
| \|\|       | "blue" \|\| "green" \|\| "red"                                                                              | Double pipe represent different possible values that can be used.                                                                                                                                                        |
| \< >       | \<find-function>                                                                                            | Angle brackets represent a DomString, which is a 16-bit string.                                                                                                                                                          |

- ex.

**Pixi API documentation**

```
GET     /api/picture/{picture_id}/likes       get a list of likes by user

Parameters

Name                            Description

x-access-token *
string                          Users JWT Token
(header)

picture_id *                    in URL string

number
(path)
```

- The request method is GET
- The endpoint is /api/picture/{picture_id}/likes
- The only requirements are the `x-access-token` header and the `picture_id` variable to be updated in the path.
  - To test the endpoint, you'll need to figure out how to obtain a JSON Web Token (JWT) and what form the `picture_id` should be in.
- You can take these instructions and insert the information into an API browser such as Postman.
- All of the headers besides `x-access-token` will be automatically generated by Postman.
- Register to the Pixi API to get an access token.
- If you click the Headers (6) tab in Postman, you'll see that everything is already populated for the requests besides the `x-access-token`, which you can add manually by typing it in on the bottom row.
  - To add the token, you can give it a variable name surrounded in {{Token Variable}}.
  - When you do this it will be highlighted red, right click and you can "Add new variable."
  - If you have multiple collections on the go, you'll want to create an environment and set environment variables.
    [!postman-pixi-variables](http://github.com/Xerips/BookNotes/tree/main/HackingAPIs/postman-pixi-variables.png)
- If your request is improperly formed, the response will let you know what went wrong so you can adjust your request accordingly.
  - ex. If you attempt to copy and paste the endpoint without replacing {picture_id} the provider should respond with a status code 200 and a body with square brackets \[ ]. If you are having trouble understanding the response, revisit the API documentation.

#### Importing API Specifications

- If your target has an API specification (Open API (Swagger), RAML, API Blueprint, or in a Postman collection), finding this is even more useful than finding API documentation.
- You can import specifications into Postman and review the requests that make up the collection, as well as the endpoints, headers, parameters, and some required variables.
- Specifications will often be as easy or hard to find as their API Documentation counterparts.
- Specifications are often in JSON format, but could also be in YAML, RAML, or XML format.
  - You can often find what type of specification by scanning the beginning of the plaintext doc for a descriptor like "swagger": "2.0".

**To Import:**

- Under the My Workspaces side panel, click the Collections icon and then click Import next to My Workspaces.
- Use a link, or whatever method you require to import the collection.

- Once imported, make sure to check the collection variables. You can do this by selecting the main folder of the specification, in this case "Pixi App API" and looking for the "Variables" tab on the viewing pane.
  - You can change variables here and add new ones, then save using the Save button on the top right.

#### Reverse Engineering APIs

- Mapping an API with serveral endpoints and a few methods can quick;y grow into quite a beast to attack.
  - Manage this process by building requests under a collection in order to thoroughly hack the API.
- There are two ways to reverse engineer an API with Postman:
  - Manually construct each request.
    - This can be cumbersome, but it allows you to capture the precise requests you care about.
  - Proxy traffic through Postman and then use it to capture a stream of requests.
    - This makes it easier to construct requests within Postman, but you'll have to sort through (remove or ignore), unrelated requests.
- If you obtain a valid authentication header, such as a token, API key, or other authentication value, add that to Kiterunner to help map out API endpoints.

#### Manually Building a Postman Collection

- Start off by creating a new Collection by clicking the New button next to My Workspaces.
  - Select Collection from the pop up window.
- Set a {{baseUrl}} variable under the variable tab with the targets URL.
- APIs can be quite large, and making small changes to many requests can be time-consuming.
  - Using variables can help to more efficiently make changes.
- Every time you discover an API request, you can add it to the collection.
- To add a request, select the . . . next to the Collection name and select "Add request".
- Create folders to organize the requests.
- Once built, you can use the collection as if it were documentation.

#### Building a Postman Collection by Proxy

- The second way to reverse engineer an API is to proxy web browser traffic through Postman and clean up requests so that only the API-related ones remain.
- Create and name a new collection for the API you'll be working on.
- There is a Postman browser extension that can be used with Chrome, Safari, Firefox, and Edge. This makes it easier to manage proxying traffic.

  - Documentation: https://learning.postman.com/docs/sending-requests/capturing-request-data/interceptor/
  - The book mentions an satellite icon you can use to capture requests, but since version 9.24.2 this icon does not exist.
  - You will find the "Capture requests" button on the bottom right, in fine print.
  - Here you can save responses to your collection, toggle capture cookies, save responses for requests, etc.
  - Under "Via Interceptor" on the top left of the info pane, you can set up your interceptor browser extension.

- Once you're set up and capturing requests, start using every feature of the web application.
  - Registering a new account, authentication, performing a password reset, clicking every link, updating your profile, use any forums, navigating to the shop, etc.
- Once you're done using the web app, stop the proxy and review the collection made within Postman.
- The downside here is there will be a lot of requests that aren't API related and you'll need to delete these requests and organize the collection.
  - You may want to organize and delete as you go, personal preference.

### Adding API authentication Requirements to Postman

- Once you've compiled the basic request information in Postman, look for the API's authentication requirements.
- Most APIs with authentication requirements will have a process for obtaining access, typically by sending credentials over a POST request, OAuth, or using a method separate from the API, such as email, to obtain a token.

- ex. OWASP DevSlop's Pixi API
  - Pixi's Swagger documentation tells us that we need to make a request with both `user` and `pass` parameters to the `/api/register` endpoint to receive a JWT.
  - If you've imported the collection, you can do this with the "Create Authentication Token" request in Postman.
  - Save this as a variable.
  - The preconfigured request contains parameters you may not be aware of and are not required for authentication. Instead of using the preconfigured information, you can craft the response by selecting the `x-www-form-urlencoded` option with the only parameters necessary (`user` and `pass`). You can then add the keys `user` and `pass` and fill in the values. p. 165
  ```
  {
    "user": "hapi@hacker.com",
    "pass": "Password1!"
  }
  ```
- Save successful authentication requests so you can repeat them when needed.
  - Tokens could be set to expire quickly.
- API security controls could detect malicious activity and revoke your token. As long as your account isn't blocked, you should be able to generate another token and continue your testing.
- When you get an authentication token or API key, add it to Kiterunner.
  - Adding an authentication header to the tool will greatly improve results.
  - Not only with Kiterunner provide you with a list of valid endpoints, but it will also hand you interesting HTTP methods and parameters.
- In the following example, we use the `x-access-token` provided to us from the Pixi registration process.
  - Take the full authorization header and add it to your Kiterunner scan with the -H option:
    `kr scan http://<target>:<port> -w /path/to/routes-large.kite -H 'x-access-token: <access token>'`
  - This should give Kiterunner access to endpoints it wouldn't otherwise have access to.

### Analyzing Functionality

- Once you have the API's information loaded into Postman, you should begin looking for issues.
- Begin by using the API as it was intended to be used.
  - Pay attention to the responses and their status cods and error messages.
- Seek out functionality that pings your hacker senses, particularly if there are indications of information disclosure, excessive data exposure, and other low-hanging vulnerabilities.
- Look for endpoints that could provide sensitive information, requests that allow you to interact with resources, areas of the API that allow you to inject a payload, and administrative actions.
- Streamline the process by proxying Kiterunner's results through Burp Suite so you can replay interesting requests.
  `kr kb replay -w /path/to/routes-large.kite --proxy=http://127.0.0.1:8080 "<Kiterunner output>"`
  - This request uses Kiterunner's replay option, as specified by `kb replay`.
  - The -w option specifies the wordlist used, and `proxy` specifies the Burp Suite proxy.
  - This allows you to repeat all interesting results captured by Kiterunner and to review the responses.

#### Testing Intended Use

- You can begin this process with a web browser, but they aren't designed to interact with APIs, so you might want to use Postman.
- Use the API documentation to see how you should structure your requests, what headers to include, what parameters to add, and what to supply for authentication. Then send the request.
  - Adjust your requests until you receive successful responses from the provider.

**Questions to Ask Yourself while Exploring**

- What sorts of actions can I take?
- Can I interact with other user accounts?
- What kinds of resources are available?
- When I create a new resource, how is that resource identified?
- Can I upload a file? Can I edit a file?

- There is no need to make every possible request if you are manually working with the API.
- If you have a built collection in Postman, you can easily make every possible request and see what response you get from the provider.
- ex.
  - Send a request to Pixi's `/api/user/info` endpoint to see what sort of response you receive from the application.
  - To make this request, you must use the GET method.
  - Add the {{baseUrl}}/api/user/info endpoint to the URL field.
  - Add the `x-access-token` to the request header.
  - Review the response.

#### Performing Privileged Actions

- If you've found the API documentation, any sort of administrative actions listed there should grab your attention.
  - Privileged actions often lead to additional functionality, information, and control.
  - ex. admin requests may give you the ability to create and delete users, search for sensitive user information, enable or disable accounts, add users to groups, manage tokens, access logs, and more.
- If security controls are in place, _administrative actions should have authorization requirements_, but **never assume that they actually do**.

**Testing admin actions**

1. Test as unauthenticated user.
2. Test as low privileged user.
3. Test as administrative user.

- When you make the admin requests as documented but without any authorization requirements, you should receive some sort of unauthorized response if any security controls are in place.

**Pixi Example**

- The documentation shows us that we need to use an `x-access-token` to perform the GET request to the `/api/admin/users/search` endpoint.
- When you test this endpoint, you will notice that Pixi has basic security controls in place to prevent unauthorized users from using administrative endpoints.
- This protected administrative endpoint establishes a goal for us in our testing: Obtain an admin JWT.

#### Analyzing API Responses

- Most APIs are designed to be self-service, this means developers will often leave some hint in the API responses when things don't go as planned.
- One of the most basic skills you need is the ability to analyze the responses from requests.
  - After sending a request, review the response for status code, headers, and content included in the body.
- Check to see if you're receiving the responses you expect.
  - API documentation often provides examples of what you could receive as a response.
- Once you start using the API in unintended ways, you won't have the ability to compare responses to the documentation, at least not in a straight forward way.
  - This is why it is good to use the API as intended before attacking it.
- Developing a sense of regular and irregular behavior will make vulnerabilities obvious.
- At this point, you should be able to find information disclosures, security misconfiguration, excessive data exposures, and business logic flaws without too much technical finesse.

### Finding Information Disclosures

- Anything that helps our exploitation of an APi can be considered an information disclosure, whether it's interesting status codes, headers, or user data.
- When making requests, review responses for software information, usernames, email addresses, phone numbers, password requirements, account numbers, partner company names, and any information that your target claims to be useful.

**Headers**

- Headers can inadvertently reveal more information about the application than necessary.
- `X-powered-by` and similar headers do not serve much of a purpose and often disclose information about the backend.
  - This helps us know what sort of payload to craft and reveals potential application weaknesses (Public exploits for outdated tech)

**Status Codes**

- If you were to brute-force the paths of different endpoints and receive responses with the status codes 404 Not Found or 401 Unauthorized, you could map out the API's endpoints as an unauthorized user.
- This gets worse if these status codes were returned for requests with different query parameters.
  - If you were able to query parameters for a customer's phone number, account number, and email address, you could brute-force these items by treating 404s as nonexistent and 401s as existing ones.
  - You could perform password spraying, test password resend mechanisms, or conduct phishing, vishing, and smishing.
  - You may be able to pair query parameters together and extract personally identifiable information from the unique status codes.

**API Documentation**

- API docs can in themselves be information disclosure risks.
- API docs can be an excellent source of information for business logic vulnerabilities.
- Admin API docs will often tell you the admin endpoints, the parameters required, and the method to obtain the specified parameters.
  - This can aid in authorization attacks (BOLA and BFLA).

### Finding Security Misconfigurations

- Security misconfigurations represent a large variety of items.
- **Look for**: verbose error messaging, poor transit encryption, and other problematic configurations.

#### Verbose Errors

- Error messages exist to help the developers on both the provider and consumer sides understand what has gone wrong.
- ex. If the API requires you to POST a username and password in order to obtain an API token, check how the provider responds to both existing and nonexistent usernames.
  - A common way to respond to nonexistent usernames is with the error "User does not exist, please provide a valid username." When a user does exist but you've used the wrong password, you may get the error "invalid password."
  - As discussed, these types of error messaging and open the doors for brute-forcing techniques.

#### Poor Transit Encryption

- Finding an API in the wild without transit encryption is rare.
  - If you find this to be the case, it is likely that the provider believes the API contains only non-sensitive public information.
  - In this case, your challenge is to find any sensitive information by use the API.
- If the API is transmitting any sensitive information, HTTPS should be in use.
- To perform attacks on an API with transit insecurities, you need to perform a _man-in-the-middle (MITM)_ in which you somehow intercept the traffic between a provider and a consumer.
  - Even if HTTPS is in place, check whether a consumer can initiate HTTP requests and share their tokens in the clear.
- Use a tool like wireshark to capture network traffic and spot plantext API requests passing across the network you're connected to.
- ex. If you send an HTTP request to the HTTPS-protected reqres.in it will not automatically encrypt HTTP requests and they will be sent in clear text.

#### Problematic Configurations

- Debugging pages are a form of security misconfiguration that can expose plenty of useful information.
- Always check to see if an API has debugging enabled.
  - This is more common with newly developed APIs.
- Debugging pages can provide information about the backend and much more.

### Finding Excessive Data Exposures

- When testing for excessive data exposure on a large scale, it's best to use a tool like Postman's Collection Runner, which helps you make many requests quickly and provides you with an easy way to review the results.
  - If the provider responds with more information that you needed, you may have found a vulnerability.
- Not every excess byte of data should be considered a vulnerability, watch for excess information that could be used in a further attack or discloses sensitive information.
- Real excessive data exposure vulns are often obvious because of the sheer quantity of data provided.
- ex. You've found an endpoint with the ability to search for usernames and when you query it you receive the username plus a time stamp of the user's last login.
  - This is excessive data, but isn't very useful or damaging to the company.
  - If this query resulted in returning the username, full name, email, birthday, this is significant and reportable.
- If you find excessive data exposures on one endpoint, you can bet there will be others.

### Finding Business Logic Flaws

From OWASPs advice on testing business logic flaws:

"You'll need to evaluate the threat agents who could possibly exploit the problem and whether it would be detected. Again, this will take a strong understanding of the business. The vulnerabilities themselves are often quite easy to discover an exploit without any special tools or techniques, as they are a supported part of the application."

- Business logic flaws are unique to each business and its logic.
- Finding and exploiting these flaws is usually a matter of turning the features of an API against the API provider.
- These flaws can be found in the API documentation when you find instructions on how not to use the application. (Check back in chapter 3 for more info)

**Examples**:

- If the documentation tell you not to perform X:
  - Perform action X.
- If the documentation tells you that data sent in a certain format isn't validated:
  - Upload a reverse shell payload and try to find ways to execute it.
  - Test the size of file that can be uploaded.
  - If reate limiting is lacking and file size if not validated, you've discovered a serious business logic flaw that will lead to a Denial of Service.
- If the documentation tells you that all file formats are accepted:

  - Upload files and test all file extensions.
  - The author has a list of file extensions for this purpose called [file-ext](https://github.com/hAPI-hacker/Hacking-APIs/tree/main/Wordlists).
  - If you can upload these sorts of files, the next step would be to see if you can execute them.

- Consider the features of a given endpoint and determine how a nefarious person could use them to their advantage.

## Chapter 8: Attacking Authentication

- When it comes to testing authentication, you'll find that many of the flaws that have plagues web applications for decades have been ported over to APIs: Bad passwords and password requirements, default credentials, verbose error messaging, and bad password reset processes.
- Certain authentication weaknesses are more commonly found in APIs than in traditional web apps:
  - Broken API authentication comes in many forms.
  - A lack of authentication altogether.
  - A lack of rate limiting for authentication attempts.
  - The use of a single token or key for all requests.
  - Tokens created with insufficient entropy.
  - Several forms of JSON Web Token (JWT) configuration weaknesses.

### Classic Authentication Attacks

#### Password Brute-Force Attacks

- Brute-forcing an API's authentication is not very different from any other brute-force attack, except you'll send the request to an API endpoint, the payload will often be in JSON, and the authentication values may be base64 encoded.
- Brute-forcing is loud and time consuming, but if the API lacks security controls to prevent brute-force attacks you should definitely try it out.
- Finding valid user names to use in brute-forcing can be incredibly helpful in saving time and leading to positive results.
- Resources for creating targeted password lists:
  - [Mentalist app](https://github.com/sc0tfree/mentalist)
  - [Common user Passwords Profiler](https://github.com/Mebus/cupp)
- You can use Burp Suite, wfuzz, hydra, or any other brute-forcing tool you're comfortable with.
  - ex. `wfuzz -d '{"email":"a@email.com","password":"FUZZ"}' --hc 405 -H 'Content-Type: application/json' -z file,/path/to/rockyou.txt http://<target>:<port>/api/end/point`
  - -d option allows you to fuzz content that is sent in the body of a POST request.
  - { } contain the body of the POST request.
    - to discover the request format, attempt to authenticate to a web application using a browser, and then capture the authentication attempt and replicate its structure in wfuzz.
  - --hc option hides responses with certain response codes.
    - Do a test run to understand what response codes or character lengths indicate a failed attempt.
  - Some API providers may issue an HTTP 415 Unsupported Media Type error code if you don't include the `Content-Type:application/json` header.
  - Status code 200 or 300s should indicate that you've successfully brute-forced credentials.

#### Password Reset and Multifactor Authentication Brute-Force Attacks

- If a password reset process includes security questions and does not apply rate limiting to requests, we can target it in such an attack.
- APIs often use SMS recovery codes or one time passwords (OTPs) in order to verity the identity of a user who want to reset their password. If no rate limiting is in place, you can start the recovery process and try to brute force these.
  - Try doing the account recovery process on a test account and see what type of OTPs or codes are sent, then use this to craft a list to use in brute forcing.
- Evasion techniques for rate limiting can be found in chapter 13.

#### Password Spraying

- Using a long list of users and a short list of passwords.
  - If you know the lockout policy is 10 login attempts, for example, you could craft a password list of 9 of the most used passwords and spray the users with them to try and get as many accounts as possible without locking out any of the accounts.
- Taking into account the providers password policy is helpful when crafting these lists.
  - There's no point using a password that doesn't conform to the password policy, so lists like rockyou.txt are out.
- Craft _path of small resistance (POS)_ passwords.
  - These are simple enough to guess but complex enough to meet the minimum requirements of the password policy.
  - POS type one:
    - Obvious passwords like QWER!@#$, Password1!, etc.
    - Formula based passwords like _Season_+_Year_+_Symbol_.
      - Winter2024!, March212024!, etc.
  - POS type two:
    - Passwords directly related to the target.
    - These would contain something like a capital letter, a number, a detail about the organization, and a symbol.
    - ex. for twitter:
      - Dorsey@2024, FuckElon!2024, etc.
- The key to successful password spraying is to maximize your user list.
- Burp Suites Cluster Bomb attack type is perfect for this as it lets you pass in a username list and a password list. This is heavily throttled in the Community Edition and it will take you a million years to complete if your list is as long as it should be.

#### Including Base64 Authentication in Brute-Force Attacks

- There are many reasons to base64 encode authentication payloads in the design of the API, security is not one of them.
- If you notice that an API is encoding to base64 while testing authentication, adjust your payloads to be encoded in base64.
- To do this in Burp Suite you must add a payload-processing rule.
  - Under the Payloads tab, select Add > Encoded > Base64-encode, and click OK.

### Forging Tokens

- When implemented correctly, tokens are an excellent way for APIs to authenticate users and authorize them to access their resources.
  - If anything goes wrong when generating, processing, or handling tokens, they become a hackers keys to the kingdom.
- Tokens can be stolen, leaked, and forged.
  - How to find and steal tokens in Chapter 6.
- To forge tokens, start by analyzing how predictable an API provider's token generation process is.

  - If you can discover any patterns in the tokens being provided, you may be able to forge your own or hijack another user's tokens.

- Burp Suites Sequencer provides two methods for token analysis:
  - Manually analyzing tokens provided in a text file
  - Performing a live capture to automatically generate tokens.

#### Manual Load Analysis

- To perform manual load analysis, select the Sequencer module and choose the Manual Load tab.
- Click Load and provide the list of tokens you want to analyze.
- The more tokens in the list, the better the results.
- Sequencer requires a minimum of 100 tokens for basic analysis and includes a bit-level analysis (automated analysis of the token converted to sets of bits).
  - These sets of bits are then put through a series of tests involving compression, correlation, and spectral testing, as well as four tests based on the Federal Information Processing Standard (FIPS) 140-2 security requirements.

_You can follow along with the examples by generating your won tokens or using the bad tokens hosted on [Hacking-APIs GitHub](https://github.com/hAPI-hacker/Hacking-APIs)._

- A full analysis will also include _character-level analysis_:

  - A series of tests performed on each character in the given position in the original form of the tokens.
  - The tokens are then put through a character count analysis and a character transition analysis.
  - The above two tests analyze how characters are distributed within a token and the differences between tokens.
  - To perform a full analysis, Sequencer could require thousands of tokens, depending on the size and complexity of each individual token.

- Once your tokens are loaded, you should see the total number of tokens loaded, the shortest token, and the longest token.
- Click Analyze Now to generate a report.
- The analysis report starts off with a summary of the findings.
- Use the character position analysis chart to determine which characters do not change and the other characters that change often.
  - This will be helpful in brute-forcing tokens.
- If only the last 3 characters change often, you should only focus on brute-forcing the last three characters.

#### Life Token Capture Analysis

- **Burp Suite's Sequencer can automatically ask an API provider to generate 20,000 tokens for analysis.**
  - To do this we simply intercept the provider's token generating process and then configure Sequencer.
  - Burp Suite will repeat the token generation process up to 20,000 times to analyze the tokens for similarities.
  - In Burp, intercept the request that initiates the token generation process.
  - Select "Action" (or right-click the request) and then forward it to Sequencer.
  - Within Sequencer, make sure you have the live capture tab selected, and under "Token Location Within Response", select the "Configure for the Custom Location" option.
  - Highlight the generated token and click "OK".
  - Select "Start Live Capture".
  - If you select the Auto analyze checkbox, Sequencer will show the effective entropy results at different milestones.
- On top of the this, you will have a large collection of tokens which could be useful in evading security controls (Chapter 13).
  - If the API doesn't invalidate the tokens once new ones are created and the security controls use tokens as the method of identity, you now have 20,000 identities to help you avoid detection.
- If there are token positions with low entropy, you can attempt to brute-force against those character positions.
  - Reviewing tokens with low entropy could reveal certain patterns you could take advantage of.
  - ex. If you notice that characters in certain positions only contain lowercase letters, or a certain range of numbers, you'll be able to enhance your brute-force attacks by minimizing the number of request attempts.

#### Brute-Forcing Predictable Tokens

- This section shows how to brute force the authors bad tokens (Ab4dt0k3naa1, Ab4dt0k3nab2, Ab4dt0k3nab3, ...) where the first 9 characters remain static and the last 3 characters are dynamic.
- These tokens were tested through Burp Suite and the results showed us that there was a clear pattern - you could also see this pattern by looking at a list of the tokens.
- To brute force tokens based on what we've found you need to use a cluster bomb attack in Burp Suite where you would set the last 3 characters of the token as variables.

  - The first 2 characters are always letters and the last character is always a number in these tokens.
  - To brute-force them efficiently, we set the payload character set for the first 2 variables as abcd and the last payload character set as 0-9.

- Using Wfuzz to avoid rate limiting:
  - ex. `wfuzz -u vulnexample.com/api/v2/user/dashboard -hc 404 -H "token: Ab4dt0k3nFUZZFUZ2ZFUZ3Z" -z list,a-b-c-d -z list,a-b-c-d -z range, 0-9`

### JSON Web Token Abuse

- JSON Web Tokens (JWTs) are one of the more prevalent API token types because they operate across a wide variety of programming languages, including Python, Java, Node.js, and Ruby.
- The tactics described in the previous sections could work against JWTs, but JWTs are vulnerable to several additional attacks as well.

_Note: For testing purposes, you might want to generate your own JWTs. Use https://jwt.io, a site created by Auth0, to do so. Sometimes the JWTs have been configured so improperly that the API will accept any JWT._

- If you've captured another user's JWT, you can try sending it to the provider and pass it off as your own.
  - There is a chance that the token is still valid and you can gain access to the API as the user specified in the payload.
- Normally, you are given a JWT when you register (or authenticate to) with an API. The token is then sent with every request.
  - Browsers do this for you automatically.

#### Recognizing and Analyzing JWTs

- ex. JWT token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c

- You can recognize JWTs from other tokens because they consist of three parts separated by periods:

  - Header:
    - A base64-encoded value that includes information about the type of token and hashing algorithm used for signing.
    - Typically begins with ey.
    ```
    {
      "alg": "HS256",
      "typ": "JWT"
    }
    ```
  - Payload:
    - A base64-encoded value that includes things like user information.
      - username
      - user ID
      - password
      - email address
      - date of token creation (iat)
      - privilege level
    - Typically begins with ey.
    ```
    {
      "sub": "1234567890",
      "name": "John Doe",
      "iat": 1516239022
    }
    ```
  - Signature
    - The signature is the output of HMAC used for token validation and generated with the algorithm specified in the header.
    - To create the signature, the API base64-encodes the header and payload and then applies the hashing algorithm and secret.
    - The secret can be in the form of a password or a secret string, such as a 256-bit key.
    - Without knowledge of the secret, the payload of the JWT will remain encoded.
    ```
    HMACSHA256(
    base64UrlEncode(header) + "." +
    base64UrlEncode(payload),
    your-256-bit-secret)
    ```

- If you come across a JWT during recon, you can decode them using Burp Suites Decoder by selecting "Decode As" > "Base64".

  - Alternatively, you could plug the JWT into [jwt.io's debugger](https://jwt.io/#debugger-io) to decode it.
  - You may get lucky when decoding JWTs and find useful information like username and user ID, or even username and password combinations.

- In the above example, the hashing algorithm is HMAC using SHA256.
- HMAC is primarily used to provide integrity checks similar to digital signatures.
- Another common hashing algorithm is RSA256, RSA using SHA256, which is an asymmetric hashing algorithm.
  - Additional info from [Microsoft API Docs](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography).
- Using a JWT with a symmetric key algo will require the consumer and provider to have the same single key.
- Using asymmetric key algos, the provider and consumer will use two different keys.
  - Understanding the difference between symmetric and asymmetric encryption will give you a boost when performing a JWT algorithm bypass attack.
- If the algorithm value is "none", the token has not been signed with any hashing algorithm.

**jwt-tool / jwt_tool**

- To quickly analyze JWTs you can use the jwt-tool (if installing from the AUR or black arch repos) or jwt_tool if you've cloned it from the [github](https://github.com/ticarpi/jwt_tool).
- ex. `jwt-tool <JWT>`
  - This will neatly print out the header and payload values of the JWT.
- You can use jwt-tool to perform a "Playbook Scan" that can scan a web application for common JWT vulnerabilities.
  - `jwt-tool -t https://target-site.com/ -rc "Header: JWT_Token" -M pb`
  - To use this command, you'll need to know what you should expect as the JWT header. When you have this information, replace "Header" with the name of the header and "JWT_Token" with the actual token value.

#### The None Attack

- Finding a JWT using "none" as its algorithm is an easy win.
- After decoding the token, you should be able to see everything in the header, payload, and signature.
  - Not only can you read everything in clear text, but you can also change the payload to whatever you like.
  - Changing the username to likely admin usernames like root, admin, administrator, test, adm, etc. and submit them until you get a hit.
  - You'll just need to re-encode the payload after changing it and reinsert it into the second position of the JWT.
- In this case, you can also delete the signature as it's not in use (everything after the second period.

#### The Algorithm Switch Attack

- If the API provider isn't checking the JWTs properly, you may be able to trick a provider into accepting a JWT with an altered algorithm.
- Try sending a JWT without the signature.
  - Leave the second period in place, but remove everything thereafter to delete the signature section.
- Try changing the JWT `"alg":` value to `"none"` in the header section, then re-encode the header and reinsert it into the JWT.
  - Submit the new JWT to the provider and see if it's accepted.
- You can use jwt-tool to create a variety of tokens with the algorithm set to "none" with:
  `jwt-tool <JWT_Token> -X a`

  - Check out the options for jwt-tool with `jwt-tool --help`.

- A more likely scenario than the provider accepting no algorithm is that they accept multiple algorithms.
- If the provider uses RS256 but doesn't limit the acceptable algorithm values, we could alter the algorithm to HS256.
  - RS256 is a asymmetric encryption scheme, meaning we need both the provider's private key and a public key in order to accurately hash the JWT signature.
  - HS256 is a symmetric encryption scheme, so only one key is used for both the signature and verification of the token.
    - If you can discover the providers RS256 public key and then switch the algorithm from RS256 to HS256, there is a chance you may be able to leverage the RS256 public key as the HS256 key.
- jwt-tool can make this attack easier.
  - It uses the format `jwt-tool <JWT_Token> -X k -pk public-key.pem` - You'll need to save the public key as a .pem file on your attacking machine to use this.
  - Running this command will provide you with a new token to use against the API.
  - If the provider is vulnerable, you'll be able to hijack other tokens, since you now have the key required to sign tokens.
    - Repeat the process to create new tokens based on other API users, focusing particularly on admin ones.

#### The JWT Crack Attack

- The JWT Crack attack attempts to crack the secret used for the JWT signature hash, giving us full control over the process of creating valid JWTs.
- Hash-cracking attacks like this take place offline, and do not interact with the provider.
  - ie. use a big wordlists to try as many secrets as possible.
- If you're performing a long-term brute-force attack of every character possible, you may want to use Hashcat for it's ability to use dedicated GPU power instead of jwt-tool.
  - That being said, jwt-tool can test 12 million passwords in under a minute.
    `jwt-tool <JWT_Token> -C -d /path/to/wordlist.txt`

## Chapter 9: Fuzzing

- The secret to finding APi vulnerabilities is knowing where to fuzz and what to fuzz with.
  - You'll likely find API vulnerabilities by fuzzing input sent to API endpoints.

### Effective Fuzzing

- API fuzzing is the process of sending requests with various types of input to an endpoint in order to provoke an unintended result.
  - Input could include:
    - symbols
    - numbers
    - emojis
    - decimals
    - hexadecimal
    - system commands
    - SQL input
    - NoSQL input
    - etc.
  - If the API has not implemented validation checks to handle harmful input, you could end up with a verbose error indicating that your fuzzing caused a denial of service.
- ex. A banking API call intended to allow users to transfer money from one account to another:

  ```
  POST /account/balance/transfer
  Host: bank.com
  x-access-token: hapi_token

  {
  "userid": 12345,
  "account": 224466,
  "transfer-amount": 1337.25
  }
  ```

  - You could easily set up Burp or Wfuzz to submit huge payloads as the `userid`, `account`, or `transfer-amount` values.
    - But! This could set off defensive mechanisms resulting in stronger rate-limiting or your token being blocked.
    - If no defence mechanisms exists to prevent this, this is fine to do.
    - If defence mechanisms are in place, it's best to send targeted requests to one value at a time.
  - Try sending payloads that the application would not expect:
    - A value in the quadrillions for the `transfer-amount`
    - A string of letters instead of numbers
    - A large decimal number or a negative number
    - Null values like null, (null), %00, and 0x00
    - Symbols like !@#$%\*^&():';;|,.?>'
    - Do this to try and illicit a verbose error message.

- If inputs don't have sufficient input handling and error handling, they can often lead to exploitation.
  - Examples of this sort of API input include fields involved in requests used for authentication forms, account registration, uploading files, editing web application content, editing user profile information, editing account information, managing users, searching for content, etc.

#### Choosing Fuzzing Payloads

- _Generic fuzzing payloads_ are those we've discussed so far and contain symbols, null bytes, directory traversal strings, encoded characters, large numbers, long strings, etc.
- _Targeted fuzzing payloads_ are aimed to provoke a response from specific technologies and types of vulnerabilities.
  - API object or variable names.
  - Cross-site scripting (XSS) payloads.
  - Directory brute forcing
  - file extensions.
  - HTTP request methods.
  - JSON or XML data.
  - SQL or NoSQL commands.
  - OS specific commands.
- You generally move from generic fuzzing to targeted fuzzing based on what the generic fuzzing reveals.
- Seclists is great for fuzzing payloads (wordlists) and can be downloaded through most package managers or found at https://github.com/danielmiessler/SecLists.
  - big-list-of-naughty-strings.txt is excellent at causing useful responses.
- Fuzzdb is another good source for fuzzing payloads: https://github.com/fuzzdb-project/fuzzdb .
- Wfuzz has payloads as well that can be found at https://github.com/xmendez/wfuzz.

#### Detecting Anomalies

- When fuzzing, you're attempting to cause the API or its supporting technology to send you information that you can leverage in additional attacks.
- When API request payloads are handled properly, you should receive some sort of HTTP response code and message indicating that your fuzzing did not work.
  - ex.
  ```
  HTTPS/1.1 400 Bad Request
  {
      "error": "number required"
  }
  ```
  - This response shows that the developers configured the API properly to handle the request sent and prepared a tailored response.
- When input is not handled properly and causes and error, the server will often return the error in the response.

  - ex.

  ```
  HTTP/1.1 200 OK
  --snip--

  SQL Error: There is an error in your SQL syntax.
  ```

  - This response reveals that you're interacting with an API that does not handle input properly and the backend of the app is utilizing an SQL database.

- When fuzzing, you're dealing with hundreds or thousands of responses, so you need to filter your responses in order to detect anomalies.
  - Do this by understanding what ordinary responses look like.
  - Establish a baseline by sending standard and correctly handled requests and/or by sending requests you expect to fail.
    - This paints a picture of how expected and unexpected requests are handled by the API.
  - Analyze and filter these requests by status code, response size, response content, time, or any other metrics that seem to point towards like behavior.
  - Once you have these baselines, look for anomalies and figure out what input caused the difference.
  - You can use Burp's Comparer to get a side-by-side view of responses that have small differences (you can compare more than 2!).
    - Use the "Sync views" toggle at the bottom right of Comparer to highlight differences between responses.

### Fuzzing Wide and Deep

**Fuzzing Wide**

- The act of sending an input across all of an API's unique requests in an attempt to discover a vulnerability.
- Testing a mile wide and an inch deep.
- Used to test for issues across all unique requests.
- Good for testing for improper asset management, finding all valid request methods, token-handling issues, and other information disclosure vulns.

**Fuzzing Deep**

- The act of thoroughly testing an individual request with a variety of inputs, replacing headers, parameters, query strings, endpoint paths, and the body of the request with your payloads.
- Testing an inch wide and a mile deep.
- Good for testing for BOLA, BFLA, injection, and mass assignment.

- Testing wide and deep can help you test every feature of larger APIs.
- APIs can vary greatly in size.
  - Some APIs only have a few endpoints and a handful of unique requests so testing isn't a lengthy process.
  - Others have many endpoints and unique requests.
    - Alternatively, a single request can be filled with many headers and parameters.

#### Fuzzing Wide with Postman

- Postman's Collection Runner tool makes it easy to run tests against all API requests.
  - If an API includes 150 unique requests across all the endpoints, you can set a variable to a fuzzing payload entry and test it across all 150 requests.
  - Easy to do once you've built a collection or imported API requests into Postman.
  - ex. You may use this strategy to test for whether the requests fail to handle various "bad" characters.
    - Send a single payload across the API and check for anomalies.
- Create a Postman environment in which to save a set of fuzzing variables.

  - This lets you seamlessly use the environment variables from one collection to the next.
  - Once the variables are set just save or update the environment.
    [!Fuzzing Variables](https://github.com/Xerips/BookNotes/tree/main/HackingAPIs/fuzzing_variable.png)
  - You can use the variables shown above in your requests by selecting the environment in the top right of the info pane (Fuzzing APIs), then inserting the variable with {{<variable name ex. fuzz1>}}

- Another useful feature of Postman is "Find and Replace" which can be found on the bottom left of the screen.
  - This allows you to search a collection (or all collections) and replace the search term with a value of your choice.
- If attacking Pixi API, for example, you will notice many placeholder parameters use tags like \<email>, \<number>, \<string>, and \<boolean>.

  - You can search and replace these placeholders with values of your choice, or use one of the fuzzing variables, like {{fuzz1}}.

- You can use the "Test" panel to help detect anomalies.
  - I'm not super familiar with Postman, but it seems like by "Test panel" the author means test scripts. On a request you will see the "Scripts" panel, which you can "Use JavaScript to write test, visualize responses, and more."
  - It seems as though a lot of the GUI layout has changed since the author wrote the book, so it may be best to familiarize yourself with Postman through their learning center.
  - ex. test script:
  ```
  pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
  });
  ```
  - With this test, Postman will check that responses have a status code of 200, and when a response is 200, it will pass the test.
  - You can easily customize this test by replacing 200 with another status code.
  - An easy way to get a baseline is to unselect the checkbox "Keep Variable Values". With this turned off, your variables won't be used in the first collection run.

#### Fuzzing Deep with Burp Suite

- Fuzz deep whenever you want to drill down into requests that appear interesting or demonstrate anomalies.
  - Use Burp Suite or Wfuzz
- You may initially craft your requests in Postman, make sure to proxy the traffic to Burp Suite.
- Start Burp, configure the Postman proxy settings, send the request, and make sure it was intercepted. Then forward the request to Intruder.
- Using the position markers, select every field's value to send a payload list as each of those values.
- A sniper attack will cycle a single wordlist through each attack position.
- When fuzzing it is always worthwhile to request the unexpected - as mentioned previously.
- Another useful tip is to send the expected value and include a fuzzing attempt following that value.
  - This can help bypass input validation while still seeing if you can fuzz the parameter.
  - ex. `"user": "hapi@hacker.com§test§"`
  - If the above still results in a "not a valid email" error message, you may want to try a different payload or move on to a different field.
- When you receive the results, organize the requests by column: status code, length of the response, request number, payload, etc, to try and pick up on anomalies.
- Find interesting responses like, `SyntaxError: Unexpected token in JSON at position 32`, and use them to improve your payloads to narrow down exactly what is causing the error.
  - ex. If the resulting responses indicate a database error, you could use payloads that target those databases.
  - If the error is related to an unexpected JSON token, try using JSON fuzzing payloads.

#### Fuzzing Deep with Wfuzz

- It's best to use Wfuzz if you only have the CE of Burp Suite because of the rate limiting.
- Wfuzz is considerably faster than Burp Suite, so you can increase the payload size.
- ex. Using SecLists payload called `big-list-of-naughty-strings.txt` which contains 500 values:
  ```
  wfuzz -z file,/path/to/big-list-of-naughty-strings.txt -H "Content-Type: application.json" -H "x-access-token: [...]" --hc 400 -X PUT -d "{
    \"user\": \"FUZZ\",
    \"pass\": \"FUZZ\",
    \"id\": \"FUZZ\",
    \"name\": \"FUZZ\",
    \"is_admin\": \"FUZZ\",
    \"account_balance\": \"FUZZ\",
  }" -u http://<target>:<port>/path/to/api/endpoint
  ```
  - You can proxy this request through Burp Suite by using the `-p 127.0.0.1:8080` flag and value. This will help you troubleshoot the command if you're having issues.
  ```
  wfuzz -z file,/path/to/big-list-of-naughty-strings.txt -H "Content-Type: application.json" -H "x-access-token: [...]" -p 127.0.0.1:8080 --hc 400 -X PUT -d "{
    \"user\": \"FUZZ\",
    \"pass\": \"FUZZ\",
    \"id\": \"FUZZ\",
    \"name\": \"FUZZ\",
    \"is_admin\": \"FUZZ\",
    \"account_balance\": \"FUZZ\",
  }" -u http://<target>:<port>/path/to/api/endpoint
  ```
  - Once it's proxied over, inspect the intercepted request and send it to Repeater to check for mistakes.

#### Fuzzing Wide for Improper Asset Management

- Improper asset management vulnerabilities arise when an organization exposes APIs that are either retired, in a test environment, or still in development.
  - These assets often have fewer protections than its supported production counterparts.
  - Improper asset management might affect only a single endpoint or request, so it's often useful to fuzz wide to test if improper assets management exists for any request across an API.

_Note: In order to fuzz wide for this problem, it helps to have a specification of the API or a collection file that will make the requests available in Postman. This section assumes you have an API collection available._

**Things to look for**:

- Outdated API documentation.
  - If API documentation has not been updated along with the API endpoints, it could contain references to portions of the API that are no longer supported.
- Changelogs
  - Look for entries like: `resolved broken object level authorization vulnerability in v3`
  - If you find something like this, look for the endpoint it references in v1 or v2.
- GitHub repository
  - Similar to changelogs, look for issues that have been fixed that seem juicy, then look for the outdated endpoint.

**Fuzzing**:

- When you're fuzzing an API endpoint, start with fuzzing the version number (v1, v2, v3, etc.)
  - Try replacing the current versions with v1, v2, v3, v4, test, mobile, uat, dev, old, etc.
  - Some API providers will allow access to administrative functionality by adding /internal/ to the path before or after the versioning.
    `/api/v2/internal/users`
    `/api/internal/v2/users`
- Begin by developing a baseline for how the API responds to typical requests using the Collection Runner with the API's expected version path.
  - How does the API respond to a successful request.
  - How does the API respond to a bad request (or requests for resources that do not exist).
- Set up the same rest for status codes of 200 we used earlier.
  - If the API provider typically responds with status code 404 for nonexistent resources, a 200 response for those resources would likely indicate that the API is vulnerable.
  - Make sure to insert this test at the collection level so that it will run on every request when you use the Collection Runner.
  - Save and run your collection.
  - Inspect the results for any requests that pass this test.
  - Once you've reviewed the results, rinse and repeat with a new keyword.
- If you discover an improper asset management vuln, your next step will be to test the non-production endpoint for additional weaknesses.
- This is where your recon skills will be put to good use.
- If you've found that the target's GitHub or a changelog states that the older version of the API was vulnerable to a BOLA attack, you can attempt such an attack on the vulnerable endpoint.

### Testing Request Methods with Wfuzz

- You can use fuzzing to determine all the HTTP request methods available for a given API request.
- First, capture or craft the API request whose acceptable HTTP methods you would like to test.
- ex.
  ```
  GET /api/v2/account HTTP/1.1
  HOST: restfuldev.com
  User-Agent: Mozilla/5.0
  Accept: application/json
  ```
- Next, create your request with Wfuzz using `-X FUZZ` to specifically fuzz the HTTP method.
- ex.
  `wfuzz -z list,GET-HEAD-POST-PUT-PATCH-TRACE-OPTIONS-CONNECT- -X FUZZ http://testsite.com/api/v2/account`
  - You should see a combination of 405 status codes (Method Not Allowed) which should all return the same response length (ex. 163 characters)
  - Wfuzz will confirm request methods that are allowed with 200 response codes.
  - If you receive a 405 status code that has a longer than usual response length, it could indicate that the request is allowed.
  - Anything that deviates from the baseline response is worthy of investigation.
- If you find an acceptable request method that is not detailed in the API documentation, you may have discovered functionality that was not intended for end users.
  - Undocumented functionality is a good find and should be tested for additional vulnerabilities.

### Fuzzing "Deeper" to Bypass Input Sanitization

- When fuzzing deep, you'll want to be strategic about setting payload positions.
  - ex. For an email field in a PUT request, an API provider may do a pretty decent job at requiring that the conents of the request body match the format of an email address.
  - Anything sent as a value that isn't an email address might results in the same 400 Bad Request error.
  - If you've thoroughly tested a field and it doesn't yield any interesting results, you may want to leave it out of additional tests or save it for more thorough testing in a separate attack.
- To fuzz even deeper into a specific field, you could try to escape whatever restriction are in place.

**Escaping**:

- Escaping is tricking the server's input sanitization code into processing a payload it should normally restrict.
- First, try sending something that takes the form of the restricted field, add a null byte, and then add another payload position for fuzzing payloads to be inserted:
  - ex. email field
    `"user": "a@b.com%00§test§`
  - You can fuzz for multiple escape characters like pipe (|), quotes (''), spaces, etc.
    `"user": "a@b.com§escape§§test§`
  - Using Burp Suite's cluster bomb attack is well suited for this, but is slow unless you have the Pro version.

### Fuzzing for Directory Traversal

- Directory Traversal (Path Traversal), is a vulnerability that allows an attacker to direct the web application to move to a parent directory using some form of the expression `../` and then read arbitrary files.
  - You could leverage a series of path traversal dots and slashes in place of the escape symbols described in the previous section.
- These vulnerabilities have been around for many years and are often well defended, but they are still possible with the right payload.
- If you're able to exit the API path, you may be able to access sensitive information such as application logic, usernames, passwords, and additional personally identifiable information (names, phone numbers, emails, addresses, etc).
- Can use both wide and deep techniques.
- Start wide an then drill in on specific request values.
- Enrich your payloads with information collected from reconnaissance, endpoint analysis, and API responses containing errors or other information disclosures.

## Chapter 10: Exploiting Authorization

The book focuses on two authorization vulnerabilities: BOLA and BFLA.

### Finding BOLAs

- BOLA continues to be the most prominent API-related vulnerability and luckily, it can be one of the easiest to test for.
- If you find that the APi lists resources following a certain pattern, you can test other instances using that pattern.
- ex. You notice that after making a purchase, the app uses an API to provide you with a receipt at the following location: `/api/v1/receipt/135`.
  - Knowing this, you could then check for other numbers by using 135 as the payload position in Burp Suite or Wfuzz and changing 135 to numbers between 0 and 200.
- When you're on the hunt for BOLA vulnerabilities, remember that they aren't only found using GET requests.
  - Attempt to use all possible methods to interact with resources you shouldn't be authorized to access.
- Vulnerable resource IDs aren't limited to the URL path.
  - Make sure to consider other possible locations to check for BOLA weaknesses, including the body of the request and headers.

#### Locating Resource IDs

- To perform thorough BOLA testing, you'll need to pay close attention to the information the API provider is using to retrieve resources, as it may not be so obvious.
- Look for user ID names or numbers, resource ID names or numbers, organization ID names or numbers, emails, phone numbers, addresses, tokens, or encoded payloads used in requests to retrieve resources.

_Note: predictable request values don't make an API vulnerable to BOLA; the API is considered vulnerable only when it provides an unauthorized user access to the requested resources._

- Often, insecure APIs will make the mistake of validating that the user is authenticated but fail to check whether that user is authorized to access the requested resources.

Table 10-1 Valid requests for Resources and the Equivalent BOLA test. All requests use the same UserA token.

| Type                 | Valid request                                                                        | BOLA test                                                                                               |
| -------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| Predictable ID       | GET /api/v1/account/2222<br>Token: UserA_token                                       | GET /api/v1/account/3333<br>Token: UserA_token<br>Token: UserA_token                                    |
| ID combo             | GET /api/v1/UserA/data/2222<br>Token: UserA_token                                    | GET /api/v1/UserB/Data/3333<br>Token: UserA_token<br>Token: UserA_token                                 |
| Integer as ID        | POST /api/v1/account/<br>Token: UserA_token<br>{"Account": 2222}                     | POST /api/v1/account/<br>Token: UserA_token<br>{"Account": \[3333]}                                     |
| Email as user ID     | POST /api/v1/user/account<br>Token: UserA_token<br>{"email": "UserA@email.com"}      | POST /api/v1/user/account<br>Token: UserA_token<br>{"email": "UserB@email.com"}                         |
| GROUP ID             | GET /api/v1/group/CompanyA<br>Token: UserA_token                                     | GET /api/v1/group/CompanyB<br>Token: UserA_token                                                        |
| Group and user combo | POST /api/v1/group/CompanyA<br>Token: UserA_token<br>{"email": "userA@CompanyA.com"} | POST /api/v1/group/CompanyB<br>Token: UserA_token<br>{"email": "userB@CompanyB.com"}                    |
| Nested Object        | POST /api/v1/user/checking<br>Token: UserA_token<br>{"Account": 2222}                | POST /api/v1/user/checking<br>Token: UserA_token<br>{"Account": {"Account": 3333}}                      |
| Multiple Objects     | POST /api/v1/user/checking<br>Token: UserA_token<br>{"Account": 2222}                | POST /api/v1/user/checking<br>Token: UserA_token<br>{"Account": 2222, "Account": 3333, "Account": 5555} |
| Predictable token    | POST /api/v1/user/account<br>Token: UserA_token<br>{"data": "DflK1df7jSdfa1acaa"}    | POST /api/v1/user/account<br>Token: UserA_token<br>{"data": "DflK1df7jSdfa2dfaa"}                       |

- Sometimes just requesting the resource won't be enough; instead, you'll need to request the resource as it was meant to be requested, often by supplying both the resource ID and the user's ID.
  - Due to the nature of how APIs are organized, a proper request for resources may require the _ID combo_ format shown in table 10-1.
  - Similarly, you may need to know the group ID along with the resource ID, as in the _group and user combo_ format.
- _Nested objects_ are a typical structure found in JSON data.
  - These are additional objects created within an object.
  - Since nested objects are a valid JSON format, the request will be processed if user input validation does not prevent it.
  - Using a nested object, you could escape or bypass security measures applied to the outer /key/value pair by including a separate key/value pair within the nested object that may not have the same security controls applied to it.
  - If the application processes these nested objects, they are an excellent vector for an authorization weakness.

#### A-B Testing for BOLA

- What we call A-B testing is the process of creating resources using one account and attempting to retrieve those resources as a different account.
  - This is one of the best ways to identify how resources are identified and what requests are used to obtain them.

**A-B Testing Process**:

1. Create resources as UserA.

- Now how the resources are identified and how the resources are requested.

2. Swap out your UserA token for another user's token.

- In many instances, if there is an account registration process, you will be able to create a second account (UserB).

3. Using UserB's token, make the request for UserA's resources.

- Focus on resources for private information.
- Test for any resources that UserB should not have access to (Full name, email, phone number, Social Security number, bank info, legal info, transaction data, etc.).
  _Note: the following 2 steps are a variation on A-B testing_:

4. Create multiple accounts at each privilege level to which you have access.

- Keep in mind that your goal is to test and validate security controls, not destroy someone's business.
- When perfomring BFLA attacks, there is a chance you could successfully delete the resources of other users, so it helps to limit a dangerous attack like this to a test account you create.

5. Using your accounts, create a resource with UserA's account and attempt to interact with it using UserB's.

- Use all the methods at your disposal.

#### Side-Channel BOLA

- One of the authors favorite methods of obtaining sensitive information from an APi is through side-channel disclosure. Essentially, this is any information gleaned from unexpected sources, such as timing data.
- Side-channel discoveries are another reason why it is important to use an API as it was intended and develop a baseline of normal responses.
- You could use timing, response codes, and lengths to deter mine if resources exist.
- ex. if an API responds to nonexistent resources with a 404 Not Found but has a different response for existing resources, such as 405 Unauthorized, you'll be able to perform a BOLA side-channel attack to discover existing resources such as usernames, account IDs, and phone numbers.
- On their own, BOLA findings may seem minimal, but information from these attacks can prove to be valuable in other attacks.
  - You could leverage information gathered through a side-channel disclosure to perform brute-force attacks to gain entry to valid accounts.
  - You could use information found from one BOLA test to perform other BOLA tests, such as the ID combo BOLA test.

### Finding BFLAs

- Hunting for BFLAs involves searching for functionality to which you should not have access.
- BFLAs might allow you to update object values, delete data, and perform actions as other users.
- To test for it, try to alter or delete resources or gain access to functionality that belongs to another user or privilege level.

**Note: If you successfully send a DELETE request, you'll no longer have access to the given resource. For that reason, avoid testing for DELETE while fuzzing, unless you're targeting a test environment. Start your BFLA testing on a small scale to avoid causing huge interruptions.**

#### A-B-A Testing for BFLA

- Similar to BOLA A-B testing, A-B-A testing is the process of creating and accessing resources with one account and then attempting to alter the resources with another account.
  - You should validate any changes with the original account.

**A-B-A Testing Process**:

1. Create, read, update, or delete resources as UserA.

- Note how the resources are identified and how the resources are requested.

2. Swap out your UserA token for UserB's.

- In instances where there is an account registration process, create a second test account.

3. Send GET, PUT, POST, and DELETE request for UserA's resources using UserB's token.

- If possible, alter resources by updating the properties of an object.

4. Check UserA's resources to validate changes have been made by using UserB's token.

- Either by using the corresponding web application or by making API requests using UserA's token, check the relevant resources.
- If, for example, the BFLA attack was an attempt to delete UserA's profile picture, load UserA's profile to see if the picture is missing.

- In addition to testing authorization weaknesses at a single privilege level, ensure that you check for weaknesses at other privilege levels.
- APIs could have all sorts of different privilege levels, such as basic user, merchant, partner, and admin.
- If you have access to accounts at the various privilege levels, your A-B-A testing can take on a new layer.
- Try making UserA an administrator and UserB a basic user.
- If you're able to exploit BLFA in that situation, it will have become a privilege escalation attack.

#### Testing BFLA in Postman

- Begin your BFLA testing with authorized requests for UserA's resources.
- ex. If testing whether you could modify another user's pictures in a social media app, a simple request like the following will do:
  ```
  GET /api/picture/2
  Token: UserA_token
  ```
  - This request tells us that resources are identified by numeric values in the path.
  - Moreover, the response indicates that the username of resource ("UserA") matches the request token.
  ```
  200 OK
  {
      "_id": 2,
      "name": "development flower",
      "creator_id": 2,
      "username": "UserA",
      "money_made": 0.35,
      "likes": 0
  }
  ```
- Because this is a social media app, being able to access another users picture with a GET request wouldn't constitute a BOLA. It's an intended feature.
- UserB shouldn't be able to delete the picture that belonged to UserA. That is what crossed into BFLA territory.
- In Postman, try sending a DELETE request for UserA's resource by using UserB's token.
  - If it successfully deletes UserA's resource indicated in the response, confirm that it has been deleted by checking on UserA's account, or send a follow up GET request for the resource.
  - If confirmed, this is a significant finding.

**Priv Esc**:

- Documentation greatly simplifies finding privilege escalation related BFLA vulnerabilities.
- Administrative actions may also be clearly labelled in a collection.
- You could also always go through the process of reverse engineering administrative functionality.
  - Fuzz for admin paths.
- Start testing for BFLAs by making administrative requests as a low-privileged user.

  - If an API allows administrators to search for users with a POST request, try making that exact admin request to see if any security controls are in place to prevent you from succeeding.
  - Request:

  ```
  POST /api/admin/find/user
  Token: LowPriv-Token

  {"email": "hapi@hacker.com"}
  ```

  - Response:

  ```
  200 OK HTTP/1.1

  {
  "fname": "hAPI",
  "lname": "Hacker",
  "is_admin": false,
  "balance": "3737.50",
  "pin": 8675
  }
  ```

- The ability to search for users and gain access to another user's sensitive information was meant to be restricted to only those with an administrative token.
- By making a request to the /admin/find/user endpoint, you can test to see if there is any technical enforcement.
- Admin requests will often generate more sensitive information than a lower privileged request.
- If the initial request isn't successful, try using a different request method: POST instead of PUT. Be careful not to damage anything.

### Authorization Hacking Tips

"Attacking a large-scale API with hundreds of endpoints and thousands of unique requests can be fairly time-consuming. The following tactics should help you test for authorization weaknesses across an entire API: using Collection variables in Postman and using the Burp Suite Match and Replace feature."

#### Postman's Collection Variables.

- You can use Postman to perform variable changes across a collection, setting the authorization token for your collection as a variable.

1. Begin by testing various requests for your resources to make sure they work properly as UserA.
2. Replace the token variable with the UserB token.

- To help you find anomalous responses, use a Collection test to locate 200 response codes or the equivalent for your API.
- In Collection Runner, select only the requests that are likely to contain authorization vulnerabilities.
  - Prioritize requests that contain private information belonging to UserA.
  - Launch the Collection Runner and review the results looking for instances where UserB's token successfully generated a response for the resources.
  - These successful responses likely indicate either BOLA or BFLA vulnerabilities and should be investigated further.

#### Burp Suite Match and Replace.

- Where to find the feature: Proxy > Options > Match and Replace.
- Burp Suites history will populate with unique requests while attacking an API (If you're using Burp to browse/interact and have Postman Proxying through Burp).
- You can use the Match and Replace feature to perform a large scale replacement of a variable like an authorization token in these populated requests.
- Start by collecting several requests in your history as UserA, focusing on actions that should require authorization.
  - Requests that involve a user's account and resources.
- Next, match and replace the authorization headers with UserB's and repeat the requests.

## Chapter 11: Mass Assignment

- An API is vulnerable to mass assignment if the consumer is able to send a request that updates or overwrites server-side variables.
- If an API accepts client input without filtering or sanitizing it, an attacker can update objects with which they shouldn't be able to interact.
  - ex. A banking API might allow users to update the email address associated with their account, but a mass assignment vulnerability might let the user send a request that updates their account balance as well.

### Finding Mass Assignment Targets

- One of the most common places to discover and exploit mass assignment vulnerabilities is in API requests that accept and process client input.
  - Account registration, profile editing, user management, and client management are all common functions that allow clients to submit input using the API.

#### Account Registration

- The account registration process is a particularly juicy place to look for mass assignment vulnerabilities because it may allow you to register as an administrative user.
- If the registration process relies on a web application, the end user would fill in standard fields with information like their desired username, email address, phone number, and account password.
- ex.
  ```
  POST /api/v1/register
  --snip--
  {
  "username": "hAPI_hacker",
  "email": "hapi@hacker.com",
  "password": "Password!"
  }
  ```
- Once you've intercepted a registration request, check whether you can submit additional values in the request.
- A common version of this attack is to upgrade an account to an administrator role by adding a variable that the API provider likely uses to identify admins:
  ```
  POST /api/v1/register
  --snip--
  {
  "username": "hAPI_hacker",
  "email": "hapi@hacker.com",
  "admin": true,
  "password": "Password!"
  }
  ```
- If accepted by the API provider, this request will turn the account being registered into an admin-level account.

#### Unauthorized Access to Organizations

- You can also use mass assignment to gain unauthorized access to other organizations.
- If your user objects include an organizational group that allows access to company secrets or other sensitive information, you can attempt to gain access to that group.
- ex.

```
POST /api/v1/register
--snip--
{
  "username": "hAPI_hacker",
  "email": "hapi@hacker.com",
  "org": "§CompanyA§",
  "password": "Password!"
}
```

- If you can assign yourself to other organizations, you will likely be able to gain unauthorized access to the other group's resources.
- To perform this attack, you'll need to know the names or IDs used to identify the companies in requests.
  - If the `"org"` value is a number, you can brute force this like you do testing for BOLA.
- Do not limit your search for mass assignment vulnerabilities to the account registration process.
  - Other API functions are capable of being vulnerable.
  - Test other endpoints used for resetting passwords, updating account, group, or company profiles, or any other endpoints where you may be able to assign yourself additional access.

### Finding Mass Assignment Variables

- The challenge with mass assignment attacks is that there is very little consistency in the variables used between APIs.
- If the API provider has some method for designating accounts as administrator, you can be sure that they also have some convention for creating or updating variables to make a user an administrator.
  - Fuzzing can speed up your search for mass assignment variables, but unless you understand your target's variables, this technique can be a shot in the dark.

#### Finding Variables in Documentation

- Look for sensitive variables in the API documentation.
- Specifically in sections focused on privileged actions.
- The documentation can give you a good indication of what parameters are included within JSON objects.
- ex. Search for how a low-privileged user is created compared to how an administrator account is created.
  - Standard user account creation request:
  ```
  POST /api/create/user
  Token: LowPriv-User
  --snip--
  {
  "username": "hapi_hacker",
  "pass": "ff7ftw"
  }
  ```
  - Admin account:
  ```
  POST /api/admin/create/user
  Token: AdminToken
  --snip--
  {
  "username": "adminthegreat",
  "pass": "bestadminpw",
  "admin": true
  }
  ```
  - The admin request is submitted to an admin endpoint, uses an admin token, and includes the parameter `"admin": true`.
  - You could also trick the API into setting a low priv account to an admin account by adding `"admin": true` to the LowPriv account.
    - You could try this as well as trying to set the `Token: AdminToken` header if that fails.

#### Fuzzing Unknown Variables

- Another common scenario is that you'll perform an action in a web app, intercept the request, and locate several bonus headers or parameters within it, like:

```
POST /create/user
--snip--
{
"username": "hapi_hacker"
"pass": "ff7ftw",
"uam": 1,
"mfa": true,
"account"; 101
}
```

- Parameters used in one part of an endpoint might be useful for exploiting mass assignment using a different endpoint.
- When you don't understand the purpose of a certain parameter, experiment with it.
- Try setting `uam` to zero, `mfa` to false, and `account` to every number between 0 and 101, then check the responses.
- Try using the various fuzzing payloads from previous chapters.
- Build up a wordlist with the parameters you collect from an endpoint and fuzz by submitting requests with those parameters included.
- Account creation is a great place to do this, but don't limit yourself.

#### Blind Mass Assignment Attacks

- If you cannot find variable names in the locations discussed, you could perform a blind mass assignment attack.
- Blind Mass Assignment Attacks attempt to bute-force possible variable names through fuzzing.
- Send a single request with many possible variables, like the following:

```
POST /api/v1/register
--snip--
{
"username": "hAPI_hacker",
"email": "hapi@hacker.com"
"admin": true,
"admin": 1,
"isadmin": true,
"role": "admin",
"role": "administrator",
"user_priv": "admin",
"password": "Password1!"
}
```

- If the API is vulnerable, it might ignore the irrelevant variables and accept the variable that matches the expected name and format.

### Automating Mass Assignment Attacks with Arjun and Burp Suite Intruder

- Arjun does parameter fuzzing.
- ex: `arjun --headers "Content-Type: application/json]" -u http://vulnhost.com/api/register -m JSON --include='{$arjun$}'`
- As a result, Arjun will send a series of request with various parameters from a wordlist to the target host.
- Arjun will then narrow down likely parameters based on deviations of response lengths and response codes and provide you with a list of valid parameters.
- If you run into issues with rate limiting, you can use the Arjun `--stable` option to slow down the scans.
- Many APIs prevent you from sending too many parameters in a single request, as a result, you might receive on of several HTTP status codes in the 400 range, such as 400 Bad Request, 401 Unauthorized, or 413 Payload Too Large.
  - Instead of sending a signel large request, you could cycle through possible mass assignment variables over many requests.
  - This can be done by setting up the request in Burp Suite's Intruder with the possible mass assignment values as the payload:
  ```
  POST /api/v1/register
  --snip--
  {
  "username": "hAPI_hacker",
  "email": "hapi@hacker.com",
  §"admin": true§,
  "password": "Password1!"
  }
  ```

### Combing BFLA and Mass Assignment

- If you find a BFLA vuln that allows you to update other user's accounts, try combining this ability with a mass assignment attack.
- ex. A BFLA vuln is found that only allows users to edit basic profile information such as usernames, addresses, cities, and regions.

```
PUT /api/v1/account/update
Token: UserA-Token
--snip--
{
"username": "Ash",
"address": "123 C St.",
"city": "Pallet Town",
"region": "Kanto",
}
```

- On its own, this vulnerability would allow attackers to deface other user accounts.
- Performing a Mass Assignment attack with this request could make the BFLA finding more significant.
- ex. The attacker analyzes other GET requests in the APi and notices that other requests include parameters for email and multifactor authentication (MFA) settings. The attacker also found another user Broke, whose account he would like to access:

```
PUT /api/v1/account/update
Token: UserA-Token
--snip--
{
"username": "Brock",
"address": "456 Onyx Dr",
"city": "Pewter Town",
"region": "Kanto",
"email": "ashe@email.com",
"mfa": false
}
```

- This request, if it were successful, would disable Brock's MFA settings, and replace Brock's email with Ash's email.
  - Changing the email allows Ash to perform a password reset - Likely a POST or PUT request sent to `/api/v1/account/reset` or something similar.
- Pwned.

## Chapter 12: Injection

- Injection attacks are typically named after the technology they are targeting.
- SQL Injection exploits SQL databases.
- NoSQL Injection exploits NoSQL databases.
- Cross-site Scripting (XSS) attacks insert scripts into web pages that run on a user's browser.
- Cross-API Scripting (XAS) leverages third-party applications ingested by the API you're attacking.
- Command Injection is an attack against the web server operating system to gain RCE.

### Discovering Injection Vulnerabilities

- First start by finding places where APIs accept user input.
  - You can do this through fuzzing and then analyzing the responses you receive.
- You should attempt injection attacks against all potential inputs and especially within the following:
  - API keys
  - Tokens
  - Headers
  - Query strings in the URL
  - Parameters in POST/Put requests
- How you fuzz is determined by how much information you know about your target.
  - If you're not worried about making noise, you could send a variety of fuzzing inputs likely to cause an issue in many possible supporting technologies.
  - The more you know about the API, the better the attacks will be.
  - If you know what database the application uses, what operating system is running on the web server, or the programming language in which the app was written, you'll be able to submit targeted payloads aimed at detecting vulnerabilities in those particular technologies.
- After sending the fuzzing requests, hunt for responses that contain a verbose error message or some other failure to properly handle the request.
  - In particular, look for any indication that your payload bypassed security controls and was interpreted as a command at the OS, Programming, or database level.
  - This could include clear messages like "SQL Syntax Error" or be as subtle as an increase in the processing time of the request.
  - You could get lucky and receive an entire verbose error dump that can provide you with plenty of details about the host.
- When you find a vulnerability, test every similar endpoint for that vuln.
  - If you find a vulnerability in `/file/upload` it is likely that all file upload features will be vulnerable: `/image/upload`, `/account/upload`.
- Several of these injection attacks have been around for decades.
- The only thing unique about API injection is that the API provides a newer delivery method for the attack.
- Injection vulns are well known and often have a big impact on application security so they are often well-protected against.

### Cross-Site Scripting (XSS)

- XSS is a classic web application vulnerability that has been around for decades.
- In an XSS attack, the attacker inserts a malicious script into a website by submitting user input that ets interpreted as JavaScript or HTML by a user's browser.
- Often XSS attacks inject a pop-up message into a web page that instructs a user to click a link that redirects them to the attacker's malicious content.
- In a web application, executing an XSS attack normally ocnsists of injecting XSS payloads into different input fields on the site.
- In testing APIs for XSS, your goal is to find an endpoint that allows you to submit requests that interact with the frontend web application.
- If the application doesn't sanitize the request's input, the XSS payload might execute the next time a user visits the application's page.
- For the attack to succeed, the API must interact with a web browser, which is not always the case.
- ex. XSS payloads:
  `<script>alet("xss")</script>`
  `<script>alert(1);</script>`
  `<%00script>alert(1)</%00script>`
  `SCRIPT>alert("XSS");///SCRIPT>`

  - If you want to learn more about XSS and XSS payloads, check out my BookNotes on [BugBountyBootCamp - XSS](https://github.com/Xerips/BookNotes/tree/main/BugBountyBootcamp#cross-site-scripting). There are a lot of techniques in that book to supplement what is found here.
  - Each of these scripts attempts to launch an alert in a browser, and the variations are for attempting input validation.

- API-specific XSS payloads resources:

  - [Payload Box XSS payload list](https://github.com/payload/box/xss-payload-list): Contains over 2,700 XSS scripts that could trigger a successful XSS attack.
  - [Wfuzz wordlist](https://github.com/xmendez/wfuzz/tree/master/wordlist): A shorter wordlist included with one of our primary tools. Useful for a quick check for XSS.
  - [NetSec.expert XSS payloads](https://netsec.expert): Contains explanations of different XSS payloads and their use cases. Useful to better understand each payload and conduct more precise attacks.

- If the API implements some form of security, many of your XSS attempts shuld produce similar results, like 405 Bad Input or 400 Bad Request.
  - Watch closely for outliers, if you find requests that result in some form of successful response, try refreshing the relevant web page in your browser to see if the XSS attempt affected it.
- When reviewing the web apps for potential API XSS injection points, look for requests that include client input and are used to display information within the web app:
  - Updating user profile information
  - Updating social media "like" information
  - Updating e-commerce store products
  - Posting to forums or comment sections
  - Search the web application for requests and then fuzz them with an XSS payload.

### Cross-API Scripting (XAS)

- XAS is cross-site scripting performed across APIs.
- ex. hAPI Hacking blog has a sidebar powered by a LinkedIn newsfeed.
  - The blog has an API connection to LinkedIn such that when a new post is added to the LinkedIn newsfeed, it appears in the blog sidebar as well.
  - If the data received from LinkedIn isn't sanitized, there is a chance that an XAS payload added to a LinkedIn newsfeed could be injected into the blog.
  - To test this, you would post a LinkedIn newsfeed update containing a XAS script and check whether it successfully executes on the blog.
- XAS has more complexities than XSS, because the web application must meet certain conditions in order for XAS to succeed.
  - The web app must poorly sanitize the data submitted through its own API or a third-party one.
  - The API input must also be injected into the web app in a way that would launch a script.
  - If you're attempting to attack your target through a third-party API, you may be limited in the number of requests you can make through its platform.
- The major challenge for XAS is the same as XSS, bypassing input validation.
  - You can borrow from XSS payloads to try and bypass XAS input validation.
- In addition to testing third-party APIs for XAS, you might look for vulnerability in cases when a provider's API adds content or makes changes to its web application.

  - ex. hAPI Hacking blog allows users to update their user profiles through either a browser or a POST request to the API endpoint `/api/profile/update`.
  - The hAPI Hacking blog security team may have spent all their time protecting the blog from input provided using the web app, completely overlooking the API as a threat vector.
  - To test this, you might try to send a typical profile update request containing your payload in one field of the POST request:

  ```
  POST /api/profile/update HTTP/1.1
  Host: hapihackingblog.com
  Authorization: hAPI.hacker.token
  Content-Type: application/json

  {
  "fname": "hAPI",
  "lname": "Hacker",
  "city": "<script>alert("xas")</script>"
  }
  ```

  - If the request succeeds, load the web page in a browser to see whether the script executes.
  - If the API implements input validation, the server might issue an HTTP 400 Bad Request response, preventing you from sending scripts as payloads.
    - In this case, try using Burp Suite or Wfuzz to send a large list of XAS/XSS scripts in an attempt to locate some that don't results in a 400 response.

- Another XAS tip is to try altering the `Content-Type` header to induce the API into accepting an HTML payload to spawn the script:
  `Content-Type: text/html`
- XAS requires a specific situation to be in place in order to be exploitable.
  - API defenders often do a better job preventing XSS and SQL injection because they have been around for 20+ years.
  - XAS is newer and more complex so there may be a better chance of sneaking these through.

### SQL Injection

- SQL injection occurs when a remote attacker can interact with the application's backend SQL by leveraging user input endpoints to send malicious payloads.
- Successful SQL injection allows attackers to obtain or delete sensitive information housed on the SQL server such as credit card numbers, usernames, passwords, and other gems.
  - Attackers could also use access to the SQL server to to bypass authentication and even gain system access. Don't have a valid login and password? Make your own!
- SQL injection has also been around forever, and its prevalence was diminishing before APIs presented a new way to perform injection attacks.
  - But because of the severity of impact of SQL injection attacks, API defenders have been keen on detecting and preventing SQL injections over APIs and so these attacks are generally not likely to succeed.
  - Sending SQL payloads will often lead to having your authorization token banned.
- You can detect SQL database presence in less obvious ways than fuzzing with SQL injection payloads.
  - The best way to do this is to submit gibberish or different data types when sending a request in order to tease out a SQL error message.
  - If the API expects a key value pair where the value is an integer, send a string; if it expects a boolean submit an integer; etc.
  - Use a bad character list to fuzz these endpoints for verbose error messages. Fuzz wide with this looking for anything and everything that may indicate weak security on database endpoints - even unexpected ones.
- When looking for requests to target for database injections, seek out those that allow client input and can be expected to interact with a database.
- If you find an endpoint that contains data that is likely to be stored in a database, it is also likely that a PUT request will allow us to update it.

#### Manually Submitting Metacharacters

- Metacharacters are characters that SQL treats as functions rather than as data.
  - If an API endpoint doesn't filter SQL syntax from API requests, and SQL queries passed to the database from the API will execute.
  - `--` tells the SQL interpreter to ignore the following input because it's a comment. It is particularly useful in crafting payloads.
  - Other SQL metacharacters that can cause issues:
  - `'`, `''`, `;%00`, `-- -`, `""`, `;`, `' Or '1`, `' OR 1 -- -`, `" OR "" = "`, `" OR 1 = 1 -- -`, `' OR '' = '`, `OR 1=1`.
  - A null byte like `;%00` could cause a verbose SQL-related error.
  - `OR 1=1` is a conditional statement that literally means "or the following statement is true", and results in a true condition for the given SQL query. This can return quite a lot if it works.
  - Single and Double quotes are used in SQL to indicate the beginning and ending of a string, so quotes could cause an error or a unique state.
    - Single and Double quotes are used to escape the current query to cause an error or to append your own SQL query.
- Imagine that the backend is programmed to handle the API authentication process with an SQL query like the following:
  `SELECT * FROM userdb WHERE username = 'hAPI_hacker' AND password = 'Password1!'`
  - If instead of a password, we supplied the API with the value `' OR 1=1-- -`:
    `SELECT * FROM userdb WHERE username = 'hAPI_hacker' OR 1=1-- -`
  - This would be interpreted as selecting the user with a true statement and skipping the password requirement because the password requirement has been commented out.
  - If successful, the query would no longer perform a check for the password at all, and the user would be granted access.

#### SQLmap

- A great way to automatically test an API for SQL injection is to save a potentially vulnerable request in Burp and then use SQLmap against it.
- You can discover potential SQL weaknesses by fuzzing all potential inputs in a request and then reviewing the responses for anomalies.
- Once you've saved the request, launch SQLmap with a command like the following:
  `sqlmap -r /home/hapihacker/burprequest1 -p password`
  - The -r option lets you specify the path to the saved request, the -p option lets you specify the exact parameters you'd like to test for SQL injection.
  - If you do not specify a parameter, SQLmap will attack every parameter, one after another.
  - This is great for performing a thorough test of a simple request, but can be time consuming if you have a request with many parameters.
- SQLmap tests 1 parameter at a time and tells you whether the parameter is likely to be vulnerable or not.
- To skip a parameter, use CTRL+C to pull up SQL map's scan options and use the n command to move to the next parameter.
- When SQLmap indicates that a certain parameter may be injectable, attempt to exploit it. Here are two steps to do this:
  1. Dump all database entries:
     `sqlmap -r /path/to/burprequest1 -p vuln-param -dump-all`
  - If you're not interested in dumping the entire database, you could use the --dump command to specify the exact table and columns you would like:
    `sqlmap -r /path/to/burprequest1 -p <vuln-param> -dump -T users -C password -D helpdesk`
  - When these commands execute successfully, SQL map will display the database information on the command line and export the info to a CSV file.
  2. Use SQLmap to automatically attempt to upload a web shell and execute the shell to grant you with system access:
     `sqlmap -r /path/to/burprequest1 -p <vuln-param> -os-shell`
  - This command will attempt to leverage the SQL command access within the vulnerable parameter to upload an launch a shell.
  - If successful you will get an interactive shell with the target operating system.
    `sqlmap -r /path/to/burprequest1 -p <vuln-param> -os-pwn`
  - os-pwn option will attempt to gain a shell using Meterpreter or VNC.

### NoSQL Injection

- APIs commonly use NoSQL databases due to how well they scale with the architecture designs common to APIs.
  - You may find that you run across NoSQL more often than SQL databases.
- NoSQL injection techniques aren't as well known as SQL injection.
- NoSQL is an umbrella term that means the database does not use SQL.
- These databases have unique structures, modes of querying, vulnerabilities, and exploits.
- Common NoSQL metacharacters:
  - `$gt`, `{"$gt":""}`, `{"$gt":-1}`, `$ne`, `{"$ne":""}`, `{"$ne":-1}`, `$nin`, `{"$nin":1}`, `{"$nin":[1]}`, `|| '1'=='1`, `//`, `||'a'//'a`, `'||'1'=='1';//`, `'/{}:`, `'"\;{}`, `'"\/$[].>`, `{"$where": "sleep(1000)"}`.
  - `$gt` is a MongoDB NoSQL query operator that selects documents that are greater than the provided value.
  - `$ne` is a query operator that selects documents where the value is not equal to the provided value.
  - `$nin` the "not in" operator, is an operator used to select documents where the field value is not within the specified array.
  - The other metacharacters listed above are used to cause verbose errors or other interesting behavior such as bypassing authentication or waiting 10 seconds.
- ex. An incorrect password response with a 202 status code:

```
HTTP/1.1 202 Accepted
X-Powered-By: Express
Content-Type: application/json; charset=utf-8

{"message":"sorry pal, invalid login"}
```

- ex. Sending the payload `'"\;{}` as the password parameter might cause the following 400 Bad Request response:

```
HTTP/1.1 400 Bad Request
X-Powered-By: Express
--snip--

SyntaxError: Unexpected token ; in JSON at position 54<br> &nbsp;at JSON.parse (&lt;anonymous&gt;)<br> [...]
```

- This error message doesn't indicate anything about the database in use.
- This error message does indicate that this request has an issue with handling certain types of user input, which could be an indication that it is potentially vulnerable to an injection attack.
  - If you see an error message similar to this, you should be testing deeper.
- Test it by using Burp or Postman and the list of of NoSQL payloads:

```
POST /login HTTP/1.1
Host: 192.168.195.132:8000
--snip--

user=hapi%40hacker.com&pass=§Password1%21§
```

- If successful, you will receive an authentication token and have access to the user's account.

### Operating System Command Injection

- To conduct an operating system command injection, you'll need to inject a command separator and operating system commands.
- Knowing the operating system that is running on the target is extremely helpful.
  - Get the most out of nmap scans during recon in an attempt to glean this info.
- Operating system command injection typically requires being able to leverage system commands that the applicatio has access to or escaping the application altogether.
- Key places to target:
  - URL query strings
  - Request parameters
  - Headers
  - Any request that has thrown unique or verbose errors, focusing particularly on errors containing operating system information, found during fuzzing attempts.
- Command Separators:
  - `|`, `||`, `&`, `&&`, `'`, `''`, `;`, `'"`
- If you don't know the target's underlying operating system, you can fuzz the target using two payloads:
  1. Command separator.
  2. Operating system command.

_Operating System Commands_

| Operating System | Command   | Description                             |
| ---------------- | --------- | --------------------------------------- |
| Windows          | ipconfig  | Shows the network configuration         |
|                  | dir       | Prints the contents of a directory      |
|                  | ver       | Prints the operating system and version |
|                  | echo %CD% | Prints the current working directory    |
|                  | whoami    | Prints the current user                 |
| Unix             | ip a      | Shows the network configuration         |
|                  | ls        | Prints the contents of a directory      |
|                  | uname -a  | Prints the operating system and version |
|                  | pwd       | Prints the current working directory    |
|                  | whoami    | Prints the current user                 |

- To perform this attack with Wfuzz, you can either manually provide a list of commands or supply them via a wordlist.
  - Save all the command separators in a file like _commandsep.txt_ and the operating machine commands as something like _os-cmds.txt_
    `wfuzz -z file,/path/to/commandsep.txt -z file,/path/to/os-cmds.txt http://<target>/path/to/endpoint/ex/query?=WFUZZWFUZ2Z`
- To perform this using Burp, you could use a cluster bomb attack.

- Things to shoot for when you have a successful OS command injection:
  - retrieve SSH keys.
  - read the /etc/shadow file.
  - explore the OS for juicy info.
  - Escalate to a reverse shell.
  - This is where API hacking transitions into regular hacking.

## Chapter 13: Applying Evasive Techniques and Rate Limit Testing

- When testing almost any API, you'll encounter security controls that hinder your progress.
- These could be:
  - A WAF that scans your requests for common attacks.
  - Input validation that restricts the type of input you send.
  - Rate limiting tha restricts how many requests you can make.
- Because REST APIs are stateless, API providers find way to effectively attribute the origin of requests, and they'll use some detail about that attribution to block your attacks.
  - If you can discover those details, you can often trick the API.

### Evading API Security Controls

- WAFs are the most common security control in place to protect APIs.
- They are essentially software that inspects API requests for malicious activity.
- They measure all traffic against a certain threshold and then take action if they find anything abnormal.
- If you notice that a WAF is present, you can take preventative measures to avoid being blocked from interacting with your target.

#### How Security Controls Work

- Security controls may differ from one API provider to the next, but at a high level, they will have some threshold for malicious activity that will trigger a response.
- WAFs can be triggered by a wide variety of things:
  - Too many requests for a resource that does not exist.
  - Too many requests within a small amount of time.
  - Common attack attempts such as SQL injection and XSS attacks.
  - Abnormal behavior such as tests for authorization vulnerabilities.
- ex. A WAF's threshold for each of these categories is three requests. On the fourth malicious-seeming request, the WAF will have some sort of response, whether this means sending you a warning, altering API defenders, monitoring your activity with more scrutiny, or simply blocking you.
- To block you, these controls (WAFs for example), must have some way of determining who you are. The process of identifying you is called attribution.
- Because RESTful APIs are stateless, any information used to identify you must be contained within the request.
  - IP address
  - Origin headers
  - Authorization Tokens
  - Metadata
    - Metadata is information extrapolated by the API defenders, such as patterns of requests, the rate of requests, and the combination of the headers included in requests.
- More advanced products can block you based on pattern recognition and anomalous behavior.
- If 99% of an API's user base performs requests in a certain way, the API provider could use a technology that develops a baseline of expected behavior and then blocks any unusual requests.
  - Some API providers aren't comfortable using these tools, as they risk blocking a potential customer who deviates from the norm.
  - There is a tug of war between convenience (availability) and security.

_Note: In a white box or gray box test, it may make more sense to request direct access to the API from your client so that you're testing the API itself rather than the supporting security controls. For example, you could be provided accounts for different roles. Many evasive techniques in this chapter are most useful in black box testing._

#### API Security Control Detection

- The easiest way to detect API security controls is to attack the API with guns blazing.
  - If you throw the kitchen sink at it by scanning, fuzzing, and sending malicious requests, you will quickly find out whether security controls will hinder your testing.
  - The draw back to this approach is that you may only learn that, yes there are security controls, and yes you have been blocked from making further requests.
- To avoid this right out of the gate, first use the API as it was originally intended.
  - This way you have a chance to understand the APIs functionality before getting into trouble.
  - Review documentation, build out a collection of valid requests, and then map out the API as a valid users.
  - While doing this, review the API responses for evidence of a WAF.
    - WAFs often include headers with their responses.
- Pay attention to headers such as `X-CDN` in the request or response.
  - This means the API is leveraging a _content delivery network (CDN)_.
  - CDNs provide a way to reduce latency globally by caching the API provider's requests.
  - CDNs will often provide WAFs as a service.
  - APIs that proxy their traffic through CDNs will often include headers such as:
    - `X-CDN: Impreva`
    - `X-CDN: Served-By-Zenedge`
    - `X-CDN: fastly`
    - `X-CDN: akamai`
    - `X-CDN: Incapsula`
    - `X-Kong-Proxy-Latency: 123`
    - `Server: Zenedge`
    - `Server: Kestrel`
    - `X-Zen-Fury`
    - `X-Original-URI`
- Another method for detecting WAFs, and especially those provided by a CDN, is to use Burp Suite's Proxy and Repeater to watch for your requests being sent to a proxy.
  - A 302 response that forwards you to a CDN would be an indication of this.
- In addition to manually analyzing responses, you could use a tool such as W3af, Wafw00f, or Bypass WAF to proactively detect WAFs.
- Nmap script for detecting WAFs:
  `nmap -p 80 -script http-waf-detect http://<target>`
- Once you've discovered how to bypass a WAF or other security control, it will help to automate your evasion method to send larger payload sets (more info at the end of the chapter).

#### Using Burner Accounts

- Once you've detected the presence of a WAF, it's time to discover how it responds to attacks.
- You will need to develop a baseline for the API security controls in place, similar to the baselines you established while fuzzing in Chapter 9.
  - It's best to use burner accounts for this testing.
- _Burner Accounts_ are accounts or tokens you can dispose of should an API defense mechanism ban you.
- These accounts make testing safer.
- Create a bunch of accounts before starting attacks and create a short list of authorization tokens you can use during testing.
- When creating these accounts, make sure to use information that is not associated with the other accounts.
  - A smart API defender or defense system could collect the data you provide and associate it with the tokens you create.
  - Use:
    - Different names
    - Different email addresses
    - For next level separation, use a VPN or proxy to change your IP address while registering for different accounts.
- Ideally, you won't burn any of these accounts if you can evade detection in the first place.

#### Evasive Techniques

- Evading security control sis a process of trial and error.
- Some security controls are more secretive than others and don't advertise themselves in response headers.
- Burner accounts will help you identify actions that will trigger a response, you can then attempt to avoid those actions or bypass detection with your next account.

**String Terminators**

- Null bytes and other combinations of symbols often act as _string terminators_, or metacharacters used to end a string.
- If these symbols are not filtered out, they could terminate the API security control filters that may be in place.
- When you're able to successfully send a null byte, it is interpreted by many backend programming languages as a signifier to stop processing.
- If the null byte is processed by a backend program that validates user input, that validation program could be bypassed because it stops processing the input.
- String terminators:
  `%00`
  `0x00`
  `//`
  `;`
  `%`
  `!`
  `?`
  `[]`
  `%5B%5D`
  `%09`
  `%0a`
  `%0b`
  `%0c`
  `%0e`
- String terminators can be placed in different parts of the request to attempt to bypass any restrictions in place.
- ex. using a string terminator in an XSS payload:

```
POST /api/v1/user/profile/update
--snip--

{
"uname": "<s%00cript>alert(1);</s%00cript>"
"email": "hapi@hacker.com"
}
```

- Wordlists:
  - SecLists metacharacters list (Fuzzing directory)
  - Wfuzz bad characters list (Injections directory)
  - Beware of getting banned by using these lists in a well defended environment.
  - In a sensitive environment try testing out metacharacters slowly across different burner accounts.
    - Instead of burning one after another, spread out attacks between multiple burners to try and stay under any malicious request count implemented by the defence mechanisms.

**Case Switching**

- This is a long shot, but if the security controls are very dumb, you may be able to sneak payloads past them just by switching the case of the payload.
  `<sCriPt>alert('supervuln')</scrIpT>`
  - If you try this, try to also avoid a pattern in the case switching.

**Encoding Payloads**

- Encoded payloads can often trick WAFs while still being processed by the target application or database.
- If a WAF or input validation rule blocks certain characters or strings, it might miss encoded version of those characters and strings.
- Burp Suites Decoder module is perfect for quickly encoding and decoding payloads.
- URL encoding has the best chance of being interpreted by the target app, but HTML or base64 could often work as well.
- When encoding focus on characters that are often blocked:
  - < > ( ) [ ] { } : ' / \ |
- Try encoding parts of the payload as well as the whole payload.
- Try double encoding the payload.
  - This works if the input validations performs a single decoding process and then the backend services of the application perform a second round of decoding.

**Automating Evasion with Burp Suite**

- Once you've discovered a successful method o bypassing a WAF, it's time to leverage the functionality built into your fuzzing tools to automate your evasive attacks.
- In Burps Intruder Payloads window there is an option called Payload Processing that allows you to add rules that Burp will apply to each payload before it is sent.
  - This feature allows you to add rules to the payload such as a prefix, a suffix, encoding, hashing, and custom input, as well ass a match and replace for various characters.
- ex. If you discover that you can bypass a WAF by adding a null byte before and after a URL-encoded payload, you could either edit the wordlist to match these requirements or add processing rules.
  - Burp Suite applies the payload-processing rules from top to bottom, so if we don't want the null bytes to be encoded, we'll need to first encode the payload and then add the null bytes.
  - The first rule will be to URL-encode all characters in the payload.
    - Select the Encode rule type, select the URL-Encode All Characters option, then click OK to add the rule.
  - The second rule will be to add the null byte before the payload.
    - Select the Add Prefix rule and setting the prefix to %00.
  - The last rule will be to add the null byte after the payload.
    - Select the Add Suffix rule and set the suffix to %00.
  - To test the payload processing, launch an attack and review the request payloads.
  - Check the Payload column of your attack to make sure the payloads have been processed properly.

**Automating Evasion with Wfuzz**

- Wfuzz has some great capabilities for payload processing.
  - Find the payload-processing documentation under the Advanced Usage section at https://wfuzz.readthedocs.io
- If you want to encode a payload, you'll need to know the name of the encoder you want to use. You can view them with `wfuzz -e encoders`.
- To use an encoder, add a comma to the payload and specify its name:
  `wfuzz -z file,wordlist/api/common.txt,base64 http://<target>/FUZZ`
  - The above will base64-encode every payload before sending the request.
- You can also use multiple encoders.
  - To have a payload processed by multiple encoders in separate requests, specify them with a hyphen:
    `wfuzz -z file,/path/to/common.txt,base64-md5-none https://<target>/FUZZ`
- If you want each payload to be processed by multiple encoders, separate the encoders with an @ sign:
  `wfuzz -z list,aaaaa-bbbbb-ccccc,base64@random_upper -u https://<target>/FUZZ`
  - This operates on the payloads in reverse order.
- Dive deeper into the topic of WAF bypassing by checking out [Awesome-WAF GitHub repo](https://github.com/0xInfection/Awesome-WAF).

### Testing Rate Limits

- To identify a rate limit, consult the API documentation and marketing materials for any relevant information.
- Rate limiting details are often public due to being a common avenue of monetization (pay more get more, etc).
- You can also check the API headers to let you know how many more requests you can make before you hit the limit:
  `x-rate-limit:`
  `x-rate-limit-remaining:`
- Sometimes you will have to hit the rate limit to know where it is, this will often result in a temporary block or ban.
  - You may receive new response codes like 429 Too Many Requests.
    - These may include a header like `Retry-After:` that indicates when you can submit more requests.
- Rate limiting only works if the API is provider is able to attribute requests to a single user (with IP address, request data, metadata, auth tokens, etc.).
- In API requests the authorization token is a primary means of identity, so if too many requests are sent from a token, it could be put on a naughty list and temporarily or permanently banned.
- You can test rate limiting in two ways:
  - Avoid being rate limited altogether.
  - Bypass the mechanism that is blocking you once you are rate limited.

**A note on Lax Rate Limits**

- Some rate limits may be so lax that you don't need to bypass them to conduct an attack.
- ex. If a rate limit is set to 15,000 requests per minute and you want to brute-force a password with a 150,000 wordlist, you could easily stay within the rate limit by taking 10 minutes to cycle through every wordlist entry.
- With Wfuzz, you can set a time delay between requests with the -s flag.

| Delay between requests<br>(seconds) | Approximate number of request sent |
| ----------------------------------- | ---------------------------------- |
| 0.01                                | 10 per second                      |
| 1                                   | 1 per second                       |
| 6                                   | 10 per minute                      |
| 60                                  | 1 per minute                       |

- Burps CE Intruder is throttle by design, so it's actually helpful in staying within a certain low rate limit restriction.
- If you're using Burp Pro, you can set up Intruder's Resource Pool to limit the rate at which requests are sent.
  - Burpsuite calculates in milliseconds:

| Delay Between requests<br>(milliseconds) | Approximate requests |
| ---------------------------------------- | -------------------- |
| 100                                      | 10 per second        |
| 1000                                     | 1 per minute         |
| 6000                                     | 10 per minute        |
| 60000                                    | 1 per minute         |

- If you manage to attack an API without exceeding its rate limits, your attack can server as a demonstration of the rate limiting's weakness.
- Determine whether consumers face any consequences for exceeding a rate limit.
  - If rate limiting has been misconfigured, there is a chance exceeding the limit causes no consequences.
  - If this is the case, you've identified a vulnerability.

#### Path Bypass

- One of the simplest ways to get around a rate limit is to slightly alter the URL path.
  - Use case switching or string terminators in your requests.
- ex. POST request:

```
POST /api/myprofile
--snip--
{uid=§0001§}
```

- Based on the uid length, you'll need to send 10,000 requests to fully brute-force it.
- If you have 100 requests per minute of rate limit space, you could send the requests over an hour and 40 minutes, or else attempt a bypass.
- You could also attempt to bypass the rate limit by altering the URL path with string terminators or various upper- and lowercase letters:
  - `POST /api/myprofile%00`
  - `POST /api/myprofile%20`
  - `POST /api/myProfile`
  - `POST /api/MyProfile`
  - `POST /api/my-profile`
- Each of these has a chance to bypass the rate limit.
- You could also append meaningless parameters to the path to see if they work and bypass the rate limit:
  - `POST /api/myprofile?test=1`
  - If this works, simply add a new payload position for the meaningless parameter and use a list of numbers of the same lenght as the number of request you would like to send:
  ```
  POST /api/myprofile?test=§1§
  --snip--
  {uid=§0001§}
  ```
  - If you're using Burp Intruder for this attack, you could set the attack type to pitchfork and use the same value for both payload positions, generating the smallest number of requests required to brute-force the uid.

#### Origin Header Spoofing

- Some APIs Providers use headers to enforce rate limiting.
- These _origin_ request headers tell the web server where a request came from.
- If the client generates origin headers, we could manipulate them to evade rate limiting.
- Try including common origin headers in your requests:
  - `X-Forwarded-For`
  - `X-Forwarded-Host`
  - `X-Host`
  - `X-Originating-IP`
  - `X-Remote-IP`
  - `X-Client-IP`
  - `X-remote-Addr`
  - For values to use with these headers try:
  - Private IP addresses
  - Localhost IP address (127.0.0.1)
  - An IP address relevant to the target
    - If you've found IPs related to your target in recon, try them as values here.
- Try sending every possible origin header at once or including them in individual requests.
  - If you send every header at once, you may get a 431 Request Header Field Too Large status code.
  - Just send 1 fewer until it works.
- API defenders may also include the `User-Agent` header to attribute requests to a user.
  - `User-Agent` headers are meant to identify the client browser, browser versioning information, and client operating system.
  ```
  GET / HTTP/1.1
  Host: example.com
  User-Agent: Mozilla/5.0 (X11; Linux x86)64; rv:78.0) Gecji.20100101 Firefox/78.0
  ```
- Seclists includes "User-Agent" wordlists you can use to cycle through different values in your requests (seclists/Fuzzing/User-Agents).

#### Rotating IP Addresses in Burp Suite

- IP-based restrictions from a WAF can stop fuzzing dead in its tracks.

**IP Rotate**

- Rhino Security Labs released a Burp Suite extension and guide for performing an awesome evasion technique called IP Rotate.
- It is also available to Burp Suite CE.
- To use it, you'll need an AWS account in which you can create an IAM user.
- This tool allows you to proxy your traffic through the AWS API gateway, which will then cycle through IP addresses so that each request comes from a unique address.
  - This is next-level evasion, because you're not spoofing and information; instead, your requests are actually originating from different IP addresses across AWS zones.
  - There is a small cost to using the AWS API gateway.

**Installation**

- To install the extension, you'll need a tool called Boto3 as well as the Jython implementation of the Python programming language.
- To install Boto3 use the following pip3 command: `pip3 install boto3`
- Next, download the Jython standalone file from https://www.jython.org/download.html.
- Once you've downloaded the file, go to the Burpsuite extender options and specify the Jython standalone file under Python Environment.
- Navigate to the Burp Suite Extender's BApp Store and search for IP Rotate. You should now be able to click the Install button.
- Login to your AWS management account, and navigate to the IAM service page.
- After loading the IAM Services page, click Add Users and create a user account with programmatic access selected, then proceed to the next page.
- On the Set Permissions page, select Attach Existing Policies Directly.
- Filter policies by searching for "API."
- Select the AmazonAPIGateway Administrator and AmazonAPIGatewayInvokeFullAccess permissions.
- Proceed to the review page.
- No tags are necessary, so you can skip ahead and create the user.
- Now you can download the CSV file containing your user's access key and secret access key.
- Once you have the two keys, open Burp Suite and Navigate to the IP rotate module.
- Copy and paste your access key and secret key into the relevant fields.
- Click the Save Keys button.
- When you're ready to use IP Rotate, update the target host field to your target API and click Enable.
  - You do not need to enter in the protocol (HTTP or HTTPS) in the target host field.
  - Use the Target Protocol button to specify either HTTP or HTTPS.
- To test it, specify ipchicken.com as your target. While proxying a request to ipchicken.com and see your rotating IP displayed with every refreshed request.
- You can now bypass all IP-based security controls.

## Chapter 14: Attacking GraphQL

"This chapter will guide you through the process of attacking the Damn Vulnerable GraphQL Application (DVGA) using the API hacking techniques we've covered so far. We'll begin with active reconnaissance, transition to API analysis, and conclude by attempting various attacks against the application."

- There are some major differences between the RESTful APIs and GraphQL.

### GraphQL Requests and IDEs

- GraphQL more closely resembles SQL than REST APIs.
- Because GraphQL is a query language, using it is really just querying a database with more steps.
- ex: GraphQL request.

```
POST /v1/graphql
--snip--
query products (price: "10.00") {
    name
price
}
```

- ex: GraphQl response.

```
200 ok
{
"data": {
"products": [
{
"products_name": "Seat",
"price": "10.00",
"products_name": "Wheel",
"price": "10.00"
}]}}
```

- Unlike REST APIs, GraphQL APIs don't use a variety of endpoints to represent where resources are located.
  - All requests use POST and get sent to a single endpoint.
  - The request body will contain the query and mutation, along with the requested types.
- The GraphQL _schema_ is the shape in which the data is organized.
  - The schema consists of types and fields.
  - Types (query, mutation, subscription) are the basic methods consumers can use to interact with GraphQL.
- REST APIs use the HTTP request methods GET, POST, PUT, DELETE, to implement CRUD (Create, Read, Update, Delete) functionality.
- GraphQL uses query (read) and mutation (create, update, delete).
  - Subscription is essentially a connection made to the GraphQL server that allows the consumer to receive real-time updates.
  - We won't be using this.
- You can build a request in GraphQL to perform both a query and a mutation, allowing you to read and write in a single request.
- _Queries_ begin with an object type.
  - In the above example the object type is _products_.
  - Object types contain one or more fields providing data about the object - such as name and price in our example.
  - Queries can also contain arguments within parentheses - these help narrow down the fields you're looking for.
    - The argument in the example request is `(price: "10.00")` and indicates that the consumer only wants products that have a price of "10.00".
- Many GraphQL APIs will respond to all requests with an HTTP 200 response, regardless of whether the query was successful.
  - The error message for unsuccessful requests, depending on how the API is set up, will be in the body of the 200 OK response.
- In REST APIs, you will get an error response code when a request is not successful.
- GraphQL providers commonly make an integrated development environment (IDE) available over their web application.
- A GraphQL IDE is a graphical interface that can be used to interact with the API.
- GraphQL IDEs:
  - GraphiQL
  - GraphQL Playground
  - Altair Client
- These IDEs consist of a window to craft queries, a window to submit requests, a window for responses, and a way to reference the GraphQl documentation.

### Active Reconnaissance

#### Scanning

- Start with Nmap:
  `sudo nmap -sC -sV <target>`
- You can follow up with additional Nmap scans like an all port scan, stealth scan, etc. depending on the results.

- Perform a web application vuln scan using Nikto specifying any ports you suspect of running GraphQL:
  `nikto -h <target>:<port>`

- Nikto can tell you things like whether the application has some security misconfigurations.
  - Missing `X-Frame-Options`
  - Undefined `X-XSS-Protection` headers
  - What request methods are allowed
  - Etc.

#### View the Application in a Browser

- Use the site how any other user would by clicking the links located on the web pages.
- Explore the Private Pastes and Public Pastes
  - Create Paste
  - Import Paste
  - Upload Paste Links.
- Look for:
  - usernames
  - forum posts that include IP addresses and `user-agent` info
  - links for uploading files
  - links for creating forum posts
  - registration links
  - password resets
  - etc.

#### Using DevTools

- Navigate to the home page and open the Network module in DevTools
  - Refresh the Network module by pressing CTRL+R
  - Look through the response headers of the primary source.
  - Look for responses that indicate whether the app is using GraphQL.
  - ex. `Set-Cookie: env=graphiql:disable`
- In your browser navigate to any other interesting pages like "Public Pastes" and open the Network module again.
  - If you find any source files that are called anything resembling `graphql`, select the source file and hit the Preview tab.
- GraphQL like REST uses JSON as the syntax for transferring data.

### Reverse Engineering the GraphQL API

- Once you know the target app uses GraphQL, try to determine the API's endpoint and requests.
  - Remember, GraphQL has one endpoint to rule them all, unlike REST APIs that use multiple endpoints for different resources.
- Find the GraphQL endpoint and figure out what you can query for.

#### Directory Brute-Forcing for the GraphQL Endpoint

- You can scan the application using Gobuster or Kiterunner to brute-force where any GraphQL-related directories are.
- You could try doing this manually with some typical request paths:
  - `/graphql`
  - `/v1/graphql`
  - `/api/graphql`
  - `/v1/api/graphql`
  - `/graph`
  - `/v1/graph`
  - `/graphiql`
  - `/v1/graph`
  - `/graphiql`
  - `/console`
  - `/query`
  - `/graphql/console`
  - `/altair`
  - `/playground`
- Remember to replace the version numbers in any of these paths with:
  - `v2`
  - `v3`
  - `v4`
  - `/test`
  - `/internal`
  - `/mobile`
  - `/legacy`
  - etc.
- ex. Brute-Forcing with kiterunner using seclists graphql.txt
  `kr brute http://<target>:<port> -w /path/to/seclists/Discover/Web-Content/graphql.txt`
  - Once you've found some potential GraphQL endpoints, visit them in your browser.
- If you've found a GraphiQL web IDE endpoints, the API documentation is normally located on the top right of the page.
  - If this is the case, you can click the Docs button and you should see the Documentation Explorer window.
  - If you're not authorized, you will need to find a way to get authorized to view the documentation or make requests.

#### Cookie Tampering to Enable the GraphiQL IDE

- Capture a request to to the `/graphiql` endpoint (or whatever endpoint you've found), using Burp to see what you're working with.
- ex. DVGA request to `/graphiql`

```
GET /graphiql HTTP/1.1
Host: <Host IP/Domain>:<port>
--snip--
Cookie: language=en; welcomebanner_status=dismiss; continueCode=KQabVVENkBvjq9O2xgyoWrXb45wGnmTxdaL8m1pzY1PQKJMZ6D37neRqyn3x; cookieconsent_status=dismiss; session=eyJkaWZmaWN1bHR5IjoiZWFzeSj9.YWOfOA.NYaXtJpmkjyt-RazPrLj5GKg-Os; env=z3JhcGhpcWw6ZglzYWJsZQ==
Upgrade-Insecure-Requests: 1
Cache-Control: max-age=0.
```

- You should notice that the `env=` variable is base64 encoded. You can guess this by the == at the end of the string
  - If you decode it using Burp Decoder or any other decoder, you'll see it is `graphiql:disable`, which is the same value we saw in the `Set-Cookie:` field of our inspection of the website with DevTools.
- The obvious next step is to change the value to enable, re-encode it to base64, then resend the request with repeater to check the response.
- To use the GraphiQL IDE go back to the Network tab in DevTools on the GraphiQL endpoint and update the cookie to the newly encoded one.
- The page should now load without errors and you can check out the Documentation Explorer.

#### Reverse Engineering the GraphQL Requests

- At this point, we know the endpoints we want to target, but we don't know the structure of the API's requests.
- Start by intercepting requests in Postman to better manipulate them.
  - Set your browser proxy settings to Postman, then make sure capture requests is turned on in Postman.
  - Set Save Requests to `Collection: DVGA GraphQL` or whatever collection name makes sense for your project.
  - You can now capture requests by manually navigating the web site.
- Once you've thoroughly used the web app, go back to Postman and check out the collection you've been saving requests to.
  - Delete any that don't include the endpoints you're mapping out (ex. `/graphiql`, or `/graphql`).
- Because GraphQL requests function solely using the data in the body of the POST request, rather than the request's endpoint, you'll have to review the body of the request to get an idea of what the requests are doing.
- Go through each request and rename them so you can better refer to what they do.
- Some of the request bodies may seem intimidating; if so, extract a few key details from them and give them a temporary name until you understand them better.
  - ex. request:
  ```
  POST http://192.168.195.132:5000/graphiql?
  {"query":"\n  query IntrospectionQuery {\n  __schema {\n    queryType{ name }\n mutationType { name }\n     SubscriptionType { name }\n
  --snip--
  ```
  - This is hard to read, but we can pick out a few details:
  - The request is to GraphiQL (`/graphiql?`)
  - The query is `IntrospectionQuery`
  - The queryType is `mutationType` and `SubscriptionType`
  - So we could name it something like "GraphiQL IntrospectionQuery - mutationType SubscriptionType" until we know more.
  - Continue to go through the requests, and as you see differences between requests make sure to capture them in your re-naming.

#### Reverse Engineering a GraphQL Collection Using Introspection

- Introspection is a feature of GraphQL that reveals the API's entire schema to the consumer, making it a gold mine when it comes to information disclosure.
- For this reason, you'll often find Introspection disabled and wil have to work a lot harder to attack the API.
- If you can query the schema, you'll be able to operate as though you've found a collection or specification file for a REST API.
- Testing for Introspection is as easy as sending an introspection query.
- Since we set the cookie to enable us to access the DVGA GraphiQL interface, we can capture the introspection query by intercepting the requests made when loading `/graphiql`, becuase the GraphiQL interface sends an introspection query when populating the Documentation Explorer.
- The full introspection query is quit large. You can check it out by intercepting the request yourself or check it out on Hacking APIs Github repo at https://github.com/hAPI-hacker/Hacking-APIs.
- ex. Partial introspection query:

```
query IntrospectionQuery {
  __schema {
    queryType { name }
    mutationType { name }
    subscriptionType { name }
    types {
      ...FullType
    }
    directives {
      name
      description
      locations
      args {
        ...InputValue
      }
    }
  }
}
```

- A successful GraphQL introspection query will provide you with all the types and fields contained within the schema.
- You can use the schema to build a Postman Collection.
- If you're using GraphiQL, the query will populate the GraphiQL Documentation Explorer.
  - The GraphiQL Documentation Explorer is a tool for seeing the types, fields, and arguments available in the GraphQL documentation.

### GraphQL API Analysis

#### Crafting Requests Using the GraphiQL Documentation Explorer

- Take one of the requests we reverse engineered from Postman, such as the request for Public Pastes used to generate the _public_pastes_ web page, and test it out using the GraphiQL IDE.
- Use the Documentation Explorer to help you build your query.
- Under Root Types, select Query.
- Using the GraphiQL query panel, enter `query` followed by curly brackets to initiate the GraphQL request.
- Not query for the public pastes field by adding `pastes` under `query` and using parentheses for the argument `public: true`.
- Since we'll want to know more about the public pastes object, we'll need to add fields to the query.
- Each field we add to the request will tell us more about the object.
- To do this, select PasteObject in the Documentation Explorer to view these fields.
- Finally, add the fields that you would like to include in your request body, separated by new lines.
- The fields you include represent the different data objects you should receive back from the provider.
- You could add `title`, `content`, `public`, `ipAddr`, and `pId`, or feel free to experiment with your own fields.
  - ex.
  ```
  query {
  pastes (public: true) {
    title
      content
      public
      ipAddr
      pId
    }
  }
  ```
  - Send the request by using the Execute Query button or the shortcut CTRL+Enter.
  - If you've followed along with the DVGA so far, it should return:

```
  {
    "data": {
      "pastes": [
        {
          "id": "UGFzdGVPYmp1Y3Q6MTY4"
          "content": "testy",
          "ipAddr": "192.168.195.133",
          "pId": "166"
        },
        {
          "id": "UGFzdGVPYmp1Y3Q6MTY3",
          "content": "McTester",
          "ipAddr": "192.168.195.133",
          "pID": "165"
        }
      }
    }
```

#### Using the InQL Burp Extension

- If you can't find a GraphiQL IDE to work with on your target, the Burp extension InQL can help.
- InQL acts as an interface to GraphQL within Burp Suite.

**Installation**

- You'll need Jython installed and to select Jython in the Extender options (Chapter 13 for the Jython installation steps).
- Install InQL from the BApps Store.
- Once installed, select the InQL Scanner and add the URL of the GraphQL API you're testing.

- The scanner will automatically find various queries and mutations and save them to a file structure.
- You can then select these saved requests and send them to Repeater for additional testing.

- If you're still following along with DVGA, you'll see `paste.query` query that is used to find pastes by their paste ID (pID).
- If you posted any public pastes in the web application, you can see your pID values. What if we used an authorization attack against the pID field by requesting pIDs that were meant to be private?

  - This would constitute a BOLA attack.
  - Since the paste IDs seem to be sequential, we'll want to test for any authorization restrictions preventing us from accessing the private posts of other users.
  - Right click `paste.query` and send it to Repeater.
  - Edit the `code*` value by replacing it with a pID that should work.
  - ex. pID 166
  - Send the request with repeater and you should receive:

  ```
  HTTP/1.0 200 OK
  Content-Type: application/json
  Content-Length: 319
  Vary: Cookie
  Server: Werkzeug/1.0.1 Python/3.7.10

  {
    "data": {
      "paste": {
        "owner": {
          "id": "T3duZXJPYmp1Y3Q6MQ=="
        },
        "burn": false,
        "Owner": {
          "id": "T3duZXJPYmp1Y3Q6MQ=="
        },
        "userAgent": "Mozilla/5.0 (X11, Linux x86_64; rv:78.0) Firefox/78.0",
        "pId": "166",
        "title": "test3",
        "ownerId": 1,
        "content": "testy",
        "ipAddr": "192.168.195.133",
        "public": true,
        "id": "UGFzdGVPYmp1Y3Q6MTY2"
      }
    }
  }
  ```

  - This is a public paste the author previously submitted, if you haven't submitted anything, this may not work.

- If we're able to request pastes by pID, maybe we can brute-force the other pIDs to see if there are authorization requirements that prevent us from requesting private pastes.
- Send the previous request to Intruder and then set the pID value to be the payload position.
- Change the payload to a number value starting at 0 and going to 166, then start the attack.
- You should have successfully found a BOLA vulnerability.
- We can confirm that we've found private info because `"public": false`:

```
{
  "data": {
    "paste": {
      "owner": {
        "id": "T3duZXJPYmp1Y3Q6MQ=="
      },
      "burn": false,
      "Owner": {
        "id": "T3duZXJPYmp1Y3Q6MQ=="
      },
      "userAgent": "Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Firefox/78.0",
      "pId": "63",
      "title": "Imported Paste from URL - b9ae5f",
      "ownerId": 1,
      "content": "<!DOCTYPE html>\n<html lang=en ",
      "ipAddr": "192.168.195.133",
      "public": false,
      "id": "UGFzdGVPYmp1Y3Q6NjM="
    }
  }
}
```

- With this we're able to retrieve every private paste by requesting different pIDs.

### Fuzzing for Command Injection

- Now that we've analyzed the API, let's fuzz it for vulnerabilities to see if we can conduct an attack.
- Fuzzing GraphQL can pose an additional challenge, as most requests result in a 200 status code, even if they were formatted incorrectly.
- You'll find any errors in the body, and you'll need to build a baseline for what these look like by reviewing the responses.
  - Check whether errors all generate the same response length, for example, or if there are other significant differences between a successful response and a failed one.
  - Review error responses for information disclosures that can aid the attack.
- Since query type is read-only, we'll attack the mutation request types.
- First, let's take one of the mutation requests, such as the `Mutation ImportPaste` request in the DVGA collection we've created and intercept it with Burp.
- Send this request to Repeater to see the sort of response we should expect to see:

```
HTTP/1.0 200 OK
Content-Type: application/json

{"data":{"importPaste":{
"result":"<HTML><HEAD><meta http-equiv=\"content-type\"content=\"text/html;charset=utf-8\">\n<TITLE>301 Moved</TITLE></HEAD><BODY>\n<H1>\nThe document has moved\n<AHREF=\"http://www.google.com/\">here</A>.\n</BODY></HTML>\n"}}}
```

- The author tested the request by using *http://www.google.com/* as his URL for importing pastes; you can use a different URL in the request.
- Forward the request to Intruder and take a look at the body of the request:

```
{"query":"mutation ImportPaste ($host: String!, $port: Int!, $path: String!, $scheme: String!)
{\n         importPaste(host: $host, port: $port, path: $path, scheme: $scheme) {\n
result\n      }\n     }", "variable":{"host":"google.com","port":80,"path":"/","scheme":"http"}}
```

- Notice that this request contains variables, each of which is preceded by $ and followed by !.
- The corresponding keys and values are at the bottom of the request, following `"variables"`.
- You can place payload positions here, because these values contain user input that could be passed to backend processes, making them an ideal target for fuzzing.
- If any of these variables lack good input validation controls, we'll be able to detect a vulnerability and potentially exploit the weakness.
- Ex. Payload positions:
  `"variable":{"host":"google.com§test§§test2§","port":80,"path":"/","scheme":"http"}}`
- With the two payload positions set, use a list of metacharacters like these:
  |
  ||
  &
  &&
  '
  "
  ;
  '"
- For the second payload position set some potential injection payloads:
  whoami
  {"$where": "sleep(1000) "}
  ;%00
  \-- -
- Make sure payload encoding is disabled and run the attack against the host variable.
- Review the responses to see what they consisted of.
- Next, run the attack against a different variable like "path":
  `"variables":{host":"google.com","port":80,"path":"/§test§§test2§","scheme":"http"}}`
- Use the same payloads as the first attack and run that bad boy.
- This time the responses vary in response codes and lengths and there are indicators of a successful code execution.
- Digging through the responses, you can see that serveral of them were suceptible to the `whoami` command.
  - This suggests that the "path" variable is culnerable to operating system injection.
  - In addition, the user that is returned is the `root` user, which indicates that the system is running linux. BINGO!
  - You could run another attack with the command as `uname -a` and `ver` to see which operating system you are interacting with.
- Once you'd discovered what kind of operating system you're interacting with, you can perform more targeted attacks to obtain sensitive information from the system.
- This would be a very easy full compromise by sending a reverse shell payload to the vulnerable `"path":` variable. If this attack succeeds, you would have full control over their system.

## Resources:

### Chapter 3: Common API Vulnerabilities

- [Why APIs Are Your Biggest Security Risk](https://apisec.ai/blog/why-apis-are-your-biggest-security-risk)
- [OWASP API Security Project](https://owasp.org/www-project-api-security)
- [OWASP API Security Top 10](https://apisecurity.io/encyclopedia/content/owasp/owasp-api-security-top-10)
- [Introduction to API Security Landscape](https://lp.traceable.ai/webinars/html?commid=47702)

### Chapter 4: Your API Hacking System

- ["Introduction" Postman Learning Center](https://learning.postman.com/docs/getting-started/introduction)
- [Web Security Academy - PortSwigger](https://portswigger.net/web-security)

### Chapter 5: Setting Up Vulnerable API Targets

- [Web Application Pentest Lab Setup on AWS](https://www.hackingarticle.in/web-application-pentest-lab-on-aws)
- [Tutorial: Setting Up a Virtual Pentesting Lab at Home](https://cybrary.it/blog/0p3n/tutorial-for-setting-up-a-virtual-penetration-testing-lab-at-your-home)
- [OccupyTheWeb "How to Create a Virtual Hacking Lab"](https://null-byte.wonderhowto.com/how-to/how-to-back-like-pro-create-virtual-hacking-lab-0157333)
- [Webcast: How to Build a Home Lab](https://www.blackhillsinfosec.com/webcast-how-to-build-a-home-lab)

### Chapter 6: Discovery

- [API Directory](https://programmableweb.com/apis/directory)
- [API Discovery: 15 Ways to Find APIs](https://nordicapis.com/api-discovery-15-ways-to-find-apis)
- [Welcome to the RapidAPI Hub](https://rapidapi/hub)

### Chapter 7: Endpoint Analysis

- [5 Examples of Excellent API Documentation (and Why We Think So)](https://nordicapis/5-examples-of-excellent-api-documentation)
- [AP13: 2019 Excessive Data Exposure](https://salt.security/blog/api3-2019-excessive-data-exposure)
- [How to Use an API: Just the Basics](https://technologyadvice/blog/information-technology/how-to-use-an-api)

### Chapter 8: Attacking Authentication

- [Hacking JWT Tokens: SQLi in JWT](https://blog.pentesteracademy.com/hacking-jwt-tokens-sqli-in-jwt-7fec22adbf7d)
- [API Security Testing: How to Hack an API and Get Away with It](https://smartbear.com/blog/api-security-testing-how-to-hack-an-api-part-1)

### Chapter 9: Fuzzing

- [OWASP "Fuzzing"](https://owasp.org/www-community/Fuzzing)

### Chapter 10: Exploiting Authorization

- [A Deep Dive on the Most Critical API Vulnerability -- BOLA (Broken Object Level Authorization)](https://inonst.medium.com)

### Chapter 11: Mass Assignment

- [Mass Assignment Cheat Sheet - OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Mass_Assignment_Cheat_Sheet.html)

### Chapter 12: Injection

- [NoSQL Injection Cheatsheet](https://nullsweep.com/nosql-injection-cheatsheet)
- [SQL Injection - PortSwigger](https://portswigger.net/web-security/sql-injection)
- [XAS: Cross-API Scripting Attacks in Social Ecosystems](https://doi.org/10.1007/s11432-014-5145-1)

### Chapter 13: Applying Evasive Techniques and Rate Limit Testing

- [How to Bypass WAD HackenProof Cheat Sheet](https://hacken.io/researches-and-investigations/how-to-bypass-waf-hackenproof-cheat-sheet)
- [Everything You Need to Know About API Rate Limiting](https://nordicapis.com/everything-you-need-to-know-about-api-rate-limiting)

### 14: Attacking GraphQL

- [How to Exploit GraphQL Endpoints: Introspection, Query, Mutations & Tools](https://blog.yeswehack.com/yeswerhackers/how-exploit-graphql-endpoint-bug-bounty)
- [Exploiting GraphGL](https://blog.assetnote.io/2021/08/29/exploiting-graphql)
- [That Single GraphQL Issue That You Keep Missing](https://blog.doyensec.com/2021/05/20/graphql-csrf.html)

The End.
