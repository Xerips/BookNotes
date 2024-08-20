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
