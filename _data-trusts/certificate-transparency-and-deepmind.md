---
title: Certificate Transparency and DeepMind Health
excerpt: |
  With their work on Certificate Transparency, Google engineers Emilia Kasper, Adam Langley and Ben Laurie have shown that it is possible to link rigid technical trust with fuzzy social trust. Their solution does this without needing more trust in new parties and without needing to change existing power structures, making pragmatic audit possible and easy to adopt.
image: "key-wall.jpg"
licenses:
  - "\"Manufactured security\" image by [kris krüg](https://www.flickr.com/photos/kk) used under [CC-BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0)."
  - "This report is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)."
---
* Contents
{:toc}

After 25 years of use and a series of [attacks](https://threatpost.com/final-report-diginotar-hack-shows-total-compromise-ca-servers-103112/77170/), compromises and [misbehaviour](https://security.googleblog.com/2016/10/distrusting-wosign-and-startcom.html) of major certificate authorities, the SSL/TLS certificate system used to secure HTTPS was showing its age. Structural flaws in the way that certificates were issued and managed were well known and several problems had been seen in the wild.

Whilst originally aimed at e-commerce on the web, SSL and its successor TLS were now the mainstay of security for millions of web browser users. Things had changed: now, the rise of web-based email services like Hotmail and Gmail meant nation state adversaries targeting the inboxes of dissidents or even journalists were a threat. The technical protocols had proven difficult to evolve and the large number of certificate vendors meant that starting from scratch with a new certificate issuance process would not be viable.

![Wall of keys]({{ site.url }}/{{ page.image }})

Created in 2011 and [standardised by the IETF](https://tools.ietf.org/html/rfc6962) in 2013, [Certificate Transparency](https://www.certificate-transparency.org/) is Google's effort to improve trust in the SSL Certificate ecosystem. It is a specially designed technical solution to audit the activity of certificate vendors, and is one of the first examples of applying technology to enable strong, foolproof, external auditing. The work was later applied by DeepMind who used the same audit techniques to look after data from the UK's National Health Service (NHS).

Data trusts are a formal multi-party legal pattern developed for data, and establishing trust between parties is critical. Being able to augment existing processes with security and audit controls to establish trust is of specific interest to data trusts. With their work on Certificate Transparency, Google engineers Emilia Kasper, Adam Langley and Ben Laurie have shown that it is possible to link up rigid technical trust with fuzzy social trust. Their solution does this without needing more trust in new parties and without needing to change existing power structures, making pragmatic audit possible and easy to adopt.

## Issuing certificates

Certificate Authorities issue certificates to their customers to allow web users to be confident that when they visit a secure webpage the entity on the other end is really who they claim to be. A valid certificate ensures that a malicious entity cannot insert themselves between a user and a website, claim to be (for example) the user’s bank, and then collect their private banking details.

Certificate authenticity relies on a hierarchy of trust. Certificates for websites might be issued by an intermediate authority, which is itself issued by another authority. All of the certificates eventually lead back to one of many root certificate authorities who are well-known corporations with tight security controls and are assumed to be absolutely trustworthy.

If this absolute trust is in doubt, the entire model is at risk of falling apart. If a certificate authority could be coerced or tricked into giving out false certificates, even for a very short period of time, users could no longer have trust that their private communications were not being intercepted.

## Logging certificates

Under Certificate Transparency, certificate authorities issue certificates to their customers as they always have but also send them to be included in a publicly available "log". When a browser wants to check the validity of a certificate, after performing all its usual checks, it now also checks for the existence of that certificate in one of the logs.

The result of this is that if a certificate is issued by a certificate authority it has to be publicly announced. This means that a certificate authority cannot be coerced into privately issuing a valid certificate for, say, gmail.com, to someone who wants to perform a man-in-the-middle attack on an inbox. If such a certificate was to be issued, it would appear in the log where everyone would be able to see it. If it did not appear in the log then web browsers would reject it. Certificate Transparency ensures that if a certificate is shown to someone then it is shown to everyone and becomes a matter of irrefutable public record.

The log also acts as a more general system of record for which certificates were issued and when. If a certificate authority is later discovered to have been issuing certificates without performing the proper checks (e.g. that the person the certificate is issued to controls the domain the certificate is issued for) then all other certificates from that authority can be retrieved from the log and checked.

This is the principle of "trust but verify". The certificate authorities are trusted to go about their business as they always have but if that trust is later shown to have been misplaced, there is an audit log that is robust enough to allow all of their actions to be independently verified. The public nature of the log also makes it both possible and easy for domain owners to monitor all the certificates that get issued for their domains, giving them confidence that their private business with their users has remained private.

## Making audit pragmatic

The practices and business models in the certificate ecosystem were already firmly established. Any changes to them would require agreement amongst thousands of companies and coordinated changes in a lot of software. Instead, the successful approach taken by Certificate Transparency was to design audit as a “bolt-on” that would work with and augment the existing processes.

A naïve implementation of this would have needed new organisations with new powers and trust to be established. An example of this could be a new hierarchy of trusted organisations, federated and organised much like the existing Certificate Authority arrangements. Such an implementation would require a large amount of social capital to implement and could be rejected by any of the incumbent certificate authorities or browser vendors.

Instead, a self-reinforcing, opt-in arrangement was devised that could be adopted gradually as people saw the benefits. Even in the earliest days of the new system, players taking part would still receive benefit – certificate coverage doesn’t need to be complete for the system to work. As more adoption occured, more benefits would accrue and not opting-in would make less and less sense.

Certificate authorities are incentivised to submit their data to a log – from 2015 onwards, Google’s Chrome web browser has required all “Extended Verification” certificates to be in a log, otherwise they would be regarded as invalid. After a recent exposure of certificates issued incorrectly, [browser vendors have forced Symantec](https://www.bankinfosecurity.com/google-outlines-plan-to-reject-symantecs-digital-certificates-a-9795) to submit all their certificates regardless of verification level. This is a large and obvious incentive to their continued business in this space.

## Privacy implications

Certificate data is not private or particularly sensitive and it has traditionally been spread sparsely around the Internet. A visitor only receives a certificate for a particular website when they visit that site. Web crawlers, such as those used by search engines, are one of the few programs that try to visit every site on the web. This means that, traditionally, only search engine companies have had a good view of the certificate dataset as a whole.

Algorithms can extract insights from the dataset about the certificate authority market as well as the certificate renewal habits of individual systems administrators. For example, SSL certificates contain a field called "Subject Alternative Name" that often lists the names of other websites that are hosted on the same server or IP address. This can be used to [discover non-public subdomains that might be more vulnerable to hacking](https://arxiv.org/pdf/1809.08325) and for malicious scanning of "new" servers. As a whole, this dataset is more sensitive than the sum of its parts.

Certificate Transparency changes things because now there is a small number of publicly available log servers that will soon list every certificate issued for every domain. This isn't just a difference in the *degree* of access – this is a difference in the *kind* of access. It is now feasible to perform analysis on that dataset at a price point that wasn't previously affordable by most people.

Companies such as Cloudflare have [overtly stated their vision](https://ct.cloudflare.com/about) for using Certificate Transparency data for commercial purposes. The impact of this usage on the community and ecosystem remains to be seen.

## DeepMind Health

In 2016 DeepMind started using the same audit technology to develop [secure and verifiable ways of using shared NHS health data](https://deepmind.com/blog/trust-confidence-verifiable-data-audit/). The same principle was applied as in Certificate Transparency: arrange for all data activity to be logged, and then use the logs to audit the activity. In this case, data access of patient records would be logged and then the auditing would be carried out, not in the public domain, but by specialist auditors in recognised institutions.

DeepMind talked about possible extensions to the system that would allow slices of the log to be given out to individual patients, showing them exactly how their data has been used. Using publicly released metadata, patients could verify that the data released to them was accurate.

Despite being a more private and centralised system than Certificate Transparency, DeepMind were still interested in using the same high-strength audit technology. Their desire to do this, we believe, was two fold.

Firstly, they recognised that patient records are some of the most sensitive data around. In order to give confidence to patients and patients and ethics boards that their use was appropriate they would need to build in controls to show that no data had been used improperly, deliberately or otherwise.

Secondly, they could unlock reputational benefits for themselves as a responsible data user by having an independent auditor vouch for their good standing. In the eyes of the NHS, future clients and the general public, their reputation for being able to safely realise value from latent data would be enhanced.

However, despite promises to build in the open, no more about this was ever said publicly. No examples of how to handle subsets or summaries of private data ever appeared in the open source Trillian project that they intended to use to implement their design.

DeepMind and Google have found themselves the subject of much discussion in the press about how to show the proprietary and ethics of their data and AI programmes. They have also been the target of difficult questions about how they intend to move forward with their work. They have also [consistently had difficulty](https://www.theverge.com/2019/4/4/18296113/google-ai-ethics-board-ends-controversy-kay-coles-james-heritage-foundation) in applying independent ethical oversight to their activities.

There is no doubt that DeepMind have a team that can make a massive and substantial contribution to medical science. As a society, we would be failing if we were unable to allow them to do so. There is also no doubt that they can bring the expertise to bear to implement the ideas that they talk about around verifiable audit.

We hope that they continue their work in this area – and we encourage others to do the same – for the benefits it could bring to society and the research opportunities that solid reputations could unlock across the industry as a whole.
