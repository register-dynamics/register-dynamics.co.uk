---
title: Evidence for the National Data Strategy
authors:
- Andy Bennett
- Simon Worthington
excerpt: |
  Register Dynamics made a submission to the National Data Strategy open call for evidence, in which we discuss the difficulties with data that Government faces which could be fixed with a better approach to data infrastructure.
image: "national-data-strategy-call-for-evidence.jpg"
---
### Introduction

This submission to the [National Data Strategy open call for evidence](https://www.gov.uk/government/publications/national-data-strategy-open-call-for-evidence/national-data-strategy-open-call-for-evidence) is by Andrew Bennett and Simon Worthington, on behalf of Register Dynamics Limited, a data consultancy working with public sector organisations.

Register Dynamics is a consultancy that currently provides data strategy consulting and data products to Government through the Digital Marketplace and PSR frameworks. In this capacity, we have worked directly and indirectly with central Government departments during those engagements. Andrew Bennett and Simon Worthington have no other personal interests to declare.

We are making this submission because we have had the privilege of working with central government on a number of projects focused particularly in the domain of data infrastructure.

We are happy to be contacted further about the evidence presented in this submission. Please contact us initially [by e-mail](mailto:hello@register-dynamics.co.uk).

We are answering a subset of [the questions](https://www.gov.uk/government/publications/national-data-strategy-open-call-for-evidence/national-data-strategy-open-call-for-evidence#questions) as set out in each heading below.

### 1.1. How can organisations (private, public or third sector) demonstrate trustworthiness in their use of data?

In a [2019 report on data trusts](/data-trusts) in partnership with the Open Data Institute, we examined the role of external audit in building reputation and improving trust in organisations that use data. We showed that by making possible external and independent audit of data use, organisations could demonstrate trustworthiness through being vouched for by a qualified auditor.

Doing audit of data use in an efficient manner is currently challenging, but can be made possible by using audit technology and verifiable data to record purpose at point of use. We presented case studies from organisations that are already doing this with Government, including Deepmind Health and their link with NHS and the ONS and UK Data Service’s 5 Safes framework. Our conclusion is that whilst best practice around verifiable data is still emerging, it is already being applied usefully and can allow organisations to demonstrate trustworthiness when paired with an independent, recognised auditor.

Government already has access to this technology through the GOV.UK Registers product. The Registers technology is able to make transparent changes to data and build trust that a Government process is acting properly. So far, Government is yet to reap the full reward of this or to apply the same technology elsewhere.

### 1.3. Are organisations (private, public or third sector) using personal data in ways that may damage trust?

Part of building trust is about having a way to definitively prove good standing. Almost all personal data processing today is conducted behind closed doors because of the sensitive nature of the data itself. Whilst this keeps that data secure, when coupled with the occasional news article about how a company has been caught using personal data inappropriately, it makes it very difficult for the general public to build trust in organisations.

Our experience on the [Personal Data Exchange project](https://alphagov.github.io/paused/projects/attributes.html) at the Government Digital Service has lead us to believe that organisations that share data also find it difficult to trust those that they share it with. The symptom of this is high information assurance requirements and onerous processes to get access to relatively small amounts of data. Furthermore, these processes and requirements do little to help build trust for the future because there is frequently no way of demonstrating compliance.

When data is shared with commercial organisations the trust problems are exacerbated because these organisations are strongly incentivised to extract as much value as possible from the assets that they control. Particularly when a data sharing agreement requires them to refrain from using data in a certain way that would be of commercial value to their core business practice, but there is no technical means to verify compliance, it becomes very difficult for data subjects to trust that their data is being used appropriately. Such an example might be a credit reference agency using the context around data shared with it for address verification to refine their view of an individual, which is their core business – such a practice would be against the terms of the share, but they are highly incentivised to do so.

### 1.9. How far do existing protections, such as in the Data Protection Act, go in promoting transparency and trust? What, if anything, should the government do to further build trust?

There are [many examples](https://epic.org/algorithmic-transparency/crim-justice/) of unproven processes or algorithms being applied for automated or assisted decision-making leading to a tangible harm to members of the public. The lack of transparency around automated decision-making is eroding public trust in governments. This is of particular concern if Government wishes to make further use of AI to process personal data.

GDPR (and by extension the 2018 DPA) is supposed to include provision for a “right to explanation”, which in certain circumstances guarantees a data subject an answer as to how a decision about them was made. This implementation of this right in GDPR has faced much criticism and is [generally accepted as being insufficient](https://ssrn.com/abstract=2972855). Certainly, there has not been a significant provision of this by Government services.

What is required to improve transparency and trust is a commitment by Government and its suppliers to providing open algorithms in cases where decisions are made about citizens by opening the logic that allows those decisions to be reproducible. This would provide the building blocks for letting citizens understand how data about them has been applied to make a decision about them. It would also make cyber threats and associated fraud much easier to discover and undo.

We explored one such model as part of Personal Data Exchange project and describe how to apply it in [our report](/data-trusts/aquae-model.html).

### 2.1. Are people aware of how to manage personal data about them? Do they know about tools to control access?

As part of our research on Personal Data Exchange we discovered that the vast majority of people want to transact with government for something that they need but they have no interest or desire to maintain an account or set up preferences. In particular, most users found the idea of a “personal data dashboard” that was separate from services to be confusing and were not sure how they would discover such a thing or know how to use it.

At the same time, we found that users do want their personal data to be controlled and they want to be able to decide how it is used on a case-by-case basis at the point of use. For example, when applying for a Blue Badge Disabled Parking Permit, they want to be able to control whether their eligibility criteria is sought from their benefit status at DWP or their medical status within the NHS. Users had well formed ideas about which government departments they wanted to create links between and which they did not. These views were often based on the user’s own internal model of how Government worked and the relationship that they had with each department.

UMA (User Managed Access) was often touted as a solution to the problem of allowing the user to give permission for a data share to occur. We evaluated this technology and found that it does not fit the needs of Government well. This is because it is designed for the exchange of small bits of application data (e.g. the list of files in a Dropbox) between services and companies on the Internet. The data models in Government that we looked at were almost exclusively personal data centric rather than application data centric.

Furthermore, the data models in Government are bespoke to the departments that make them. If the data is moved around, it is often difficult for the receiving party to use it effectively in a service. For example, HMRC have a specific view on earnings data and translating that into simple numbers such as someone’s earnings per week is a complex task that requires a detailed understanding of the HMRC policies involved.

We recommend that users should be a first class party in the transaction when a service provider wants to use data about them that is stored at a data authority but this should not come with the burden of having to manage and run software or apps that controls their data for them. In particular, “Personal Data Stores” represent the [worst of all possible worlds](https://medium.com/@shevski/are-personal-data-stores-about-to-become-the-next-big-thing-b767295ed842): the user must actively manage their data outside of transactional services and the data is stored away from the creating authority who is in the best position to interpret it for use by a service.

### 3.3. Are there interventions that government should be making to remove barriers to participation for businesses and non-profit organisations? What kinds of interventions should be made? Do these differ by sector?

There are a number of key datasets forming part of our national data infrastructure whose licensing restrictions currently inhibit innovation. Removing the licensing restrictions on these datasets and making them open data would position the UK as an attractive environment for innovation in certain domains.

As an example, opening up the AddressBase product offered by Ordnance Survey has the opportunity to stimulate innovation in sectors such as autonomous vehicles and drone deliveries, and would put the UK at the top of the list of countries in which it would be easy to research and develop in this space.

The reason most frequently cited for levying fees to access this data is reimbursement for the costs incurred in their provision and maintenance. The National Data Strategy should push the view of these datasets as key public assets – as with other infrastructure, investment by Government would bring positive economic benefit, orders of magnitude more valuable than the status-quo.

### 4.2. What are the barriers to the potential productivity gains from more effective data use?

Unstructured data is cheap to publish but expensive to reuse. Because of this, there is a plethora of it available. Each user privately cleans it and loads it into their system each time they want to use it. This activity is expensive, error-prone and must be repeated each time the data needs to be updated. On the other hand, structured data such as the GOV.UK Registers project produces clean and easy to reuse data that has had a lot of attention from data experts up-front. This means that it is cheap and easy to reuse but more expensive to produce and publish in the first place. Therefore, it is often difficult to fund a Register unless it is clear that the data already has a wide set of use cases waiting for it to appear.

The Registers model is ultimately the model that produces the most productivity gains and leads to the most effective use of that data. It is also the model where it is easier to correct mistakes and ensure the data is genuinely clean and free of errors. This is because those activities are performed by the people that understand it the best and are aware of the limitations: the producers and publishers of the data.

We recently undertook a piece of work at the Government Digital Service to [try to improve the interoperability of data across Government](https://dataingovernment.blog.gov.uk/2019/06/10/improving-how-we-manage-spreadsheet-data/). This work recognised that the vast majority of Government data lives in spreadsheets. The biggest barrier we found to using spreadsheets is that they [don’t scale beyond their original use case](https://registers.blog/solving-conundrums-of-spreadsheets-at-scale) and when the data is passed to another team or reused, a lot of time is spent manually re-keying it into new spreadsheets or data systems.

Attitudes to spreadsheets, especially from technical or digital people, tend to be unkind and there is often a desire to eradicate them without first understanding why they exist and why they keep popping up in new projects. We believe that embracing the spreadsheet and the reasons people have for using them will help spreadsheet users be more productive and ensure more effective use of the data within them.

Technical efforts to standardise tend to focus on file formats such as CSV rather than on the data contained within. Users find it hard to apply these standards because they often do not have a choice of file format due to business requirements or particular constraints of the software that they are working with.

Our research has convinced us that effort spent on understanding and describing the actual data items that move around Government would be far more effective at unlocking productivity gains and ensuring better use of data. For example, if a department is sending pricing data, how can the receiver tell if the numbers are inclusive or exclusive of VAT? What rate is the VAT at? Is there an agreed format for addresses, dates or the companies involved in the transactions?

### 4.3. Are there best practices in particular sectors that others can learn from?

There are a couple of examples that demonstrate that much of the best practice required to establish good data governance is based around providing the correct incentives.

In the financial sector, management of financial data is generally very strict and great pains are taken to prove that all aspects of financial management are proper. The incentives for a financial organisation to do proper management of data are strong: without this, the organisation risks severe economic and reputational penalty. Understanding of these risks at the highest level translate to meaningful resource lower down for managing them. The lesson learned is that strong incentives for organisations and a board-level understanding of these are required to develop a culture of good data management.

One department that has succeeded in implementing this is the Environment Agency, now part of DEFRA. A board-level understanding of the risks faced by poor data management translated into a commitment to improve. Leadership at all levels were to utilise the board’s commitment to supply resource to fix the agency’s data problems and develop an excellent culture around data. Over a number of years, the Environment Agency have become leaders in data expertise around Government. The contrast with other Government bodies who have not had the correct incentives in place to foster this culture is clear, with many bodies not having made much if any progress in that time.

We believe the Environment Agency represents best practice and that the National Data Strategy should be encouraging departments to understand these incentives and make similar commitments of resource to improving their data management practices.

### 4.9. Where appropriate, how might Government encourage businesses and non-profit organisations to share more data they hold, where it cannot be made open?

In their [recent work on data trusts](https://theodi.org/project/data-trusts/), the Open Data Institute discovered that there is a need for specific legal structures that can be used to form a data trust. A data trust allows organisations that would otherwise be unable to trust each other or who want to cooperate in some areas and compete in others, to share data for a specific purpose or outcome.

For example, it can help supermarkets and other FMCG (fast moving consumer goods) firms to track the impact that their supply chains have on the environment. Supply chain data is very commercially valuable and there would be huge incentives for foul-play if the data was shared between competitors using a regular agreement. A data trust allows them to hand over data for the benefit of the environment and community, whilst getting some guarantees that it won’t leak to their competitors.

Data trusts currently lack a legal basis that provides adequate structure around the models of cooperation required and the powers of trustees, and this is currently holding back data trusts and other cooperative models of data sharing that Government might otherwise like to encourage.

### 5.6. What can Government and the wider public sector do to improve its collection, sharing, analysis and storage of data?

In our work on [Personal Data Exchange](https://alphagov.github.io/paused/projects/attributes.html) for the Government Digital Service, we discovered that the biggest opportunities lie at the interfaces between departments. Most departments have large, bespoke data systems with their own lifecycles that are well managed but are expensive and difficult to change.

However, many are currently building or intending to build integrations with other departments. They are doing this bilaterally and without any guidance or coordination for the benefit of Government as a whole. They have to manage all the business and domain specific context that relates to their application whilst also finding time for all the engineering, plumbing and security that requires different expertise and could be shared amongst implementations. In a few years time, these systems will have been built and be difficult to change but right now there is an opportunity to standardise and reuse components and patterns.

The cost of data integrations such as these can be reduced significantly by applying patterns where rather than moving the data to where it is needed the processing is moved to where the data already resides. The result of the processing is often less sensitive than the original data and therefore the receiving system does not always have to be assured to the same high levels as the originating system. This pattern also reduces departmental fears that their data will be misused or processed incorrectly.

### 5.10. What are the main opportunities for improving outward facing public services through effective data use?

In our work on Personal Data Exchange for the Government Digital Service, we did research into the problems that public services face around making use of existing Government data about citizens and the benefits that could be realised by enabling this reuse.

We found that submission of evidence for the purpose of establishing eligibility for a service causes considerable pain to both citizens and services. Citizens have to understand the eligibility criteria and manually submit paper-based evidence. Services experience the poor process and quality of citizen evidence submission as significantly increased casework.

We found in the vast majority of cases, citizens are submitting evidence of a status that has been conferred on them by another Government department but which the service cannot access directly. Government departments are generally very risk averse to losing control of their data and so place high legal, technical and security barriers on services wishing to use it for a legitimate purpose.

The benefits of fixing this problem would translate into huge financial savings for Government through reductions in wasted case-worker time and resource required to implement data sharing. We calculated that if all of Government’s services were to transform in this way, the savings would run into 10s if not 100s of millions of pounds. There would also be benefits to the citizen experience of a significantly simplified application process for Government services regardless of online or offline channel. Our analysis also showed that solving this problem would account for the majority of improvement that could be made to outward facing public services.

The opportunity here is clear: significantly lower the barriers to setting up personal data sharing in a way which preserves privacy, transparency, citizen choice and safety, and even very small outward facing services and their users stand to gain by reusing data collected by other departments.

### 6.1. When should public authorities open up access to data they hold with other departments? When should they not?

Data that is neither personal or sensitive should always be available.

Specific personal data should be made available where there is a specific use case involving an application for a service made by the data subject. The legal basis for this should not rely on GDPR’s “consent” gateway but rather on some other legal gateway that has been established for the purpose. However, the data subject should always play an active role in the data share and it should only occur if the data subject agrees to it.

Sharing should never be done based on an identifier such as National Insurance Number or NHS Number, rather a full match on the data subject’s name, date of birth and postcode (possibly including both current and historical values) should be used.

If data is shared in this way to deliver a service, that mechanism should be available no matter how the user receives the service. I.e. if they apply digitally, via the phone, using a paper form or in person, the same technology should be used to access and process the data and the eligibility criteria should be evaluated in the same way.

There must be a public Register of what data is used and shared in this way. Specifics of how the data is processed and algorithms used should be part of the public Register.

The sharing of aggregate personal data should remain subject to the same policies and procedures as it is currently.

### 6.3. What issues are there around government increasing access to the data it holds between departments and other parts of the public sector? Does the use of Privacy Enhancing Technologies sufficiently counter any such risks?

We have found that issues from increasing access to data are generally motivated by a root fear that increased access will cause data to be used for a purpose that a department or wider society doesn’t consider appropriate or acceptable.

This data use either comes about via data loss or data misuse. Data loss represents risk from deliberate damage done by a cyber attacker or opportunist. Data misuse is the fear that data users will incorrectly apply complex data from departments that they don’t understand, and draw incorrect and damaging conclusions (an example of which we discuss in 2.1). Both fears are motivated by the need to protect citizens and worries of newspaper headlines and reputational risk.

We do not believe an assumption that Privacy Enhancing Technologies will make these risks disappear is sensible. Privacy Enhancing Technologies, whilst a small part of a solution, are not a framework or a process that can be followed, and therefore cannot be effectively applied by people who are not already domain experts in all of data, technology, cyber, risk and governance.

When Government recommends the use of such technologies, it must do so in the context of wider frameworks that apply them. Personal Data Exchange mentioned in previous answers is one such example which governs and manages the process of providing data about specific individuals to services who need to check eligibility requirements. Government will need to develop and advocate for similar frameworks for other use cases in order to fully counter the risks.

### 6.4. What kinds of problems do barriers to data sharing create for government departments and public sector organisations?

The GOV.UK Registers project identified a huge amount of duplication where civil servants curate their own lists of things that are required by legislation to be maintained as “registers” by people in other departments. Often these registers were not made publicly available or were not in formats that were reusable. Often people would draw information from Wikipedia before drawing from GOV.UK.

When civil servants create their own lists, time and energy is spent on duplicating work. As these civil servants are often not experts in the subject of the list they have no way to assure the quality of what they produce. They have no way to know when the list needs updating and when it does get out of date they have no way of knowing what changes need to be made.

Different lists curated by different people in different places cannot share structure or resources. The lists do not interoperate with each other and they do not interoperate with other lists that might reference the same underlying entities. This is because the official names and codes are often not used or known.

The problems produced by barriers to data sharing are also the same set of problems that emerge when people don’t collaborate, don’t talk to each other or don’t even know about each other. Opportunities are missed and work is duplicated.
