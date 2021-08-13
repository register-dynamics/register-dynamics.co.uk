---
title: "Aquae: Personal data for cross-Government services"
excerpt: |
  As part of the Personal Data Exchange programme run by the Government Digital Service, the UK Government developed a new model of personal data sharing called Aquae (Attributes, Questions, Answers and Eligibility). It allows public sector services to reuse personal data from around government whilst maintaining the privacy of data subjects, allowing data controllers to retain control of their data, minimise what is shared and to audit when and how data was used.
image: "digital-services-poster.jpg"
licenses:
  - "\"Digital services poster\" image by [Dafydd Vaughn](https://www.flickr.com/photos/dafyddbach) used under [CC By-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/)."
  - "This report is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)."
---
* Contents
{:toc}

Traditional models of data sharing usually involve providing someone with a copy of the data and then constraining their use of it with a set of legal agreements. This involves a lot of trust, especially when the potential for misuse is high (if motivated by commercial interests, for example) and the likelihood of being caught is low.

Data trusts are often in such a situation: companies want to collaborate with their competitors on a study but the data they hold would be of commercial value if used outside the scope of the study. It is important, therefore, that data trusts are able to audit the use of their data so that participants can prove that the data supplied was only used for the agreed purposes.

The problem with sending data (either via spreadsheet or API) is that data providers lose control and visibility of how their data is used. Without this it is difficult to prove that data has only been used for the purposes that were agreed. If a spreadsheet is sent, for example, all that’s known is that the data user had access to it. What parts of it were used, for what purposes, and who else was given access to it are all completely invisible. [As discussed previously](../), it is not good enough to assume that a written contract or agreement prevents misuse.

As part of the Personal Data Exchange programme run by the Government Digital Service, the UK Government developed a new model of personal data sharing called Aquae (Attributes, Questions, Answers and Eligibility). It allows public sector services to reuse personal data from around government whilst maintaining the privacy of data subjects, allowing data providers to retain control of data they hold, minimise what is shared and to audit when and how data was used.

Aquae arranges for the processing to come to the data. Queries on the data are transmitted in a structured and machine-readable way that encodes the who, what and why of data use. With this in place, two new things are possible. Firstly, data providers (or the trust) can decide ahead of time what data uses are acceptable – just as they would with a paper agreement – and then enforce that using technology. Secondly, the system can ensure that every data use can be logged so that an external audit can take place to check that everyone involved acted properly.

![Poster reading "Digital services so good that people prefer to use them"]({{ site.url }}/{{ page.image }})

## Deciding use ahead of time

Imagine a service that allows a citizen to apply for a disabled parking permit. There are multiple ways to be eligible: the citizen might have mobility issues or might be registered blind. The service needs to know whether the citizen has a disability, and to save time they can let the citizen re-use a recognised assessment that has been performed by another organisation, if they have one.

Because there are multiple ways to be eligible, the service has to engage with multiple data providers – one data provider might know about mobility impairments and another might hold a register of blind people. But to maintain data privacy, what the service learns should be minimal – the only information the service should find out is a yes or no answer about whether the citizen should get a parking permit.

