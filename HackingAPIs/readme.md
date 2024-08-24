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
-
