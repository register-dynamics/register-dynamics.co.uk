---
title: "AQuAE: Personal data for cross-Government services"
excerpt: |
  AQuAE is a common pattern and architecture that aims to reduce the risk and raise the quality of personal data sharing by forming a data trust between data and service providers in government for the benefit of the service users.
---
* Contents
{:toc}

As part of the Personal Data Exchange programme run by the Government Digital Service, the UK Government developed a new model of personal data sharing called AQuAE (Attributes, Questions, Answers and Eligibility). It was designed to fix many of the common problems with the sharing of personal data for personalised government services. AQuAE models personal data sharing as a data trust between many participants, auditable by existing security, monitoring and auditing practitioners in government and governed by an independent trustee board.

In the UK, citizens traditionally apply for a public sector service by filling out a form. The form requests all of the information required for the provision of that service, including names, addresses, and whatever else is necessary to show that the citizen is eligible for the service. Showing this eligibility might include some government-conferred status, such as an official acknowledgement of a disability. For services that involve the distribution of public money the bar of assurance is necessarily high and citizens have to submit a lot of information and evidence.

Most digital transformation work on public services has focused on making this information submission easier. This has mainly amounted to digitisation of the existing forms and system design of services to remove information that is no longer necessary in the digital space. Information and evidence submission, though, remains a major burden on citizens – an applicant first has to understand the eligibility criteria for the service, find some official evidence (like a letter) showing their eligibility, and then scan or send this as part of their application.

Clearly, we could do better – it’s not hard to imagine a world where data in a different part of government automatically helps citizens apply. Such ideas have even appeared in manifesto commitments.

### Problems with data sharing

There remains, however, little maturity or common practice in this space and the required data infrastructure remains missing. Where there has been work to link up disparate parts of government through personal data sharing, the methods employed have been custom, expensive and difficult to set-up.

Bulk sharing is where many personal data records are pre-shared before services have been requested by citizens. This type of sharing isn’t proportionate. Personal data is shared before it’s required, so the citizen’s data is made available just because they’re eligible even if they never apply for the service.

Sharing of individual records (via some form of API) is increasingly popular but there are no common products, patterns, architectures or practices, in either the technical or legal and governance spaces. A direct technical connection opens a large surface for cyberattacks and extends the security boundary of the system that holds the data, leaving the data controller with more risk for little reward. When irregular situations occur, it is difficult to detect which records were accessed fraudulently and harder still to work out what the impact of this might have been. In short, a lack of audit information makes the impact of misuse high and costly to cleanup.

The response to this from government departments has been to demand a very heavy assurance process and lots of security controls. Sharing like this means simple functionality costs many hundreds of thousands of pounds to set-up, and so all but the largest services are priced out of access. The long tail of many small but important government services may never be digitised.

There will always be significant risk associated with sending actual data. As discussed previously, it is not good enough to assume that a written contract or agreement prevents misuse. As soon as data leaves the host organisation (either via bulk sharing or via API) they are exposed to significant risk through loss of control and visibility.

The answer is two-fold: minimise what is shared and audit the resulting use. This is the vision of the AQuAE model of personal data sharing.

## Minimise what is shared

AQuAE is a common pattern and architecture that aims to reduce the risk and raise the quality of personal data sharing. It does this by improving data precision and auditability without placing large burdens on the service or data provider.

The way to minimise what data is shared is to meet the direct need of each service by providing data at a high a level as is possible, and to ensure that data only has value for a single, specific use case. For example, instead of a service working out whether a citizen is eligible for a parking permit by receiving minimal data about their disabilities, the correct approach is for each data provider to state the citizen’s eligibility for the permit based on the data that they happen to hold.

If any of the data holders think that the citizen is eligible then the service knows this but it does not know why. Conversely, if the none of the data holders think that the citizen is eligible then the service knows why that citizen is not eligible. This is an elegant solution from a data hiding perspective but it is also a socially useful solution from an algorithmic transparency perspective. The answer isn’t “computer says no”; the answer is “you’re not automatically eligible through these routes, but you might want to consider applying manually through this other route”.

This necessarily flies in the face of common ideas around data re-use. How can a system provide very specific high-level data whilst still being flexible enough to scale? How can a data provider, who only knows low-level attributes about a citizen, provide high-level answers without taking on a large burden of work?

The general approach to this is by modelling sharing through specific, structured, machine-readable eligibility questions. The structure of these questions is rigidly defined to include who is allowed to ask the question and why, what answers can be provided, and what data will be used to compute them. This structure enables the difficult task of auditing every query that takes place to be performed automatically. This question and answer model is also found in similar models like MIT SafeAnswers.

How these questions are defined flexibly for each use case still needs to governed manually. To achieve this, an independent trustee board works with departmental representatives to decide what is and is not an appropriate use of data. The board would comprise subject matter experts and citizens from groups like the Privacy and Consumer Advisory Group.

The trustee board also have a responsibility to perform security and risk assurance on every participant in the trust to a level agreed by all in the trust’s charter. Doing this once for each participant rather than bilaterally between each pair of participants that need to exchange data is far cheaper. It provides an economic incentive to performing data sharing inside the trust as opposed to bilaterally outside it. 