Aquae’s general and novel approach is to model sharing through specific, structured, machine-readable eligibility questions. The structure of these questions is rigidly defined to include who is allowed to ask the question and why, what answers can be provided, and what data will be used to compute them. This structure enables the difficult task of auditing every query that takes place to be performed automatically. This question and answer model is also found in similar models like [MIT SafeAnswers](http://openpds.media.mit.edu/).

Whilst the structure of the questions is rigid, the scope of possible questions is very flexible and these questions are defined for each use case still needs to governed manually. To achieve this, an independent board works with departmental representatives to decide what is and is not an appropriate use of data. The board would comprise subject matter experts and citizens from groups like the [Privacy and Consumer Advisory Group](https://www.gov.uk/government/groups/privacy-and-consumer-advisory-group).

Once the decisions about how to use data have been made, they are encoded into publicly visible metadata. When a data user tries to access data, it sends the eligibility question and the data provider’s technical controls ensure that the use case they’re executing is in the metadata. If it is not, it refuses to reveal anything to the data user. This ensures that the data user has to be specific about what they are using the data for, and can only pick from pre-approved options.

So, this has both made data sharing auditable whilst ensuring that it will be proportionate and minimal. These two factors combine to mean that the trust incentivises proportionate (and only proportionate) data sharing. This is a virtuous situation – everyone participates correctly in their own best interest and this participation is good for society as a whole.

## Auditing data use

Data providers are able to be very specific about how shared data will be processed by which parties and for what purposes. This does not, however, rule out the possibility that data is misused. It still may be possible for a compromised participant to start handing out incorrect answers or asking questions about inappropriate data subjects. The effect of this is clearly dependent on how the data is used, but the economic incentives involved could be high. For example, if an attacker could fraudulently acquire benefit money such a technology system is clearly a target for organised crime. To combat this, a strong model of post-auditing questions and answers is included.

There are several ways in which a system can be compromised. A participant could be compromised by an attacker managing to take over an existing system or by masquerading as one (via stealing security keys, for example). The system could also be susceptible to bribes or blackmail of trusted staff who could perform illegal queries. The post-audit model limits the damage in these situations. It is a risk-based rather than absolute approach to security.

The goal of post-auditing is two-fold: allow compromised systems to be detected and shut down quickly and then allow the fraudulent activity to be identified and undone. In particular, it must allow the system to mitigate persistent, invisible attacks, that would allow an attacker to commit fraud for many hours, days or even weeks without detection. Keeping the exploitation window short limits the economic value of performing an attack and makes the incentives for doing so small.

The post-audit model in Aquae supports these goals efficiently by using a specialised messaging protocol along with cryptographic log technology to ensure that every participant keeps robust machine-readable logs of all of their activity in the trust. The beneficiaries then use _cryptographic proofs_ to show that they are logging correctly, take part in a _gossip protocol_ to quickly detect if anyone is lying, and then implement _redaction_ to allow trustees to audit their logs whilst keeping personal data private.

Once a node is compromised, there are multiple ways it might attempt to obscure it’s fraudulent behaviour. Firstly, a compromised system could simply not submit any logs for queries it doesn’t want to record, such as if a service provider starts making illegal queries. Secondly, a compromised system could make up answers or tell different things to different beneficiaries, such as if a query provider ignores the answer it receives from a data authority and passes the service provider something incorrect.

To protect against these possibilities, the post-audit model works in two stages. Firstly, the beneficiaries record every message they send and receive to each other in their log and include information about what is already in the log in every message.

### Stage one: collecting high-quality logs

In order to make the first stage work, beneficiaries need to use a structure for their log that supports two special operations. “Existence proofs” allow the beneficiary to add an item to the log and then hand out a small amount of information that proves it has been added. “Consistency proofs” allow proving that the log is the same as at some earlier time but with some number of items added in between (but none removed or changed). Both of these proofs also require a way for a log to be “versioned”, so that there’s a single number associated with every version of the log.

Whenever a beneficiary sends a message to another it includes, along with the actual message, existence proofs that it has logged the receiver’s last message and the one it’s sending. These proofs ensure that it hasn’t logged something different to what has actually occurred. It also includes a consistency proof of everything since their last communication, showing that it hasn’t changed any of the past log messages.

If a beneficiary fails to provide these proofs (because they’ve tampered with the log or deliberately withheld them), they’re blacklisted and no further communication will occur. They’re prevented from having a long-running attack by making this requirement part of every message that occurs.

### Stage two: reconciling the logs

The first stage ensures there are enough logs present for analysis in the next stage: at a low frequency, the beneficiaries periodically submit their logs to a trustee-run auditor who checks that all the transactions have happened as they should.

The reconciliation involves checking that all logs agree. It also includes less deterministic measures, such as detecting unusual spikes in activity or scrutinising situations in which the citizen wasn’t present (such as a telephone or offline transaction). Because of the structured nature of the question and answer system, this reconciliation can be mainly an automated process.

If the trust decides that the personal information is too sensitive to be accessed by an auditor or even stored in a way that only the auditor can access, the structured nature of the logs means that information can be [easily redacted](https://github.com/benlaurie/objecthash) if necessary without compromising the ability to check that the logs agree. This method means the auditors don’t get access to the sensitive personal data (and so don’t require high levels of vetting) but can still perform reconciliation to check that no misuse has been performed.

The problem with submission and reconciliation of logs by trustees is that it’s necessarily slow. Log data captures all of the network traffic and this has to be submitted by every beneficiary, which is a potentially large volume. To maintain a performant network, reconciliation has to be done relatively slowly and infrequently, and this doesn’t meet the requirement of stopping attacks quickly. It’s possible for the participants to use a gossip protocol, where they send a limited amount of information amongst themselves in an intelligent way, for them to all work out that someone is lying.

All of this works together to reduce the audit burden on the trustees as much as possible, and thereby reduce the barrier to doing strong auditing. Certain attacks are prevented from being viable at all. Where audit is still necessary the entire activity of the network can be checked in an automated manner, including identifying both the compromised beneficiary and fraudulent queries if an audit incident is found.
