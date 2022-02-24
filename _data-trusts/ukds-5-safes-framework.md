---
title: The 5 Safes Framework
excerpt: |
  When a data trust contains arbitrary data undergoing arbitrary analysis, it is not always possible or feasible to set up data access mechanisms that are easy to audit, or to perform that audit automatically. The 5 Safes Framework proposes “Safe Settings” where the analysis is brought to the data, rather than the traditional practice of downloading data and analysing it locally. This allows the analysis to be secured and for the results to be audited at the point they leave the control of the trust.
image: "images/bank-vault.jpg"
licenses:
  - "\"Bank vault\" image by [Jonathunder](https://commons.wikimedia.org/wiki/File:WinonaSavingsBankVault.JPG) used under [CC BY-SA 3.0](https://commons.wikimedia.org/w/index.php?curid=5765999)."
  - "This report is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)."
---
In the other case studies, we looked at situations where the problem being solved by data is quite specific. In the [Aquae case](./aquae-model.html), the problem was limited to using existing personal data to improve the experience of a single user applying for a service. This constraint made it possible to define useful technical controls that only allowed data access that fit that shape.

Not all data trusts have such narrow and predefined uses for their data. The Office for National Statistics’ (ONS) [Secure Research Service](https://www.ons.gov.uk/aboutus/whatwedo/paidservices/virtualmicrodatalaboratoryvml) aims to allow people to solve problems that “serve the public good”. In this case, the specific problem being solved isn’t known when the data is given to the ONS. Each research project that will use the data will be solving a different problem and will need to do it in a different way. This makes it difficult to use rigid technology to control the data access.

In general, a data trust might define an outcome that is similarly broad. If data needs to be used freely so that being specific with technical controls isn’t possible, how else can we make data access more safe?

![Bank vault]({{ site.url }}/{{ page.image }})

Here we look at the 5 Safes Framework, a general purpose data access framework developed by the UK Data Service. It is a governance and security framework that a data trust can use to both manage the use of the data that they hold and to give assurances to their data providers that their most sensitive data assets will be managed appropriately.

The ONS and UK Data Service use this framework to provide approved researchers with access to sensitive data that would be otherwise unavailable to them. For example, fine-grained data collected via census might allow individuals to be identified. The framework provides assurance that allows dozens of government departments and other agencies to regularly supply their data. This makes government’s very sensitive data more useful and widely applicable.

At a high-level, the [5 Safes](https://blog.ons.gov.uk/2017/01/27/the-five-safes-data-privacy-at-ons/) aims to address:
* Safe projects: is this use of the data appropriate, lawful, ethical and sensible?
* Safe people: can the researchers be trusted to use it in an appropriate manner?
* Safe data: does the data itself contain sufficient information to allow confidentiality to be breached?
* Safe settings: does the access facility limit unauthorised use or mistakes?
* Safe outputs: are the statistical results non-disclosive?

Safe settings are where technology can be most relevantly applied so that is where we will focus our post. The goal of a safe setting is to keep control of data by bringing researchers to the data, rather than sending out copies of the data that could otherwise be misused.

## Safe settings
Traditionally, a safe setting is a physical location that researchers can enter, with physical controls that ensure they can’t take sensitive data with them when they leave. For example, this might be a secure room with a special computer that doesn't have any USB ports, cannot access the Internet, has a fresh and clean copy of the source data, doesn't allow cross-referencing with any other analysis and is reset back to its initial configuration after a single session in the safe setting.

Whilst inside the safe setting, the researchers may access and manipulate data that would not be safe as an output. This allows them the flexibility to do their best work. When they leave, the material they take with them is checked manually to ensure that its a “safe output”.

Facilities like these are expensive to build and run and require researchers to be physically present. However, they can offer a very high level of assurance of compliance and make very sensitive data much more useful and widely applicable.

The safety of a safe setting can be directly traded off against the sensitivity of the data in it. If the setting is safer then the data available can be more sensitive. If the setting is "published to everyone" then the data safety must meet a high bar.

For them to be widely applicable to data trusts, it must be possible to arrange for a whole range of safe settings, not just "published to everyone" and "secure facility", at affordable prices.

## A spectrum of safety
The Holy Grail would be to find a way to effectively trade off the assurance against the expense to make the safety available in more situations. For example, it might be appropriate to be able to provide a virtual-safe-setting inside a web browser on a corporate device so that data could be used in a regular office.

A handful of existing products have features that may start to address requirements in this fledgling space. For example, at the most light touch end of the spectrum, Adobe’s Acrobat can encrypt documents and restrict what users can do when they open them. Google Docs offers similar functionality that disables the copy and paste, printing and exporting facilities for particular documents. Remote desktop products also have ways to restrict the use of copy and paste to and from the remote machine.

All of these solutions impact the accessibility of the document to users with access needs. The ease with which the restrictions can be worked around varies but all of the common products have well known workarounds that are available to anyone with access to a web search engine. Moreover, as we’ll see below, the restrictions technology alone is not enough to provide the safety.

As the ONS's Secure Research Service has matured, they too have started to use technology to offer at-desk access to data to people who are part of particular government organisations and who meet [particular connection criteria](http://www.bristol.ac.uk/media-library/sites/cmpo/documents/mcivor2018.pdf). The criteria take a holistic view of the tradeoffs within the 5 Safes Framework and by controlling other aspects of the setting, such as the management of the equipment used, they are able to offer a safe service that can also meet the needs of the users. Their five nationwide approved safe settings remain available for other users.

This considerably raises the bar for removing data from the controlled environment. Whilst it doesn't make it impossible, especially for a determined, skillful and deliberate operator, it does stop casual mistakes and provides a conscious decision point where someone remembers the handling guidelines of the data and has to take several active steps to circumvent them. In particular, the governance criteria means that others in the organisation are responsible and incentivised to make sure that operators use the data only in the way it was intended.

Using a “virtual” safe setting extracts more value from the data by providing it safely to more people. However, there is still diligence required in how the other four "safes" are applied and may even raise the assurance required there. As distributed and cross-organisational handling of data becomes more common, more products will be required that allow users to choose their own tradeoffs for safety, accessibility, and security. Deployment and environmental considerations also need to be taken into account as this affects how well the technology can perform in practice.

Using the 5 Safes Framework, a data trust can ensure access and use of its data is meeting the purpose set out in its charter – even in cases where the trust’s purpose is quite broad and problems the data users wish to solve are unknown ahead of time. By applying technology to broaden the access to the safe setting, more value can be derived from the data from more people, thereby increasing the ability of the trust to bring benefit to its beneficiaries.