So, the presence of the data trust here has both made data sharing easier whilst ensuring that it will be proportionate and minimal. These two factors combine to mean that the trust incentivises proportionate (and only proportionate) data sharing. This is a virtuous situation – every participant in the trust participates correctly in their own best interest and this participation is good for the trust (and society) as a whole.

## Applying post-audit

The trust is able to pre-audit data sharing by being very specific about how shared data will be processed by which parties and for what purposes. This does not, however, rule out the possibility that data is misused. It still may be possible for a compromised participant to start handing out incorrect answers or asking questions about inappropriate data subjects. The effect of this is clearly dependent on how the data is used, but the economic incentives involved could be high. For example, if an attacker could fraudulent acquire benefit money such a technology system is clearly a target for organised crime. To combat this, a strong model of post-auditing questions and answers is included.

There are several ways in which a system can be compromised. A participant could be compromised by an attacker managing to take over an existing system or by masquerading as one (via stealing security keys, for example). The system could also be susceptible to bribes or blackmail of trusted staff who could perform illegal queries. The post-audit model limits the damage in these situations. It is a risk-based rather than absolute approach to security.

The goal of post-auditing is two-fold: allow compromised systems to be detected and shut down quickly and then allow the fraudulent activity to be identified and undone. In particular, it must allow the system to mitigate persistent, invisible attacks, that would allow an attacker to commit fraud for many hours, days or even weeks without detection. Keeping the exploitation window short limits the economic value of performing an attack and makes the incentives for doing so small.

The post-audit model in AQuAE supports these goals efficiently by using a specialised messaging protocol along with cryptographic log technology to ensure that every participant keeps robust machine-readable logs of all of their activity in the trust. The beneficiaries then use proofs to show that they are logging correctly, take part in a gossip protocol to quickly detect if anyone is lying, and then implement redaction to allow trustees to audit their logs whilst keeping personal data private.

Once a node is compromised, there are multiple ways it might attempt to obscure it’s fraudulent behaviour. Firstly, a compromised system could simply not submit any logs for queries it doesn’t want to record, such as if a service provider starts making illegal queries. Secondly, a compromised system could make up answers or tell different things to different beneficiaries, such as if a query provider ignores the answer it receives from a data authority and passes the service provider something incorrect.

To protect against these possibilities, the post-audit model works in two stages. Firstly, the beneficiaries record every message they send and receive to each other in their log and include information about what is already in the log in every message.

### Stage one: collecting high-quality logs

In order to make the first stage work, beneficiaries need to use a structure for their log that supports two special operations. “Existence proofs” allow the beneficiary to add an item to the log and then hand out a small amount of information that proves it has been added. “Consistency proofs” allow proving that the log is the same as at some earlier time but with some number of items added in between (but none removed or changed). Both of these proofs also require a way for a log to be “versioned”, so that there’s a single number associated with every version of the log.

Whenever a beneficiary sends a message to another it includes, along with the actual message, existence proofs that it has logged the receiver’s last message and the one it’s sending. These proofs ensure that it hasn’t logged something different to what has actually occurred. It also includes a consistency proof of everything since their last communication, showing that it hasn’t changed any of the past log messages.

If a beneficiary fails to provide these proofs (because they’ve tampered with the log or deliberately withheld them), they’re blacklisted and no further communication will occur. They’re prevented from having a long-running attack by making this requirement part of every message that occurs.

### Stage two: reconciling the logs

The first stage ensures there are enough logs present for analysis in the next stage: at a low frequency, the beneficiaries periodically submit their logs to a trustee-run auditor who checks that all the transactions have happened as they should.

The reconciliation involves checking that all logs agree. It also includes less deterministic measures, such as detecting unusual spikes in activity or scrutinising situations in which the citizen wasn’t present (such as a telephone or offline transaction). Because of the structured nature of the question and answer system, this reconciliation can be mainly an automated process.

If the trust decides that the personal information is too sensitive to be accessed by an auditor or stored even in a way that only the auditor can access, the structured nature of the logs means that information can be easily redacted if necessary without compromising the ability to check that the logs agree. This method means the auditors don’t get access to the sensitive personal data (and so don’t require high levels of vetting) but can still perform reconciliation to check that no misuse has been performed.

The problem with submission and reconciliation of logs by trustees is that it’s necessarily slow. Log data captures all of the network traffic and this has to be submitted by every beneficiary, which is a potentially large volume. To maintain a performant network, reconciliation has to be done relatively slowly and infrequently, and this doesn’t meet the requirement of stopping attacks quickly. It’s possible for the participants to use a gossip protocol, where they send a limited amount of information amongst themselves in an intelligent way, for them to all work out that someone is lying.

All of this works together to reduce the audit burden on the trustees as much as possible, and thereby reduce the barrier to doing strong auditing. Certain attacks are prevented from being viable at all. Where audit is still necessary the entire activity of the network can be checked in an automated manner, including identifying both the compromised beneficiary and fraudulent queries if an audit incident is found.
