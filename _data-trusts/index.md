---
title: Putting the trust in data trusts
layout: report-index
image: "images/Data-trust-social-card.png"
excerpt: |
  In order to be able to offer compelling advantages, the control and enforcement powers that data trusts have needs to be high enough that misusing the data in trust is prohibitively difficult. By examining case studies in audit technology, our purpose is to show that cost-effective strong auditing is possible today and encourage others to build things that reduce the cost further in the future.

  ![Open Data Institute](/images/odi-logo.svg)
menu:
  Case studies:
    - certificate-transparency-and-deepmind
    - aquae-model
    - ukds-5-safes-framework
  Technology:
    - merkle-trees
    - realising-external-audit
acknowledgements: |
  This report was produced as part of a [data trusts project](http://theodi.org/data-trusts) funded by the UK Government's [Office for Artificial Intelligence](https://twitter.com/OfficeForAI) and [Innovate UK](https://www.gov.uk/government/organisations/innovate-uk). It builds on research from the ODI's Innovation programme funded by Innovate UK. The views in this report are those of the authors.

  We would like to thank [Rachel Wilson](https://uk.linkedin.com/in/rachel-wilson-739b2630), [Olivier Thereaux](https://twitter.com/olivierthereaux), [Celia Killen](https://twitter.com/celiakillen) and [Peter Wells](https://twitter.com/peterkwells) for their feedback and support.

  ![Open Data Institute](/images/odi-logo.svg)
licenses:
  - "This report is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)."
---

Data trusts have shown themselves to have [many and varied potential benefits](https://theodi.org/data-trusts): they can increase collaboration, make data use more transparent and accountable, and unlock potential economic value of data through making it more available. The independence and legally binding responsibilities of the data trust’s trustees lets them balance economic incentives with social responsibilities and bring about data sharing that delivers on the data trust's purposes and works for everyone: data users, data providers and society as a whole.

We do not get these benefits for free – the extra governance of a data trust comes with a cost. For data trusts to be successful, the benefits need to not only outweigh the costs but also be so good that data trusts significantly outperform other methods of sharing data. We believe that in order to be able to offer these compelling advantages, the control and enforcement powers that trustees have needs to be high – high enough that misusing the data in trust is prohibitively difficult.

## When data sharing goes wrong

We don't have to look far to see examples of data sharing going badly wrong. "Cambridge Analytica" has become a household name associated with misuse of personal information and breach of public trust. The UK Government also got into hot water over [the sharing of NHS health data with the Home Office for immigration enforcement purposes](https://www.opendemocracy.net/en/ournhs/is-our-personal-data-fair-game-in-drive-to-create-theresa-may-s-hostile-environment-f/) in the Windrush scandal.

Having a contract or agreement between data providers and data users has frequently been shown to be insufficient. In the Cambridge Analytica example, the contract terms were completely ignored and personal data was misused. [Facebook's defence](https://www.theguardian.com/us-news/2015/dec/11/senator-ted-cruz-president-campaign-facebook-user-data) was that the parties involved had acted outside of the terms of the data share and Facebook was therefore not at fault. The lack of any hard, technical evidence may deprive courts of useful information and has made it difficult for regulators, politicians, journalists and the general public to understand what happened.

This doesn't give much confidence to individuals – without proactive enforcement of their terms, it is difficult to see how Facebook will prevent this behaviour from occurring again.

Traditionally, our most valuable assets have been financial and severe penalties for mismanaging them have been enforced. Over the last 20 years, data has become almost equivalently valuable. The best technique that society has come up with for holding people to account whilst they look after our most valuable assets is _auditing_.

Management of financial assets is subject to the most intense scrutiny – auditing is an expert profession into which a high level of trust is placed. As data continues to become more valuable, we will require a means to audit its use – a way to actually check how data is used and whether this matches what we expect. Data subjects need sharing to be audited to have confidence that if their data is misused, it can be stopped quickly and the impact understood.

## Reputation is everything

[Facebook's reputation suffered greatly](https://www.bbc.com/news/business-43462423) from the negative publicity despite their claims of innocence. Clearly, organisations looking to do similar data sharing are concerned about their own reputation and corporate risk. Their response to this has been to increase their assurance processes which are time-consuming and expensive. If they were able to audit and know categorically that their sharing partners and their own employees were not acting improperly – and to show that this was the case – the associated impact could be dramatically lower and they could save time and energy. Showing this could consist of publicly publishing some information or by being vouched for by an auditor.

Reputation usually comes from someone vouching that a person has conducted themselves properly in the past. In the case of high value financial transactions, the person doing the vouching is usually an external auditor. The auditor needs to be convinced that the conduct was proper even though they were not there to witness it first-hand. As the auditor is a professional who is expert in financial matters, when they vouch for a person they bolster that person's reputation in a meaningful way.

The financial records of the person or institution they are auditing, along with supporting records from other institutions such as customers, suppliers and banks, provide the hard evidence for the audit. If the data-use records of a data trust can be made robust and complete enough to be auditable then [external audit can provide similar reputational benefits](https://www.register-dynamics.co.uk/2019/01/04/data-trusts.html) to data providers and data users in data handling circles. This will make data trusts, and similar collaborative  approaches like data cooperatives, the vehicle of choice for data sharing and over time people who choose not to use them will miss out on reputational benefits and will look like they have questionable behaviour to hide.

In addition to all of this, it is important for trustees to be able to build their own reputation and show that they are fulfilling their purpose. Risk that the data providers or data users in the trust can misbehave in an invisible manner is reputational risk for the trustee. Being able to audit the activity on the data in trust is the most effective way to reduce this risk to their reputation.

## Making audit practical

Audit brings benefits to everyone – beneficiaries, trustees and the general public – but no-one will choose to do something that isn't pragmatic. On the surface, it is difficult to imagine how an audit process could work that wouldn't require as much effort put in as the original data use itself. These benefits can only be unlocked if actually doing auditing represents a good return on the time and effort involved.

Enabling reliable and repeatable audit to be automated (and therefore cost-effective) is exactly the end goal of audit technology. The vision is to allow trustees or specialist auditors to have a complete view of the who, what and, most importantly, why of data use – something that would otherwise be too burdensome to be realistic.

The field is still developing. We are not yet near a general solution or mature set of methods. External audit of data use has to date not been widespread, and data trusts offer some of the first real world requirements for this. Hence, there hasn’t yet been significant demand to commoditise the technology out of the costly research and development space and into the product space.

However, lots of progress has been made by custom-designed solutions for specific problems and in identifying patterns that can be reused. We will examine some of these solutions as case studies. Our purpose is to show that strong auditing is possible today and encourage others to build things that reduce the cost further in the future. With better audit unlocked for more use cases, data trusts can fulfil their potential as a powerful model that allows organisations to make better use of their data whilst still ensuring appropriate use of and confidentiality of the sensitive data that’s involved.
